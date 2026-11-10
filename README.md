# Thai Hotline App

Flutter UI for the Thai hotline directory assignment. The app starts with a splash screen and has four hotline categories, phone buttons, and an About screen. Phone buttons are visual placeholders; the assignment asks for UI only at this stage.

## Run locally

```sh
flutter pub get
flutter run
```

The image resources are in `assets/resource/images/`. The About screen intentionally shows placeholders for student and course details because those values were not included in the supplied mockup; replace them in `lib/about_ui.dart` before submission.

## Main screens

- `lib/splash_screen_ui.dart` — splash screen
- `lib/home_ui.dart` — category navigation
- `lib/travel_ui.dart` — travel hotlines
- `lib/emg_ui.dart` — emergency hotlines
- `lib/bank_ui.dart` — bank call centers
- `lib/pub_ui.dart` — public utilities
- `lib/about_ui.dart` — app and creator information
