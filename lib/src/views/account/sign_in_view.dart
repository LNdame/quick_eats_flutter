import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:quick_eats/blocs/authentication/auth_event.dart';
import 'package:quick_eats/blocs/authentication/auth_state.dart';
import 'package:quick_eats/blocs/authentication/bloc.dart';
import 'package:quick_eats/res/colors.dart';
import 'package:quick_eats/src/datarepo/user_repository.dart';
import 'package:quick_eats/src/utils/validation.dart';

import 'package:quick_eats/src/views/account/recover_password.dart';
import 'package:quick_eats/src/views/account/registration.dart';



class SignInPage extends StatefulWidget{
  SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() =>new _SignInPageState();

}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  bool showPassword, emailExists, incorrectPassword;
  Validation validation = new Validation();
  String errorDescription, emailAddress, password;

  LoginBloc loginBloc;
  //AuthenticationBloc authBloc;

  final storage = FlutterSecureStorage();

  @override
  void initState() { 
    showPassword = false;
    emailExists = true;
    incorrectPassword=false;
    //authBloc = BlocProvider.of<AuthenticationBloc>(context);
    loginBloc = LoginBloc(BlocProvider.of<AuthenticationBloc>(context),context);
    super.initState();
  }

  @override
  void dispose() {
    //authBloc.close();
    super.dispose();
  }

  void submit(GlobalKey<FormState> key) async{
    key.currentState.save();
    loginBloc.add(LoginButtonPressed(emailAddress,password));
  }

  String passwordValidation(String value){
    if(incorrectPassword){
      incorrectPassword = false;
      return errorDescription;
    }
    else return null;
  }
  String emailValidation(String value) {
    if (!emailExists) {
      emailExists = true;
      return errorDescription;
    } else {
      return validation.validateEmail(value);
    }
  }
  void toggle(){
    setState((){
      showPassword = !showPassword;
    });
  }
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<LoginBloc,LoginState>(
      bloc: loginBloc,
      builder:(BuildContext context, LoginState state){
        if(state is LoginFailure){
          incorrectPassword = true;
          errorDescription = state.error;
          _formKey.currentState.validate();
        }
        return Scaffold(
          body: Container(
              padding: const EdgeInsets.all(20.0),
              child: new Form(
                key: _formKey,
                child: ListView(
                  children: <Widget>[
                    Image(
                      image: AssetImage('assets/images/temp_logo.png'),
                      height: 200.0,
                      width: 120.0,
                    ),

                    Container(padding: new EdgeInsets.all(5.0)),
                    TextFormField(
                      onSaved: (value)=> emailAddress = value,
                      decoration: InputDecoration(
                          labelText: 'Email Address',
                          contentPadding: EdgeInsets.all(13.0)),
                      keyboardType: TextInputType.emailAddress,
                      //validator: validation.validateEmail,
                      validator: emailValidation,
                    ),
                    Container(padding: new EdgeInsets.all(13.0)),
                    TextFormField(
                        onSaved: (val)=>password = val,
                        decoration: InputDecoration(hintText: 'Enter password',
                          labelText: 'Password',
                          contentPadding: EdgeInsets.all(13.0),
                          suffixIcon: IconButton(
                              icon: Icon(Icons.remove_red_eye, color: qePrimaryText),
                              onPressed: toggle
                          ),
                        ),
                        autocorrect: false,
                        keyboardType: TextInputType.text,
                        obscureText: !showPassword,
                        validator: passwordValidation
                    ),
                    Container(padding: new EdgeInsets.all(8.0)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(onTap: () {
                          Navigator.push(context,
                              new MaterialPageRoute(
                                  builder: (context) => new RecoverPassword(title: 'Recover Password')));
                        }, child: new Text('Forgot Password?',style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold
                        ))),
                      ],
                    ),
                    Container(padding: new EdgeInsets.all(8.0)),
                    RaisedButton(
                      onPressed: state is AuthenticationLoading? null : () =>
                      _formKey.currentState.validate()
                          ? submit(_formKey)
                          : debugPrint('validation error'),
                      disabledColor: Colors.grey,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),),
                      color: Theme
                          .of(context)
                          .primaryColor,
                      child: state is LoginLoading ? CircularProgressIndicator() : Text(
                        "Submit", style: TextStyle(fontSize: 18.0),),
                    ),
                    Container(padding: new EdgeInsets.all(10.0)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("New to QuickEats? "),
                        GestureDetector(onTap: () {
                          Navigator.push(context,
                              new MaterialPageRoute(
                                  builder: (context) => new RegisterAccount(title: 'Registration')));
                        }, child: new Text('Register',style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold
                        ),)),
                      ],
                    ),
                  ],

                ),
              )
          ),
        );
      }
    );

  }
}