import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class QuoteCard extends StatefulWidget {
  final Color teamColor;
  const QuoteCard({super.key, required this.teamColor});

  @override
  State<QuoteCard> createState() => _QuoteCardState();
}

class _QuoteCardState extends State<QuoteCard>
    with SingleTickerProviderStateMixin {
  String quote = "";
  String author = "";
  int currentIndex = 0;

  late AnimationController _controller;
  late Animation<double> _fade;

  List<Map<String, String>> _quotes = [];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _loadQuotes();
  }

  Future<void> _loadQuotes() async {
    final jsonStr = await rootBundle.loadString('assets/quotes.json');
    final List<dynamic> jsonData = json.decode(jsonStr);

    _quotes = jsonData
        .map<Map<String, String>>((q) => {
              "quote": q["quote"].toString(),
              "author": q["author"].toString(),
            })
        .toList();

    _showNextQuote();
  }

  void _showNextQuote() {
    if (_quotes.isEmpty) return;

    final next = _quotes[currentIndex];

    setState(() {
      quote = next["quote"]!;
      author = next["author"]!;
    });

    _controller.forward(from: 0);

    currentIndex = (currentIndex + 1) % _quotes.length;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.teamColor;

    return GestureDetector(
      onTap: _showNextQuote,
      child: FadeTransition(
        opacity: _fade,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 24),
          margin: const EdgeInsets.only(top: 16, bottom: 24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.2),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
            border: Border.all(color: color.withOpacity(0.3)),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.format_quote, size: 28, color: color),
                  const SizedBox(width: 8),
                  Text(
                    "오늘의 야구 명언",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                '"$quote"',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  height: 1.6,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "- $author -",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: color,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
