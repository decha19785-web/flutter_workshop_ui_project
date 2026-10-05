import 'package:flutter/material.dart';

import '../widgets/orange_ui_components.dart';
import 'e06_page_ui.dart';

class E05PageUI extends StatefulWidget {
  const E05PageUI({super.key});

  @override
  State<E05PageUI> createState() => _E05PageUIState();
}

class _E05PageUIState extends State<E05PageUI> {
  final _formKey = GlobalKey<FormState>();
  final _codeControllers = List.generate(4, (_) => TextEditingController());
  final _focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (final controller in _codeControllers) {
      controller.dispose();
    }
    for (final focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _verifyCode() {
    if (_formKey.currentState?.validate() ?? false) {
      openOrangePage(context, const E06PageUI());
    } else {
      _focusNodes.first.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return OrangePageShell(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 30, 30, 24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).maybePop(),
                    tooltip: 'Back',
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    color: orangeDarkColor,
                    visualDensity: VisualDensity.compact,
                    padding: EdgeInsets.zero,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'OTP Verification',
                    style: TextStyle(
                      fontSize: 17,
                      color: inkColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Center(
                child: Image.asset(
                  'assets/images/img_orange3.png',
                  width: 275,
                  height: 275,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Enter OTP',
                style: TextStyle(
                  fontSize: 17,
                  color: inkColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'A 4 digit code has been sent to your email',
                style: TextStyle(fontSize: 12, color: inkColor),
              ),
              const SizedBox(height: 14),
              Row(
                children: List.generate(
                  _codeControllers.length,
                  (index) => Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: index == _codeControllers.length - 1 ? 0 : 9,
                      ),
                      child: TextFormField(
                        controller: _codeControllers[index],
                        focusNode: _focusNodes[index],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        textInputAction: index == _codeControllers.length - 1
                            ? TextInputAction.done
                            : TextInputAction.next,
                        maxLength: 1,
                        onChanged: (value) {
                          if (value.isNotEmpty &&
                              index < _focusNodes.length - 1) {
                            _focusNodes[index + 1].requestFocus();
                          }
                        },
                        validator: (value) =>
                            value == null || value.isEmpty ? '' : null,
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                        ),
                        decoration: InputDecoration(
                          counterText: '',
                          filled: true,
                          fillColor: const Color(0xFFF1F1F1),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 12,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          errorStyle: const TextStyle(height: 0, fontSize: 0),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.redAccent,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: orangeColor,
                              width: 1.4,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text.rich(
                  TextSpan(
                    style: TextStyle(fontSize: 10, color: mutedColor),
                    children: [
                      TextSpan(text: 'You should receive the OTP in '),
                      TextSpan(
                        text: '30 Seconds',
                        style: TextStyle(color: orangeDarkColor),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 9),
              OrangeActionButton(label: 'Verify', onPressed: _verifyCode),
            ],
          ),
        ),
      ),
    );
  }
}
