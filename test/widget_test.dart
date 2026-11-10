import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_thai_hotline_app/about_ui.dart';
import 'package:flutter_thai_hotline_app/hotline_data.dart';
import 'package:flutter_thai_hotline_app/hotline_list_ui.dart';
import 'package:flutter_thai_hotline_app/main.dart';

void main() {
  testWidgets('the app opens on its Thai Hotline splash screen', (
    tester,
  ) async {
    await tester.pumpWidget(const ThaiHotlineApp());

    expect(find.text('THAI HOTLINE APP'), findsOneWidget);
    expect(find.text('สายด่วน THAILAND'), findsOneWidget);
  });

  testWidgets('every hotline entry has an enabled call button', (tester) async {
    tester.view.physicalSize = const Size(1000, 4000);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);

    for (final category in hotlineCategories) {
      await tester.pumpWidget(
        MaterialApp(home: HotlineListUI(category: category)),
      );

      expect(find.byType(IconButton), findsNWidgets(category.entries.length));
      final iconFrames = tester.widgetList<Container>(
        find.byWidgetPredicate(
          (widget) =>
              widget is Container &&
              widget.decoration is BoxDecoration &&
              (widget.decoration! as BoxDecoration).border?.top.color ==
                  Colors.black,
        ),
      );
      expect(iconFrames.length, category.entries.length);
      for (final entry in category.entries) {
        if (entry.assetPath != null) {
          final entryImages = tester.widgetList<Image>(
            find.byWidgetPredicate(
              (widget) =>
                  widget is Image &&
                  widget.image is AssetImage &&
                  (widget.image as AssetImage).assetName == entry.assetPath,
            ),
          );
          expect(entryImages, isNotEmpty, reason: entry.name);
          expect(
            entryImages.every((image) => image.fit == BoxFit.cover),
            isTrue,
            reason: 'Icon for ${entry.name} fills its frame',
          );
        }

        final phoneButton = find.byWidgetPredicate(
          (widget) =>
              widget is IconButton && widget.tooltip == 'โทร ${entry.number}',
        );
        final buttons = tester.widgetList<IconButton>(phoneButton);
        expect(buttons, isNotEmpty, reason: 'Hotline ${entry.number}');
        expect(
          buttons.every((button) => button.onPressed != null),
          isTrue,
          reason: 'Hotline ${entry.number}',
        );
      }
    }
  });

  test('the 191 hotline uses the supplied police emblem asset', () {
    final policeHotline = emergencyCategory.entries.firstWhere(
      (entry) => entry.number == '191',
    );

    expect(
      policeHotline.assetPath,
      'assets/resource/images/emergency/emg_1.png',
    );
  });

  testWidgets('the About screen displays the provided creator image', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(393, 852);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(const MaterialApp(home: AboutUI()));

    expect(find.text('สาขาวิชา'), findsOneWidget);
    expect(find.text('วิศวกรรมคอมพิวเตอร์'), findsOneWidget);
    expect(find.text('คณะ'), findsOneWidget);
    expect(find.text('วิศวกรรมศาสตร์'), findsOneWidget);
    expect(find.text('ชื่อรายวิชา'), findsNothing);
    expect(find.text('ปีการศึกษา'), findsNothing);
    final creatorHeadingTop = tester.getTopLeft(find.text('ผู้จัดทำ')).dy;
    final creatorHeadingBottom = tester.getBottomLeft(find.text('ผู้จัดทำ')).dy;
    final universityLogo = find.byWidgetPredicate(
      (widget) =>
          widget is Image &&
          widget.image is AssetImage &&
          (widget.image as AssetImage).assetName ==
              'assets/resource/images/aboutme/saulogo.png',
    );
    final universityLogoTop = tester.getTopLeft(universityLogo).dy;
    final universityLogoImage = tester.widget<Image>(universityLogo);
    final universityLogoBottom = tester.getBottomLeft(universityLogo).dy;
    final universityNameTop = tester
        .getTopLeft(find.text('มหาวิทยาลัยเอเชียอาคเนย์'))
        .dy;
    final universityNameBottom = tester
        .getBottomLeft(find.text('มหาวิทยาลัยเอเชียอาคเนย์'))
        .dy;
    final creatorImage = tester.widget<Image>(
      find.byWidgetPredicate(
        (widget) =>
            widget is Image &&
            widget.image is AssetImage &&
            (widget.image as AssetImage).assetName ==
                'assets/resource/images/aboutme/creator_avatar.png',
      ),
    );
    final creatorImageTop = tester
        .getTopLeft(
          find.byWidgetPredicate(
            (widget) =>
                widget is Image &&
                widget.image is AssetImage &&
                (widget.image as AssetImage).assetName ==
                    'assets/resource/images/aboutme/creator_avatar.png',
          ),
        )
        .dy;
    expect(creatorHeadingTop, lessThan(universityLogoTop));
    expect(universityLogoTop, lessThan(universityNameTop));
    expect(universityNameTop, lessThan(creatorImageTop));
    expect(universityLogoImage.width, greaterThan(118));
    expect(universityLogoTop - creatorHeadingBottom, greaterThan(20));
    expect(universityNameTop - universityLogoBottom, greaterThan(12));
    expect(creatorImageTop - universityNameBottom, greaterThan(12));
    expect(creatorImage.fit, BoxFit.contain);
    expect(creatorImage.width, greaterThan(150));
    expect(tester.takeException(), isNull);
  });
}
