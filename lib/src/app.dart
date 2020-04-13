import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_eats/src/data/menu_api_service.dart';
import 'package:quick_eats/src/data/restaurant_api_service.dart';
import 'package:quick_eats/src/quick_eats_routes.dart';
import 'package:quick_eats/src/ui_reusable/vendor_widget.dart';
import 'package:quick_eats/src/utils/test_zone.dart';
import 'package:quick_eats/src/views/login/login_page.dart';
import 'package:quick_eats/src/views/vendor/menu_item_page.dart';
import 'package:quick_eats/src/views/vendor/vendor_all.dart';
import 'package:quick_eats/src/views/restaurant/restaurant_landing.dart';
import 'package:quick_eats/src/views/vendor/vendor_profile.dart';
import 'data/vendor_api_service.dart';
import 'models/vendor_model.bak.dart';
import 'views/mainview.dart';
import 'package:quick_eats/res/colors.dart';

class QuickEats extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_)=>MenuApiService.create(),
          dispose: (_,MenuApiService service)=>service.client.dispose(),
        ),
        Provider(
            create: (_)=>RestaurantApiService.create(),
          dispose: (_,RestaurantApiService service)=>service.client.dispose(),
        ),
        Provider(
          create: (_)=>VendorApiService.create(),
          dispose: (_,VendorApiService service)=>service.client.dispose(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Quick Eats',
        initialRoute: QuickEatsRoutes.home, //'''/vendor_all',
        home:MainView(),  //MainView(), VendorAll()
        theme: _qeTheme,
        routes: {
          QuickEatsRoutes.home: (context) => MainView(),
          QuickEatsRoutes.login: (context) => LoginPage(),
          QuickEatsRoutes.menuItem: (context) => MenuItemPage(),
          QuickEatsRoutes.vendor: (context) => RestaurantLanding(),
          QuickEatsRoutes.vendorAll: (context) => VendorAll(),

          QuickEatsRoutes.test: (context) => TestZone(),
        },
      ),
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
