import 'package:flutter/material.dart';

import 'app_ui.dart';

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
      backgroundColor: AppPalette.background,
      appBar: AppBar(
        title: Text(widget.term),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.screen),
          children: [
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppPill(
                    label: '용어',
                    selected: true,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.term,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      color: AppPalette.primary,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    widget.desc,
                    style: const TextStyle(
                      fontSize: 17,
                      height: 1.65,
                      color: AppPalette.text,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
