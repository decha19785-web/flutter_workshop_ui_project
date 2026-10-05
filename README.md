# Orange ส้ม

A Flutter UI project for an orange juice app. The app opens on `E01PageUI` and
includes these screens in `lib/views/`:

- `e01_page_ui.dart` — welcome
- `e02_page_ui.dart` — login
- `e03_page_ui.dart` — registration
- `e04_page_ui.dart` — password recovery
- `e05_page_ui.dart` — OTP verification
- `e06_page_ui.dart` — create a new password

The authentication screens demonstrate the UI flow only; no authentication,
email, or social sign-in service is connected.

## Run

```sh
flutter pub get
flutter run
```

Run the UI tests with `flutter test`. They use a 430 × 932 logical-pixel
viewport, matching the iPhone 15 Pro Max screen size.
