import 'package:flutter/material.dart';

import '../widgets/orange_ui_components.dart';
import 'e02_page_ui.dart';

class E06PageUI extends StatefulWidget {
  const E06PageUI({super.key});

  @override
  State<E06PageUI> createState() => _E06PageUIState();
}

class _E06PageUIState extends State<E06PageUI> {
  final _formKey = GlobalKey<FormState>();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OrangePageShell(
      child: Column(
        children: [
          const OrangeHeader(height: 220),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 14, 30, 26),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Create New Password',
                    style: TextStyle(
                      fontSize: 18,
                      color: inkColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Enter new password',
                    style: TextStyle(fontSize: 12, color: inkColor),
                  ),
                  const SizedBox(height: 14),
                  OrangeInputField(
                    hintText: 'Enter new password',
                    controller: _newPasswordController,
                    obscureText: true,
                    textInputAction: TextInputAction.next,
                    validator: (value) => value == null || value.length < 8
                        ? 'Use at least 8 characters'
                        : null,
                  ),
                  const SizedBox(height: 9),
                  OrangeInputField(
                    hintText: 'Confirm password',
                    controller: _confirmPasswordController,
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != _newPasswordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 14),
                  OrangeActionButton(
                    label: 'Submit',
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        final messenger = ScaffoldMessenger.of(context);
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute<void>(
                            builder: (_) => const E02PageUI(),
                          ),
                          (route) => false,
                        );
                        messenger.showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Password updated. Please log in again.',
                            ),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      }
                    },
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