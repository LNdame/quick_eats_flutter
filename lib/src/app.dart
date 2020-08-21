import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:quick_eats/blocs/authentication/auth_event.dart';
import 'package:quick_eats/blocs/authentication/auth_state.dart';
import 'package:quick_eats/blocs/authentication/bloc.dart';
import 'package:quick_eats/src/data/restaurant_api_service.dart';
import 'package:quick_eats/src/models/scoped_models.dart';
import 'package:quick_eats/src/pages/home_page.dart';
import 'package:quick_eats/src/quick_eats_routes.dart';
import 'package:quick_eats/src/utils/test_zone.dart';
import 'package:quick_eats/src/views/account/splash_page.dart';
import 'package:quick_eats/src/views/account/sign_in_view.dart';
import 'package:quick_eats/src/views/checkout.dart';
import 'package:quick_eats/src/views/restaurant/cart_page.dart';
import 'package:quick_eats/src/views/vendor/menu_item_page.dart';
import 'package:quick_eats/src/views/vendor/vendor_all.dart';
import 'package:quick_eats/src/views/vendor/vendor_landing.dart';
import 'package:scoped_model/scoped_model.dart';
import 'data/user_account_api_service.dart';
import 'data/vendor_api_service.dart';
import 'datarepo/user_repository.dart';
import 'views/mainview.dart';
import 'package:quick_eats/res/colors.dart';

class QuickEats extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<QuickEats> createState() {
    return QuickEatsState();
  }
}

class QuickEatsState extends State<QuickEats> {
  AuthenticationBloc authBloc;

  @override
  void initState() {
    authBloc = AuthenticationBloc();
    authBloc.add(AppStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel(model: ScopedQEModel(),
    child: MultiProvider(
        providers: [
          Provider(
            create: (_) => RestaurantApiService.create(),
            dispose: (_, RestaurantApiService service) =>
                service.client.dispose(),
          ),
          Provider(
            create: (_) => VendorApiService.create(),
            dispose: (_, VendorApiService service) => service.client.dispose(),
          ),
          Provider(
              create: (_) => UserAccountService.create(),
              dispose: (_, UserAccountService service) =>
                  service.client.dispose()),
        ],
          child:  BlocProvider<AuthenticationBloc>(
          create: (BuildContext context) => authBloc,
          child:
          MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Quick Eats',
            home:
            BlocBuilder<AuthenticationBloc, AuthenticationState>(
              builder: (BuildContext context, AuthenticationState state) {
                if (state is AuthenticationAuthenticated){
                  return MainView();
                } 
                else {
                  if (state is AuthenticationUnauthenticated)
                    return SignInPage();
                  else {
                    return SplashPage();
                  }
                }
              },
            ),
            theme: _qeTheme,
            routes: {
              QuickEatsRoutes.home: (context) => MainView(),
              QuickEatsRoutes.login: (context) => SignInPage(),
              //QuickEatsRoutes.menuItem: (context) => MenuItemPage(),
              QuickEatsRoutes.cart: (context)=> CartPage(),
              QuickEatsRoutes.vendor: (context) => RestaurantLanding(),
              QuickEatsRoutes.vendorAll: (context) => VendorAll(),
              QuickEatsRoutes.checkOutPage: (context) => CheckOutPage(),
              QuickEatsRoutes.test: (context) => TestZone(),
            },
          ),
        )));
  }

  ThemeData _qeTheme = _buildQuickEatTheme();

  static ThemeData _buildQuickEatTheme() {
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

  static TextTheme _buildQuickEatsTextTheme(TextTheme base) {
    return base
        .copyWith(
          headline5: base.headline5.copyWith(
            fontWeight: FontWeight.w500,
          ),
          headline6: base.headline6.copyWith(
            fontSize: 18.0,
          ),
          caption: base.caption
              .copyWith(fontWeight: FontWeight.w400, fontSize: 12.0),
        )
        .apply(
          //fontFamily
          displayColor: qePrimaryText,
          bodyColor: qePrimaryAltText,
        );
  }
}
