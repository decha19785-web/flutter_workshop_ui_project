import 'package:flutter/material.dart';

import '../widgets/orange_ui_components.dart';
import 'e02_page_ui.dart';

class E01PageUI extends StatelessWidget {
  const E01PageUI({super.key});

  @override
  Widget build(BuildContext context) {
    return OrangePageShell(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/img_orange1.png',
              height: 460,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 6),
            const Text(
              'ORANGE JUICE',
              style: TextStyle(
                color: inkColor,
                fontSize: 24,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 9),
            const Text(
              'A moment of healthy life',
              style: TextStyle(
                color: mutedColor,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'The best vitamin for your health',
              style: TextStyle(color: mutedColor, fontSize: 12),
            ),
            const SizedBox(height: 34),
            OrangeActionButton(
              label: 'Explore Now',
              icon: Icons.arrow_forward_rounded,
              onPressed: () => openOrangePage(context, const E02PageUI()),
            ),
          ],
        ),
      ),
    );
  }
}