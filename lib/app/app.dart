import 'package:flutter/material.dart';
import 'package:juhayna_smart_production_and_inventory_management_system/features/splash/splash_screen.dart';

import 'app_theme.dart';
import 'app_router.dart';

class JSPIMSApp extends StatelessWidget {
  const JSPIMSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "JSPIMS",
      theme: AppTheme.lightTheme,

      initialRoute: '/',
      //home: const LoginScreen(),
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
