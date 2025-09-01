// ignore_for_file: prefer_match_file_name

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_test_task/core/theme/app_theme.dart';
import 'package:solid_test_task/features/color_generator/presentation/cubit/color_cubit.dart';
import 'package:solid_test_task/features/color_generator/presentation/pages/color_page.dart';

void main() {
  runApp(const MyApp());
}

/// Entry point of the application.
class MyApp extends StatelessWidget {

  /// Sets up [MaterialApp] with a light theme and provides
  /// [ColorCubit] to the widget tree via [BlocProvider].
  ///
  /// The home screen of the app is [ColorPage], which displays
  /// the main color-changing and art-generating interface.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Solid Test Task',
        theme: AppTheme.light,
        home: BlocProvider(
          create: (_) => ColorCubit(),
          child: const ColorPage(),
        ),);
  }
}
