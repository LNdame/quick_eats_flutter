import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:quick_eats/blocs/authentication/auth_event.dart';
import 'package:quick_eats/blocs/authentication/bloc.dart';
import 'package:quick_eats/src/data/user_account_api_service.dart';
import 'package:quick_eats/src/datarepo/user_repository.dart';
import 'package:quick_eats/src/quick_eats_routes.dart';
import 'package:quick_eats/src/utils/validation.dart';
import 'package:quick_eats/src/views/account/sign_in_view.dart';

import 'package:quick_eats/src/models/responses/single_response.dart';


class RecoverPassword extends StatefulWidget {
  RecoverPassword({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<RecoverPassword> {
  final emailTextController = TextEditingController();
  final otpTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  Validation validation = new Validation();
  bool enableEmail, enableOtp, enablePasswords, loadingEmail,
      loadingOtp, emailExists, incorrectOtp, isResettingPassword;
  ForgotPasswordModel model;
  final _formKey = GlobalKey<FormState>();
  BuildContext _context;

  void dispose() {
    emailTextController.dispose();
    otpTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    enableEmail = true;
    enableOtp = true;
    enablePasswords = true;
    loadingEmail = false;
    emailExists = true;
    loadingOtp = false;
    isResettingPassword = false;
    incorrectOtp = false;
  }

  @override
  Widget build(BuildContext context) {
    Form form = new Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            controller: emailTextController,
            enabled: enableEmail,
            decoration: InputDecoration(
                labelText: 'Email', contentPadding: EdgeInsets.all(13.0),
                suffixIcon: loadingEmail == false ? Visibility(
                    child: Icon(Icons.done, color: Colors.green),
                    visible: !enableEmail)
                    : new Container(padding: EdgeInsets.all(10.0),
                  child: CircularProgressIndicator(),),
                disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green)
                )
            ),

            keyboardType: TextInputType.emailAddress,
            validator: emailValidation,
          ),

          Container(padding: new EdgeInsets.all(5.0)),
          TextFormField(
            controller: passwordTextController,

            decoration: InputDecoration(
                labelText: 'Password',
                contentPadding: EdgeInsets.all(15.0),
                disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green)
                )),
            keyboardType: TextInputType.text,
            validator: validation.checkPasswordValidity,
          ),
          Container(padding: new EdgeInsets.all(5.0)),

          TextFormField(
            decoration: InputDecoration(
              labelText: 'Confirm Password',
              contentPadding: EdgeInsets.all(15.0),),
            keyboardType: TextInputType.text,
            validator: (value) =>
            value != passwordTextController.text.trim()
                ? "Passwords do not match"
                : null,
          ),
          RaisedButton(
            onPressed: loadingEmail || isResettingPassword
                ? null
                : () => _formKey.currentState.validate()
                ? submit(_formKey)
                : debugPrint('validation error'),
            disabledColor: Colors.grey,
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),),
            color: Theme
                .of(context)
                .primaryColor,
            child: isResettingPassword ? CircularProgressIndicator() : Text(
              "Submit", style: TextStyle(fontSize: 18.0),),
          )
        ],
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: Builder(builder: (BuildContext context){
        _context = context;
        return Container(
          padding: const EdgeInsets.all(20.0),
          child: form
      );
      },)
      ,
    );
  }



  void submit(GlobalKey<FormState> key) {
    setState(() {
      isResettingPassword = true;
    });
    final response = Provider.of<UserAccountService>(context, listen: false).passwordUpdate({
      'email': emailTextController.text.trim(),
      'password': passwordTextController.text.trim(),
    });

    response.then((onValue) {
      SingleResponse response = new SingleResponse().fromJson(
          jsonDecode(onValue.bodyString));

      if (response.error == null) {
        //appropriate success message
        BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
        //Navigator.pushNamed(context, QuickEatsRoutes.login);
      }
      else {
        //debugPrint(response.error);
        final snackbar = SnackBar(content: Text(response.getMessage()));
        Scaffold.of(_context).showSnackBar(snackbar);
      }
    }, onError: (error) {
      SingleResponse errorResponse = new SingleResponse().fromJson(
          jsonDecode(error.bodyString));
      debugPrint(errorResponse.message);
      if (error.statusCode == 500) {
        debugPrint("Not found");
        final snackbar = SnackBar(content: Text(errorResponse.getMessage()));
        Scaffold.of(_context).showSnackBar(snackbar);
      }
    }).whenComplete(() => setState(() {
      isResettingPassword = false;
    }));
  }

  String emailValidation(String value) {
    if (!emailExists) {
      emailExists = true;
      return "Email address does not exist";
    } else {
      return validation.validateEmail(value);
    }
  }


}


class ForgotPasswordModel{
  int userID;
  int appLogID;
  String resetPasswordToken;

  ForgotPasswordModel(int userID, int appLogID, String token){
    this.userID = userID;this.appLogID=appLogID;resetPasswordToken = token;
  }

}

