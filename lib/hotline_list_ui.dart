import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'hotline_data.dart';

class HotlineListUI extends StatelessWidget {
  const HotlineListUI({super.key, required this.category});

  final HotlineCategory category;

  Future<void> _callNumber(BuildContext context, HotlineEntry entry) async {
    final number = entry.number.replaceAll(RegExp(r'[^0-9+]'), '');
    final uri = Uri(scheme: 'tel', path: number);

    try {
      final launched = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
      if (!launched && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('ไม่สามารถเปิดแอปโทรศัพท์สำหรับเบอร์ $number ได้'),
          ),
        );
      }
    } catch (_) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('ไม่สามารถเปิดแอปโทรศัพท์สำหรับเบอร์ $number ได้'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            category.bannerPath,
            height: 156,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (_, _, _) => Container(
              height: 156,
              color: const Color(0xFFE8E8E8),
              alignment: Alignment.center,
              child: Icon(category.icon, size: 56, color: Colors.black54),
            ),
          ),
        ),
        const SizedBox(height: 18),
        Text(
          category.title,
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 2),
        Text(
          category.subtitle,
          style: textTheme.bodyMedium?.copyWith(color: Colors.black54),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const FaIcon(
              FontAwesomeIcons.circleInfo,
              size: 14,
              color: Color(0xFF666666),
            ),
            const SizedBox(width: 8),
            Text(
              'แตะปุ่มโทรศัพท์เพื่อโทรออก',
              style: textTheme.labelMedium?.copyWith(color: Colors.black54),
            ),
          ],
        ),
        const SizedBox(height: 10),
        ...category.entries.map(
          (entry) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              child: Container(
                constraints: const BoxConstraints(minHeight: 76),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFE0E0E0)),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x08000000),
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF3F3F3),
                        border: Border.all(color: Colors.black, width: 1.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(1.2),
                      child: entry.assetPath == null
                          ? Icon(category.icon, size: 36)
                          : Image.asset(
                              entry.assetPath!,
                              fit: BoxFit.cover,
                              errorBuilder: (_, _, _) =>
                                  Icon(category.icon, size: 36),
                            ),
                    ),
                  ),
                  title: Text(
                    entry.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    entry.number,
                    style: textTheme.bodySmall?.copyWith(color: Colors.black54),
                  ),
                  trailing: IconButton(
                    tooltip: 'โทร ${entry.number}',
                    onPressed: () => _callNumber(context, entry),
                    icon: const FaIcon(FontAwesomeIcons.phone, size: 16),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
