import 'package:flutter/material.dart';

import '../widgets/orange_ui_components.dart';
import 'e05_page_ui.dart';

class E03PageUI extends StatelessWidget {
  const E03PageUI({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return OrangePageShell(
      child: Column(
        children: [
          const OrangeHeader(height: 180),
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 8, 28, 22),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const OrangeFormHeading(
                    title: 'Register',
                    subtitle: 'Create your new account',
                  ),
                  const SizedBox(height: 16),
                  OrangeInputField(
                    hintText: 'Name',
                    textInputAction: TextInputAction.next,
                    validator: (value) => value == null || value.trim().isEmpty
                        ? 'Please enter your name'
                        : null,
                  ),
                  const SizedBox(height: 8),
                  OrangeInputField(
                    hintText: 'E-mail',
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || !value.contains('@')) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  OrangeInputField(
                    hintText: 'Phone',
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    validator: (value) => value == null || value.trim().isEmpty
                        ? 'Please enter your phone number'
                        : null,
                  ),
                  const SizedBox(height: 8),
                  OrangeInputField(
                    hintText: 'Password',
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    validator: (value) => value == null || value.length < 8
                        ? 'Use at least 8 characters'
                        : null,
                  ),
                  const SizedBox(height: 10),
                  const Text.rich(
                    TextSpan(
                      style: TextStyle(fontSize: 10, color: inkColor),
                      children: [
                        TextSpan(text: 'By signing up you agree to our '),
                        TextSpan(
                          text: 'Terms & Conditions',
                          style: TextStyle(color: orangeDarkColor),
                        ),
                        TextSpan(text: ' and '),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(color: orangeDarkColor),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  OrangeActionButton(
                    label: 'Sign Up',
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        openOrangePage(context, const E05PageUI());
                      }
                    },
                  ),
                  const SizedBox(height: 14),
                  const OrangeOrDivider(),
                  const SizedBox(height: 12),
                  const OrangeSocialOptions(),
                  const SizedBox(height: 12),
                  OrangeFooterLink(
                    prompt: 'Already have an Account? ',
                    actionLabel: 'Log In',
                    onTap: () => Navigator.of(context).maybePop(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}