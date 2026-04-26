import 'package:flutter/material.dart';

class AppPalette {
  static const background = Color(0xFFF7F5F0);
  static const surface = Colors.white;
  static const surfaceMuted = Color(0xFFF0EEE8);
  static const primary = Color(0xFF163B63);
  static const accent = Color(0xFFD54B2A);
  static const text = Color(0xFF171717);
  static const textMuted = Color(0xFF5F6670);
  static const border = Color(0xFFE3DED4);
  static const success = Color(0xFF2F7D55);
  static const successSoft = Color(0xFFEAF4EE);
  static const error = Color(0xFFC8463A);
  static const errorSoft = Color(0xFFF8E7E4);
  static const warning = Color(0xFFC98922);
  static const warningSoft = Color(0xFFFFF2D7);
}

class AppSpacing {
  static const screen = 20.0;
  static const card = 18.0;
  static const section = 24.0;
  static const item = 12.0;
}

class AppCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  final Color color;
  final BorderSide border;

  const AppCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding = const EdgeInsets.all(AppSpacing.card),
    this.color = AppPalette.surface,
    this.border = const BorderSide(color: AppPalette.border),
  });

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(16);
    final content = Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: radius,
        border: Border.fromBorderSide(border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.035),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );

    if (onTap == null) return content;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: radius,
        onTap: onTap,
        child: content,
      ),
    );
  }
}

class AppSectionHeader extends StatelessWidget {
  final String title;
  final String? subtitle;

  const AppSectionHeader({
    super.key,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w800,
                color: AppPalette.text,
              ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 4),
          Text(
            subtitle!,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppPalette.textMuted,
                  height: 1.45,
                ),
          ),
        ],
      ],
    );
  }
}

class AppPill extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback? onTap;
  final Color accent;

  const AppPill({
    super.key,
    required this.label,
    required this.selected,
    this.onTap,
    this.accent = AppPalette.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(999),
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
          decoration: BoxDecoration(
            color:
                selected ? accent.withValues(alpha: 0.12) : AppPalette.surface,
            borderRadius: BorderRadius.circular(999),
            border: Border.all(
              color: selected ? accent : AppPalette.border,
              width: 1,
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: selected ? accent : AppPalette.textMuted,
              fontSize: 14,
              fontWeight: selected ? FontWeight.w800 : FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

class AppStatePanel extends StatelessWidget {
  final IconData icon;
  final String title;
  final String message;
  final String? actionLabel;
  final VoidCallback? onAction;

  const AppStatePanel({
    super.key,
    required this.icon,
    required this.title,
    required this.message,
    this.actionLabel,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.screen),
        child: AppCard(
          color: AppPalette.surface,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: AppPalette.primary, size: 34),
              const SizedBox(height: 14),
              Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: AppPalette.text,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                message,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppPalette.textMuted,
                      height: 1.5,
                    ),
              ),
              if (actionLabel != null && onAction != null) ...[
                const SizedBox(height: 18),
                FilledButton(
                  onPressed: onAction,
                  child: Text(actionLabel!),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

InputDecoration appSearchDecoration(String hint,
    {Color accent = AppPalette.primary}) {
  return InputDecoration(
    hintText: hint,
    prefixIcon: Icon(Icons.search_rounded, color: accent),
    filled: true,
    fillColor: AppPalette.surface,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: AppPalette.border),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: accent, width: 1.4),
    ),
    hintStyle: const TextStyle(color: AppPalette.textMuted),
  );
}
