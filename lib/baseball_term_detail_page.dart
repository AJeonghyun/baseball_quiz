import 'package:flutter/material.dart';

class BaseballTermDetailPage extends StatefulWidget {
  final String term;
  final String desc;

  const BaseballTermDetailPage({
    super.key,
    required this.term,
    required this.desc,
  });

  @override
  State<BaseballTermDetailPage> createState() => _BaseballTermDetailPageState();
}

class _BaseballTermDetailPageState extends State<BaseballTermDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.term),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.term,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              widget.desc,
              style: const TextStyle(fontSize: 18, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
