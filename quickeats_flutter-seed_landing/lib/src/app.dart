import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_eats/src/post_api_service.dart';
import 'package:quick_eats/src/recover_password.dart';
import 'package:quick_eats/src/registration.dart';
import 'package:quick_eats/src/update_profile.dart';
import 'package:quick_eats/src/views/sign_in_view.dart';
import 'views/mainview.dart';
import 'package:quick_eats/res/colors.dart';

class QuickEats extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /*return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quick Eats',
      initialRoute: '/home',
      home: MyHomePage(title: 'QuickEats'),
      theme: _qeTheme,

      routes: {
        //'/home': (context) => MainView(),
        '/home':(context)=>MyHomePage(),
      },
    );*/
    return Provider(
        builder: (_) => UserAccountService.create(),
        dispose: (context, UserAccountService service) =>
            service.client.dispose(),
        child: MaterialApp(
          title: 'QuickEats',
          theme: _qeTheme,
          home: MyHomePage(title: 'QuickEats'),
          routes: <String, WidgetBuilder>{
            'Update Profile': (BuildContext context) =>
                UpdateProfile(title: 'Update Profile'),
            'Home': (BuildContext context) => MainView(),
            'Login': (BuildContext context) => SignInPage(),


          },
        )
    );
  }
}

final ThemeData _qeTheme = _buildQuickEatTheme();

ThemeData _buildQuickEatTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: qeAccent,
    primaryColor: qeAccentLight,
    buttonColor: qeAccent,
    scaffoldBackgroundColor: qeSurfaceWhite,
    cardColor: qeBackgroundWhite,
    buttonTheme: ButtonThemeData(height: 50,minWidth: 150),
    textSelectionColor: qePrimaryAltText,
    errorColor: qeErrorRed,

    textTheme: _buildQuickEatsTextTheme(base.textTheme),
    primaryTextTheme: _buildQuickEatsTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildQuickEatsTextTheme(base.accentTextTheme),
    primaryIconTheme: base.iconTheme.copyWith(color: qeAccentDark),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(5.0),
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
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('Update Profile'),
                onPressed:(){
                  Navigator.of(context).pushNamed('Update Profile');
                },
              ),RaisedButton(
                child: Text('Home'),
                onPressed:(){
                  Navigator.of(context).pushNamed('Home');
                },
              ),RaisedButton(
                child: Text('Login'),
                onPressed:(){
                  Navigator.of(context).pushNamed('Login');
                },
              )
            ],
          )




      ),
    );
  }
}
