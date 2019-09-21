import 'package:flutter/material.dart';
import 'views/mainview.dart';
import 'package:quick_eats/res/colors.dart';

class QuickEats extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quick Eats',
      initialRoute: '/home',
      home: MainView(),
      theme: _qeTheme,
      routes: {
        '/home': (context) => MainView(),
      },
    );
  }
}

final ThemeData _qeTheme = _buildQuickEatTheme();

ThemeData _buildQuickEatTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: qeAccent,
    primaryColor: qePrimary,
    buttonColor: qeAccent,
    scaffoldBackgroundColor: qeSurfaceWhite,
    cardColor: qeBackgroundWhite,
    textSelectionColor: qePrimaryAltText,
    errorColor: qeErrorRed,
    textTheme: _buildQuickEatsTextTheme(base.textTheme),
    primaryTextTheme: _buildQuickEatsTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildQuickEatsTextTheme(base.accentTextTheme),
    primaryIconTheme: base.iconTheme.copyWith(color: qeAccentDark),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(4.0)),
    ),
  );
}

TextTheme _buildQuickEatsTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline: base.headline.copyWith(
          fontWeight: FontWeight.w500,
        ),
        title: base.title.copyWith(
          fontSize: 18.0,
        ),
        caption:
            base.caption.copyWith(fontWeight: FontWeight.w400, fontSize: 12.0),
      )
      .apply(
        //fontFamily
        displayColor: qePrimaryText,
        bodyColor: qePrimaryAltText,
      );
}
