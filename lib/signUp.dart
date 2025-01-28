import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'homa_screen.dart';

class SignPage extends StatefulWidget {
  const SignPage({super.key});

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasscontroller = TextEditingController();
  String password = "";
  bool hiddenPassword = true;
  final _formkey = GlobalKey<FormState>();
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: Text(
              context.tr("signing_up"),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
          // signup form
          Form(
              key: _formkey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      controller: namecontroller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        prefixIconColor: Colors.grey,
                        hintText: context.tr("full_name"),
                        enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              )),
                      validator: (value) {
                        //checking whether the name starts with capital number or not
                        if (value != null && value.isEmpty) {
                          return "name not valid";
                        } else if (value != null &&
                            !value[0].contains(RegExp(r'[A-Z]'))) {
                          SnackBar snackBar = SnackBar(
                            content: Text(context
                                .tr("name_validation")),
                            duration: Duration(seconds: 2),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      controller: emailcontroller,
                      decoration:
                          InputDecoration(
                            prefixIcon: Icon(Icons.email_outlined),
                            prefixIconColor: Colors.grey,
                            hintText: context.tr("email"),
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
                            content: Text(
                                context.tr("email_validation")),
                            duration: Duration(seconds: 2),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      controller: passwordcontroller,
                      obscureText: hiddenPassword,
                      validator: (value) {
                        //checking the validation of the password
                        if (value != null && value.isEmpty) {
                          return "password is empty";
                        } else if (value != null && value.length < 6) {
                          password = value;
                          SnackBar snackBar = SnackBar(
                            content: Text(context.tr(
                                "password_validation")),
                            duration: Duration(seconds: 2),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline),
                        prefixIconColor: Colors.grey,
                          hintText: context.tr("password"),
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
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      controller: confirmpasscontroller,
                      obscureText: hiddenPassword,
                      validator: (value) {
                        //checking the validation of the confirmed password
                        if (value != null && value.isEmpty) {
                          return "password not valid";
                        } else if (value != null &&
                            (value != password && value.length < 6)) {
                          print("password incorrect");
                          SnackBar snackBar = SnackBar(
                            content: Text(context.tr("confirmpassword_validation")),
                            duration: Duration(seconds: 2),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          return "";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline),
                        prefixIconColor: Colors.grey,
                          hintText: context.tr("confirm_password"),
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
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          myDialog(); // dialog message that data is valid
                        } else {
                          SnackBar snackBar = SnackBar(
                            //snackbar showing if the data is valid or not
                            content: Text(context.tr("form_validation")),
                            duration: Duration(seconds: 2),
                            action: SnackBarAction(label: "", onPressed: () {}),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: Text(context.tr("login")))
                ],
              ))
        ],
      ),
    );
  }

  togglePassword() {
    //hidding password function
    hiddenPassword = !hiddenPassword;
    setState(() {});
  }

  Future<void> myDialog() async {
    // dialog function
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(context.tr("alert_dialog")),
          content: Text(context.tr("account_creation")),
          actions: <Widget>[
            TextButton(
              child: Text(context.tr("dialog_confirm")),
              onPressed: () {
                Navigator.of(context).push(
                    _createRoute() //function to create animation for the transition
                    );
              },
            ),
          ],
        );
      },
    );
  }

  changeLang() {
    if (context.locale == Locale('en', 'US')) {
      context.setLocale(Locale('ar', 'EG'));
    } else {
      context.setLocale(Locale('en', 'US'));
    }
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => MyHomePage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}
