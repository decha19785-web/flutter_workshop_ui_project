import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_workshop_ui_project/main.dart';
import 'package:flutter_workshop_ui_project/views/e01_page_ui.dart';
import 'package:flutter_workshop_ui_project/views/e02_page_ui.dart';
import 'package:flutter_workshop_ui_project/views/e03_page_ui.dart';
import 'package:flutter_workshop_ui_project/views/e04_page_ui.dart';
import 'package:flutter_workshop_ui_project/views/e05_page_ui.dart';
import 'package:flutter_workshop_ui_project/views/e06_page_ui.dart';

void main() {
  void setIPhone15ProMaxViewport(WidgetTester tester) {
    tester.view.physicalSize = const Size(1290, 2796);
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  }

  testWidgets('starts on E01 and opens the login screen', (tester) async {
    setIPhone15ProMaxViewport(tester);

    await tester.pumpWidget(const OrangeApp());

    expect(find.text('ORANGE JUICE'), findsOneWidget);
    await tester.tap(find.text('Explore Now'));
    await tester.pumpAndSettle();

    expect(find.text('Welcome back'), findsOneWidget);
  });

  testWidgets('all six screens render at iPhone 15 Pro Max size', (
    tester,
  ) async {
    setIPhone15ProMaxViewport(tester);
    final screens = [
      const E01PageUI(),
      const E02PageUI(),
      const E03PageUI(),
      const E04PageUI(),
      const E05PageUI(),
      const E06PageUI(),
    ];

    for (final screen in screens) {
      await tester.pumpWidget(MaterialApp(home: screen));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
    }
  });

  testWidgets('password recovery verifies OTP and returns to login', (
    tester,
  ) async {
    setIPhone15ProMaxViewport(tester);

    await tester.pumpWidget(const OrangeApp());
    await tester.tap(find.text('Explore Now'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Forgot Password?'));
    await tester.pumpAndSettle();

    await tester.enterText(
      find.byType(TextFormField).first,
      'orange@example.com',
    );
    await tester.tap(find.text('Send code'));
    await tester.pumpAndSettle();

    final otpFields = find.byType(TextFormField);
    for (var index = 0; index < 4; index++) {
      await tester.enterText(otpFields.at(index), '${index + 1}');
      await tester.pump();
    }
    await tester.tap(find.text('Verify'));
    await tester.pumpAndSettle();
    expect(find.text('Create New Password'), findsOneWidget);

    final passwordFields = find.byType(TextFormField);
    await tester.enterText(passwordFields.at(0), 'orange123');
    await tester.enterText(passwordFields.at(1), 'orange123');
    await tester.tap(find.text('Submit'));
    await tester.pumpAndSettle();

    expect(find.text('Welcome back'), findsOneWidget);
  });

  testWidgets('login links open password recovery and registration', (
    tester,
  ) async {
    setIPhone15ProMaxViewport(tester);

    await tester.pumpWidget(const OrangeApp());
    await tester.tap(find.text('Explore Now'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Forgot Password?'));
    await tester.pumpAndSettle();
    expect(find.text('Forgot your password?'), findsOneWidget);

    await tester.pageBack();
    await tester.pumpAndSettle();
    await tester.tap(find.text('Create Account'));
    await tester.pumpAndSettle();
    expect(find.text('Register'), findsOneWidget);
  });

  testWidgets('login opens the third screen with entered credentials', (
    tester,
  ) async {
    setIPhone15ProMaxViewport(tester);

    await tester.pumpWidget(const OrangeApp());
    await tester.tap(find.text('Explore Now'));
    await tester.pumpAndSettle();

    await tester.enterText(
      find.byType(TextFormField).at(0),
      'myaccount@example.com',
    );
    await tester.enterText(find.byType(TextFormField).at(1), 'mypassword');
    await tester.tap(find.text('Log In'));
    await tester.pumpAndSettle();

    expect(find.text('Register'), findsOneWidget);
  });
}
