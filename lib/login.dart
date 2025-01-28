import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/homa_screen.dart';
import 'package:shopping_app/signUp.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool hiddenPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
              onPressed: () {
                changeLang();
              },
              child: Icon(Icons.language_rounded))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(45.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Text(
                  context.tr("login"),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.tr("email"),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        child: TextFormField(
                          controller: emailcontroller,
                          decoration: InputDecoration(
                              hintText: "Type your Email",
                              prefixIcon: Icon(Icons.email_outlined),
                              prefixIconColor: Colors.grey,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              )),
                          validator: (value) {
                            //checking the validation of an email
                            if (value != null && value.isEmpty) {
                              return "email can't be empty";
                            } else if (value != null && !value.contains('@')) {
                              print("email must have");
                              SnackBar snackBar = SnackBar(
                                content: Text(context.tr("email_validation")),
                                duration: Duration(seconds: 2),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.tr("password"),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        child: TextFormField(
                          controller: passwordcontroller,
                          obscureText: hiddenPassword,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock_outlined),
                              prefixIconColor: Colors.grey,
                              hintText: "Type your password",
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    togglePassword(); //the button of password visibility
                                  },
                                  icon: Icon(hiddenPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off))),
                          validator: (value) {
                            //checking the validation of the password
                            if (value != null && value.isEmpty) {
                              return "password is empty";
                            } else if (value != null && value.length < 6) {
                              SnackBar snackBar = SnackBar(
                                content:
                                    Text(context.tr("password_validation")),
                                duration: Duration(seconds: 2),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () async {
                            if (_formkey.currentState!.validate()) {
                              _formkey.currentState!.save();
                              try {
                                final credential = await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                        email: emailcontroller.text,
                                        password: passwordcontroller.text);
                                if (credential.user != null) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyHomePage()));
                                }
                              } on FirebaseAuthException {
                                SnackBar snackBar = SnackBar(
                                  content:
                                      Text(context.tr("account not found")),
                                  duration: Duration(seconds: 2),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              } catch (e) {
                                print(e);
                              }
                            } else {
                              SnackBar snackBar = SnackBar(
                                content: Text("enter a valid data"),
                                duration: Duration(seconds: 2),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          },
                          child: Text(context.tr("login"))),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignPage()));
                          },
                          child: Text(context.tr("signUp")))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  togglePassword() {
    //hidding password function
    hiddenPassword = !hiddenPassword;
    setState(() {});
  }

  changeLang() {
    if (context.locale == Locale('en', 'US')) {
      context.setLocale(Locale('ar', 'EG'));
    } else {
      context.setLocale(Locale('en', 'US'));
    }
  }
}
