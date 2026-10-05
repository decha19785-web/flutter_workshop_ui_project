import 'package:flutter/material.dart';

import '../widgets/orange_ui_components.dart';
import 'e03_page_ui.dart';
import 'e05_page_ui.dart';

class E04PageUI extends StatelessWidget {
  const E04PageUI({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return OrangePageShell(
      child: Column(
        children: [
          const OrangeHeader(height: 255),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 24, 30, 22),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Forgot your password?',
                    style: TextStyle(
                      fontSize: 18,
                      color: inkColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Enter email address',
                    style: TextStyle(fontSize: 12, color: inkColor),
                  ),
                  const SizedBox(height: 13),
                  OrangeInputField(
                    hintText: 'Email address',
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    validator: (value) {
                      if (value == null || !value.contains('@')) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 14),
                  OrangeActionButton(
                    label: 'Send code',
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        openOrangePage(context, const E05PageUI());
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 90),
          OrangeFooterLink(
            prompt: "Don't have an Account? ",
            actionLabel: 'Create Account',
            onTap: () => openOrangePage(context, const E03PageUI()),
          ),
          const SizedBox(height: 18),
        ],
      ),
    );
  }
}