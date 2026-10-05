import 'package:flutter/material.dart';

import '../widgets/orange_ui_components.dart';
import 'e03_page_ui.dart';
import 'e04_page_ui.dart';

class E02PageUI extends StatefulWidget {
  const E02PageUI({super.key});

  @override
  State<E02PageUI> createState() => _E02PageUIState();
}

class _E02PageUIState extends State<E02PageUI> {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() {
    if (!(formKey.currentState?.validate() ?? false)) {
      return;
    }

    openOrangePage(context, const E03PageUI());
  }

  @override
  Widget build(BuildContext context) {
    return OrangePageShell(
      child: Column(
        children: [
          const OrangeHeader(height: 238),

          Padding(
            padding: const EdgeInsets.fromLTRB(28, 12, 28, 24),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const OrangeFormHeading(
                    title: 'Welcome back',
                    subtitle: 'Login to your account',
                  ),

                  const SizedBox(height: 22),

                  OrangeInputField(
                    controller: emailController,
                    hintText: 'Enter email or phone',
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: (value) =>
                        value == null || value.trim().isEmpty
                            ? 'Please enter your email or phone'
                            : null,
                  ),

                  const SizedBox(height: 10),

                  OrangeInputField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    validator: (value) =>
                        value == null || value.isEmpty
                            ? 'Please enter your password'
                            : null,
                    onSubmitted: (_) => login(),
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => openOrangePage(
                        context,
                        const E04PageUI(),
                      ),
                      style: TextButton.styleFrom(
                        foregroundColor: orangeDarkColor,
                        padding: const EdgeInsets.symmetric(vertical: 7),
                        minimumSize: Size.zero,
                        tapTargetSize:
                            MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  OrangeActionButton(
                    label: 'Log In',
                    onPressed: login,
                  ),

                  const SizedBox(height: 16),

                  const OrangeOrDivider(),

                  const SizedBox(height: 13),

                  const OrangeSocialOptions(),

                  const SizedBox(height: 14),

                  OrangeFooterLink(
                    prompt: "Don't have an Account? ",
                    actionLabel: 'Create Account',
                    onTap: () => openOrangePage(
                      context,
                      const E03PageUI(),
                    ),
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