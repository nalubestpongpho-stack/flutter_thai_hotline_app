import 'dart:async';

import 'package:flutter/material.dart';

import 'home_ui.dart';

class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({super.key});

  @override
  State<SplashScreenUI> createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(milliseconds: 1800), _openHome);
  }

  void _openHome() {
    if (!mounted) return;
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute<void>(builder: (_) => const HomeUI()));
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 28),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/resource/icon/icon.png',
                  width: 164,
                  height: 164,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 26),
                Text(
                  'THAI HOTLINE APP',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF222222),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'สายด่วน THAILAND',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF4F4F4F),
                  ),
                ),
                const SizedBox(height: 34),
                const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: Color(0xFF555555),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
