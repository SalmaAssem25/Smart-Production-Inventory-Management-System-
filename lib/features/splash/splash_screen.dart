import 'package:flutter/material.dart';

import '../../app/colors.dart';
import '../../app/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      // TODO:
      // Navigate to Login Screen
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBackground,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),

            // Glass Circle
            Container(
              height: 170,
              width: 170,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.08),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Container(
                  height: 110,
                  width: 110,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Image.asset(
                      "assets/logos/logo.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 28),

            const Text(
              AppConstants.appName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              AppConstants.appSubtitle,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70, fontSize: 15),
            ),

            const Spacer(),

            SizedBox(
              width: 160,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: const LinearProgressIndicator(minHeight: 5),
              ),
            ),

            const SizedBox(height: 18),

            const Text(
              "SYSTEM READY",
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              AppConstants.version,
              style: TextStyle(color: Colors.white38, fontSize: 12),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
