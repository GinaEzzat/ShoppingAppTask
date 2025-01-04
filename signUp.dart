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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100.0, left: 5.0),
            child: Text(
              "Create Account",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
                      decoration: InputDecoration(labelText: "Full Name"),
                      validator: (value) { //checking whether the name starts with capital number or not
                        if (value != null && value.isEmpty) {
                          return "name not valid";
                        } else if (value != null &&
                            !value[0].contains(RegExp(r'[A-Z]'))) {
                          SnackBar snackBar = SnackBar(
                            content:
                                Text("name must start with a capital letter"),
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
                      decoration: InputDecoration(labelText: "Email"),
                      validator: (value) { //checking the validation of an email 
                        if (value != null && value.isEmpty) {
                          return "email can't be empty";
                        } else if (value != null && !value.contains('@')) {
                          print("email must have");
                          SnackBar snackBar = SnackBar(
                            content: Text("email must contain @ character"),
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
                      validator: (value) { //checking the validation of the password
                        if (value != null && value.isEmpty) {
                          return "password is empty";
                        } else if (value != null && value.length < 6) {
                          password = value;
                          SnackBar snackBar = SnackBar(
                            content: Text(
                                "password must have at least 6 characters"),
                            duration: Duration(seconds: 2),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: "Password",
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
                      validator: (value) { //checking the validation of the confirmed password
                        if (value != null && value.isEmpty) {
                          return "password not valid";
                        } else if (value != null &&
                            (value != password && value.length < 6)) {
                          print("password incorrect");
                          SnackBar snackBar = SnackBar(
                            content: Text("passwords don't match"),
                            duration: Duration(seconds: 2),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          return "";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: "Confirm Password",
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
                          SnackBar snackBar = SnackBar( //snackbar showing if the data is valid or not
                            content: Text("enter a valid data"),
                            duration: Duration(seconds: 2),
                            action: SnackBarAction(label: "", onPressed: () {}),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: Text("Login"))
                ],
              ))
        ],
      ),
    );
  }

  togglePassword() { //hidding password function
    hiddenPassword = !hiddenPassword;
    setState(() {});
  }

  Future<void> myDialog() async { // dialog function 
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog'),
          content: Text("account created successfully"),
          actions: <Widget>[
            TextButton(
              child: const Text('close'),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MyHomePage()));
              },
            ),
          ],
        );
      },
    );
  }
}
