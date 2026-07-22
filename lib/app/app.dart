import 'package:flutter/material.dart';
import 'app_router.dart';
import 'app_theme.dart';

class JSPIMSApp extends StatelessWidget {
  const JSPIMSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "JSPIMS",

      debugShowCheckedModeBanner: false,

      theme: AppTheme.lightTheme,

      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
