import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_eats/res/colors.dart';
import 'package:quick_eats/src/data/user_account_api_service.dart';
import 'package:quick_eats/src/datarepo/user_repository.dart';
import 'package:quick_eats/src/models/responses/single_response.dart';
import 'package:quick_eats/src/utils/validation.dart';
import 'package:quick_eats/src/views/account/sign_in_view.dart';

import 'package:quick_eats/src/models/create_account_user.dart';

import '../../quick_eats_routes.dart';


class RegisterAccount extends StatefulWidget {
  RegisterAccount({Key key, this.title}) : super(key: key);

  final String title;

  @override
  FirstPage createState() => FirstPage();

}


class FirstPage extends State<RegisterAccount> {
  Validation validation = new Validation();
  final passwordController = TextEditingController();

  bool usernameExists, showPassword, showConfirmPassword, duplicateEmail, isRegistering;

  CreateAccountUser user;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    
    super.initState();
    user = CreateAccountUser.emptyConstructor();
    showPassword = false;
    duplicateEmail = false;
    isRegistering = false;
  }


  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  String emailValidation(String value) {
    if (duplicateEmail) {
      duplicateEmail = false;
      return "Email address already exists";
    } else {
      return validation.validateEmail(value);
    }
  }


  @override
  Widget build(BuildContext context) {
    Form form = new Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          Image(
            image: AssetImage('assets/images/temp_logo.png'),
            height: 200.0,
            width: 120.0,
          ),
          TextFormField(
            onSaved: (val)=> user.name= val,
            decoration: InputDecoration(
                labelText: 'Name',
                contentPadding: EdgeInsets.all(13.0)
            ),
            textCapitalization: TextCapitalization.words,
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value.length < 2) {
                return "Please enter name more than 2 chars";
              } else
                return null;
            },
          ),
          Container(padding: new EdgeInsets.all(5.0)),
          TextFormField(
            decoration: InputDecoration(
                labelText: 'Surname', contentPadding: EdgeInsets.all(13.0)),
            textCapitalization: TextCapitalization.words,
            onSaved: (val)=> user.surname = val,
            validator: (value) {
              if (value.length < 2) {
                return "Please enter name more than 2 chars";
              } else
                return null;
            },

          ),
          Container(padding: new EdgeInsets.all(5.0)),
          TextFormField(
            onSaved: (val)=> user.emailAddress = val,
            decoration: InputDecoration(
                labelText: 'Email Address',
                contentPadding: EdgeInsets.all(13.0)),
            keyboardType: TextInputType.emailAddress,
            validator: emailValidation,
          ),
          Container(padding: new EdgeInsets.all(5.0)),
          TextFormField(
            onSaved: (val)=> user.phoneNumber = val,
            decoration: InputDecoration(
                labelText: "Phone Number",
                contentPadding: EdgeInsets.all(11.0)),
            keyboardType: TextInputType.number,
            validator: validation.validatePhoneNumber,
          )
          , Container(padding: new EdgeInsets.all(5.0))
          , TextFormField(
            controller: passwordController,
            decoration: InputDecoration(hintText: 'Enter password',
              labelText: 'Password',
              contentPadding: EdgeInsets.all(13.0),
              suffixIcon: IconButton(
                  icon: Icon(Icons.remove_red_eye, color: qePrimaryText),
                  onPressed: () {
                    setState(() {
                        showPassword = !showPassword;
                      });
                  }
              ),
            ),
            autocorrect: false,
            keyboardType: TextInputType.text,
            obscureText: !showPassword,
            validator: validation.checkPasswordValidity,
          ),
          Container(padding: new EdgeInsets.all(5.0)),
          TextFormField(
            decoration: InputDecoration(hintText: 'Enter password again',
                labelText: 'Confirm Password',
                contentPadding: EdgeInsets.all(13.0),
                suffixIcon: IconButton(
                    icon: Icon(Icons.remove_red_eye, color: qePrimaryText),
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                      
                    })
            ),
            keyboardType: TextInputType.text,
            obscureText: !showPassword,
            onSaved: (val)=> user.password = val,
            autocorrect: false,
            validator: (value) =>
            value != passwordController.text.trim()
                ? "Passwords do not match"
                : null,
          ),
          Container(padding: new EdgeInsets.all(5.0)),
          RaisedButton(
            onPressed: isRegistering
                ? null
                : () =>
            _formKey.currentState.validate()
                ? registerUser(_formKey)
                : debugPrint('validation error'),
            disabledColor: Colors.grey,
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),),
            color: Theme
                .of(context)
                .primaryColor,
            child: isRegistering ? CircularProgressIndicator() : Text(
              "Register", style: TextStyle(fontSize: 18.0),),
          )
        ],

      ),
    );
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: form,
      ),
    );
  }


  void registerUser(GlobalKey<FormState> key) async {
    key.currentState.save();
    await Future.delayed(Duration.zero);
    setState(() {
      isRegistering = true;
    });

    final response = Provider.of<UserAccountService>(context, listen: false).createAccount(
        user.toJson());

    response.then((onValue) {
      SingleResponse response1 = new SingleResponse().fromJson(
          jsonDecode(onValue.bodyString));


      if (response1.error == null) {
        Navigator.pushNamed(context, QuickEatsRoutes.login);
      }
      else {
        debugPrint(response1.error);
      }
    }, onError: (error) {
      SingleResponse errorResponse = new SingleResponse().fromJson(
          jsonDecode(error.bodyString));
      debugPrint(errorResponse.message);
      if (error.statusCode == 400) {
        duplicateEmail = true;
        FormState form = key.currentState;
        if (form != null)
          form.validate();
        else
          debugPrint('form is null');
      }
    });
  }
}

