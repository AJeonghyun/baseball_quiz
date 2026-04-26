import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'app_ui.dart';

class ExplanationPage extends StatelessWidget {
  final String explanation;
  final Color teamColor;

  const ExplanationPage({
    super.key,
    required this.explanation,
    required this.teamColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.background,
      appBar: AppBar(
        title: const Text('문제 해설'),
        backgroundColor: teamColor,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.screen),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppCard(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FaIcon(
                      FontAwesomeIcons.lightbulb,
                      color: AppPalette.warning,
                      size: 26,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        '왜 이 답이 맞는지 확인해보세요.',
                        style: TextStyle(
                          fontSize: 20,
                          height: 1.35,
                          fontWeight: FontWeight.bold,
                          color: teamColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              Expanded(
                child: AppCard(
                  child: SingleChildScrollView(
                    child: Text(
                      explanation,
                      style: const TextStyle(
                        fontSize: 17,
                        height: 1.7,
                        color: AppPalette.text,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: teamColor,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(0, 52),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text('돌아가기', style: TextStyle(fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
