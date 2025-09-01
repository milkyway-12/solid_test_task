import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solid_test_task/core/constants/app_constants.dart';
import 'package:solid_test_task/features/color_generator/presentation/cubit/color_cubit.dart';
import 'package:solid_test_task/features/color_generator/presentation/pages/color_page.dart';
import 'package:solid_test_task/features/color_generator/presentation/widgets/art_widget.dart';

void main() {
  testWidgets('ColorPage displays buttons and ArtWidget',
          (WidgetTester tester) async {

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<ColorCubit>(
          create: (_) => ColorCubit(),
          child: const ColorPage(),
        ),
      ),
    );

    expect(find.text(AppConstants.changeColorButtonText), findsOneWidget);
    expect(find.text(AppConstants.shareButtonText), findsOneWidget);

    expect(find.byType(ArtWidget), findsOneWidget);

    final scaffold = tester.widget<Scaffold>(find.byType(Scaffold));
    expect(scaffold.backgroundColor, isNotNull);
  });
}
