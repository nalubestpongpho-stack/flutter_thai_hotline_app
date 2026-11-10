import 'dart:math' as math;

import 'package:flutter/material.dart';

class AboutUI extends StatelessWidget {
  const AboutUI({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('สายด่วน THAILAND')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final availableWidth = math.max(0.0, constraints.maxWidth - 48);
          final portraitHeight = math.min(230.0, constraints.maxHeight * 0.30);
          final portraitWidth = math.min(
            availableWidth * 0.74,
            portraitHeight * 419 / 512,
          );
          final universityLogoSize = math.min(
            124.0,
            math.min(availableWidth * 0.36, constraints.maxHeight * 0.155),
          );
          final sectionSpacing = math.min(
            22.0,
            math.max(14.0, constraints.maxHeight * 0.025),
          );

          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 460),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'ผู้จัดทำ',
                          textAlign: TextAlign.center,
                          style: textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: sectionSpacing),
                            Container(
                              width: universityLogoSize + 18,
                              height: universityLogoSize + 18,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF7F4F8),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(0xFFE5DCE8),
                                ),
                              ),
                              child: Image.asset(
                                'assets/resource/images/aboutme/saulogo.png',
                                width: universityLogoSize,
                                height: universityLogoSize,
                                fit: BoxFit.contain,
                                semanticLabel: 'ตรามหาวิทยาลัยเอเชียอาคเนย์',
                                errorBuilder: (_, _, _) =>
                                    const Icon(Icons.school_outlined, size: 48),
                              ),
                            ),
                            SizedBox(height: sectionSpacing),
                            Text(
                              'มหาวิทยาลัยเอเชียอาคเนย์',
                              textAlign: TextAlign.center,
                              style: textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: sectionSpacing * 1.25),
                          ],
                        ),
                        Image.asset(
                          'assets/resource/images/aboutme/creator_avatar.png',
                          width: portraitWidth,
                          height: portraitHeight,
                          fit: BoxFit.contain,
                          semanticLabel: 'รูปผู้จัดทำ',
                        ),
                        Column(
                          children: [
                            const _AboutField(
                              label: 'รหัสนักศึกษา',
                              value: '6819410009',
                            ),
                            const _AboutField(
                              label: 'ชื่อ-นามสกุล',
                              value: 'นายนฤเบศ  พงโพธิ์',
                            ),
                            const _AboutField(
                              label: 'อีเมลนักศึกษา',
                              value: 'S6819410009@sau.ac.th',
                            ),
                            const _AboutField(
                              label: 'สาขาวิชา',
                              value: 'วิศวกรรมคอมพิวเตอร์',
                            ),
                            const _AboutField(
                              label: 'คณะ',
                              value: 'วิศวกรรมศาสตร์',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _AboutField extends StatelessWidget {
  const _AboutField({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          Text(
            label,
            textAlign: TextAlign.center,
            style: textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 2),
          Text(value, textAlign: TextAlign.center, style: textTheme.bodyMedium),
        ],
      ),
    );
  }
}
