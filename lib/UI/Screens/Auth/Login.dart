import 'package:flutter/material.dart';
import 'package:preview/Providers/auth_Provider.dart';

import 'package:preview/UI/widgets/MyTextField.dart';
import 'package:preview/UI/widgets/loading.dart';
import 'package:preview/core/dudes/validators/auth_validator.dart';
// import 'package:preview/services/auth_service.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  // final _scaffoldState = GlobalKey<ScaffoldState>();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, authProvider, child) {
      return
       authProvider.loading
          ? LoadingWidget()
          :
           SafeArea(
              child: Scaffold(
                backgroundColor: Colors.blue[900],
                body: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Form(
                      autovalidate:
                          //  AutovalidateMode.onUserInteraction
                          authProvider.autoValidate,
                      key: formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListView(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 250),

                            // SizedBox(height: 15),
                            MyTextField(
                              // autovalidateMode: AutovalidateMode.onUserInteraction,

                              labelText: 'Email',
                              obscureText: false,
                              validator: (val) =>
                                  AuthValidator().validateEmail(val),
                              controller: emailCtrl,
                              hintText: 'email@email.com',
                              // onchanged: (String value) {
                              //   AuthValidator().validateEmail(value);
                              // },
                            ),
                            SizedBox(height: 15),
                            MyTextField(
                              labelText: 'Password',
                              obscureText: true,
                              validator: (val) =>
                                  AuthValidator().validatePassword(val),
                              controller: passwordCtrl,
                              hintText: '*******',
                              // validator: (value) => authProvider.validatePassword(value),
                            ),
                            SizedBox(height: 30),
                            // Material(
                            //   borderRadius: BorderRadius.circular(30.0),

                            //   child:
                            MaterialButton(
                              elevation: 20,
                              color: Colors.blue,
                              minWidth: MediaQuery.of(context).size.width,
                              padding:
                                  EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                    fontStyle: FontStyle.italic),
                                textAlign: TextAlign.center,
                              ),
                              onPressed: () {
                                if (formKey.currentState.validate()) {
                                  authProvider.setLoading(true);
                                  authProvider.logIn(emailCtrl.text,
                                      passwordCtrl.text, context);
                                } else {
                                  if(authProvider.autoValidate == true && authProvider.loading== false) {
                                    ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                      authProvider.message,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    backgroundColor: Colors.blue[100],
                                    elevation: 5,
                                    behavior: SnackBarBehavior.floating,
                                    duration: Duration(seconds: 3),
                                  ),);

                                }else{
                                   authProvider.setAutoValidate(true);
                                }
                                  // authProvider.setAutoValidate(true);
                                  // authProvider.setLoading(false);
                                  // ScaffoldMessenger.of(context)
                                  //     .showSnackBar(SnackBar(
                                  //   content: Text(
                                  //     authProvider.message,
                                  //     style: TextStyle(color: Colors.white),
                                  //   ),
                                  //   backgroundColor: Colors.white,
                                  //   elevation: 5,
                                  //   behavior: SnackBarBehavior.floating,
                                  //   duration: Duration(seconds: 3),
                                  // ),);
                                }
                              },
                            ),

                            // ),

                            SizedBox(height: 30),

                            GestureDetector(
                              onTap: () {},
                              child: RichText(
                                text: TextSpan(
                                  text: 'Forgot password?',
                                  style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                      fontStyle: FontStyle.italic),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Center(
                              child: GestureDetector(
                                onTap: () =>
                                    Navigator.of(context).pushNamed('/signUp'),
                                child: RichText(
                                  text: TextSpan(
                                    text: "Don't have an account ? ",
                                    style: TextStyle(color: Colors.cyan),
                                    children: <TextSpan>[
                                      TextSpan(text: 'Sign Up'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            // Center(child: Text('Login ')),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
    });
  }
}
