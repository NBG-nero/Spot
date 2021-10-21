import 'package:flutter/material.dart';
import 'package:preview/Providers/auth_Provider.dart';
import 'package:preview/UI/widgets/MyTextField.dart';
import 'package:preview/core/dudes/validators/auth_validator.dart';
// import 'package:preview/services/auth_service.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, authProvider, child) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blue[600],
          // appBar: AppBar(

          // centerTitle: true,
          // title: Text('Sign up'),
          // ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: Form(
                 autovalidate:
                //  AutovalidateMode.onUserInteraction
                authProvider.autoValidate
                ,
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView(
                    children: [
                      SizedBox(height: 230),
                      MyTextField(
                        labelText: 'Name',
                        obscureText: false,
                        validator: (val) => AuthValidator().validateName(val),
                        controller: nameCtrl,
                        hintText: 'Frances',
                      ),
                      SizedBox(height: 15),
                      MyTextField(
                        labelText: 'Email',
                        obscureText: false,
                        validator: (val) => AuthValidator().validateEmail(val),
                        controller: emailCtrl,
                        hintText: 'email@email.com',
                        // onchanged: (String value) {
                        //   authProvider.validateEmail(value);
                        // },
                      ),
                      SizedBox(height: 15),
                      MyTextField(
                        labelText: 'Password',
                        obscureText: true,
                        hintText: '*******',
                        validator: (val) => AuthValidator().validatePassword(val),
                        controller: passwordCtrl,
                        // onchanged: (String value) {
                        //   authProvider.validatePassword(value);
                        // },
                      ),
                      // SizedBox(height: 15),
                      // MyTextField(
                      //   labelText: ' Confirm Password',
                      //   obscureText: false,
                      //   hintText: '*******',
                      //   // validator: (value) => authProvider.validatePassword(value),
                      //   errorText: authProvider.cpassword.error,
                      //   onchanged: (String value) {
                      //     authProvider.confirmPassword(value);
                      //   },
                      // ),
                      SizedBox(height: 30),
                      MaterialButton(
                          elevation: 20,
                          color: Colors.blue,
                          minWidth: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                fontStyle: FontStyle.italic),
                            textAlign: TextAlign.center,
                          ),
                          onPressed: () {
                            if (formKey.currentState.validate()) {
                              authProvider.signUp(
                                  nameCtrl.text, emailCtrl.text, passwordCtrl.text, context);
                            } else {
                              authProvider.setAutoValidate(true);
                              
                            }
                          }),
                      SizedBox(height: 30),
                      IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          onPressed: () =>
                              Navigator.of(context).pushNamed('/login')),
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
