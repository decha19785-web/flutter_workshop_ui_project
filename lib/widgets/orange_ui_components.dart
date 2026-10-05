import 'dart:math' as math;

import 'package:flutter/material.dart';

const orangeColor = Color(0xFFF7941D);
const orangeDarkColor = Color(0xFFED8610);
const canvasColor = Color(0xFFF5F5F5);
const inkColor = Color(0xFF171717);
const mutedColor = Color(0xFF777777);

void openOrangePage(BuildContext context, Widget page) {
  FocusManager.instance.primaryFocus?.unfocus();
  Navigator.of(context).push(
    MaterialPageRoute<void>(builder: (_) => page),
  );
}

class OrangePageShell extends StatelessWidget {
  const OrangePageShell({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: canvasColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = math.min(constraints.maxWidth, 430.0);
            return Center(
              child: SizedBox(
                width: width,
                height: constraints.maxHeight,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: width < constraints.maxWidth
                        ? const [
                            BoxShadow(
                              color: Color(0x12000000),
                              blurRadius: 24,
                              offset: Offset(0, 8),
                            ),
                          ]
                        : null,
                  ),
                  child: SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: child,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class OrangeHeader extends StatelessWidget {
  const OrangeHeader({
    super.key,
    this.height = 220,
    this.showBackButton = true,
  });

  final double height;
  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/img_orange2.png',
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
          if (showBackButton)
            Positioned(
              top: 16,
              left: 20,
              child: Material(
                color: Colors.white.withValues(alpha: 0.72),
                shape: const CircleBorder(),
                child: IconButton(
                  onPressed: () => Navigator.of(context).maybePop(),
                  tooltip: 'Back',
                  icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 16),
                  color: orangeDarkColor,
                  visualDensity: VisualDensity.compact,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class OrangeInputField extends StatefulWidget {
  const OrangeInputField({
    super.key,
    required this.hintText,
    this.controller,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.validator,
    this.onSubmitted,
  });

  final String hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onSubmitted;

  @override
  State<OrangeInputField> createState() => _OrangeInputFieldState();
}

class _OrangeInputFieldState extends State<OrangeInputField> {
  late bool _obscured = widget.obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscured,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      validator: widget.validator,
      onFieldSubmitted: widget.onSubmitted,
      style: const TextStyle(fontSize: 14, color: inkColor),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(fontSize: 12, color: Color(0xFF9B9B9B)),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFD5D5D5)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFD5D5D5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: orangeColor, width: 1.4),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.redAccent, width: 1.4),
        ),
        errorStyle: const TextStyle(fontSize: 10, height: 1.2),
        suffixIcon: widget.obscureText
            ? IconButton(
                onPressed: () => setState(() => _obscured = !_obscured),
                tooltip: _obscured ? 'Show password' : 'Hide password',
                icon: Icon(
                  _obscured
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  size: 18,
                  color: mutedColor,
                ),
              )
            : null,
        suffixIconConstraints: const BoxConstraints(
          minWidth: 42,
          minHeight: 42,
        ),
      ),
    );
  }
}

class OrangeActionButton extends StatelessWidget {
  const OrangeActionButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
  });

  final String label;
  final VoidCallback onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: orangeColor,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            ),
            if (icon != null) ...[
              const SizedBox(width: 10),
              Icon(icon, size: 20),
            ],
          ],
        ),
      ),
    );
  }
}

class OrangeFormHeading extends StatelessWidget {
  const OrangeFormHeading({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 23,
            height: 1.2,
            color: inkColor,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 13, color: inkColor),
        ),
      ],
    );
  }
}

class OrangeOrDivider extends StatelessWidget {
  const OrangeOrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: Divider(color: Color(0xFFFFC98B), height: 1)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text('OR', style: TextStyle(fontSize: 12, color: inkColor)),
        ),
        Expanded(child: Divider(color: Color(0xFFFFC98B), height: 1)),
      ],
    );
  }
}

class OrangeSocialOptions extends StatelessWidget {
  const OrangeSocialOptions({super.key});

  @override
  Widget build(BuildContext context) {
    const providers = [
      ('Google', 'assets/images/img_g.png'),
      ('Facebook', 'assets/images/img_f.png'),
      ('Apple', 'assets/images/img_a.png'),
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (final (name, asset) in providers)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Semantics(
              button: true,
              label: 'Continue with $name',
              child: InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('$name sign-in is not connected yet.'),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(24),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Image.asset(asset, width: 26, height: 26),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class OrangeFooterLink extends StatelessWidget {
  const OrangeFooterLink({
    super.key,
    required this.prompt,
    required this.actionLabel,
    required this.onTap,
  });

  final String prompt;
  final String actionLabel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(prompt, style: const TextStyle(fontSize: 11, color: inkColor)),
        TextButton(
          onPressed: onTap,
          style: TextButton.styleFrom(
            foregroundColor: orangeDarkColor,
            padding: const EdgeInsets.symmetric(horizontal: 3),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            actionLabel,
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
