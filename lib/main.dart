import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app_4/config/router/app_router.dart';
import 'package:widgets_app_4/config/theme/app_theme.dart';
import 'package:widgets_app_4/presentation/providers/theme_provider.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MainApp()
    )
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build( BuildContext context, WidgetRef ref ) {

    // final bool isDarkmode = ref.watch( isDarkModeProvider );
    // final int selectedColor = ref.watch( selectedColorProvider );
    final AppTheme appTheme = ref.watch( themeNotifierProvider );

    return MaterialApp.router(
      title: 'Flutter Widgets',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      // theme: AppTheme( selectedColor: selectedColor, isDarkmode: isDarkmode ).getTheme(),
      theme: appTheme.getTheme()

    );
  }
}
