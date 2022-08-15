import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  @override
  loginScreen createState() => loginScreen();
}

class loginScreen extends State<MyHomePage> {
  final _controllerEmail = TextEditingController();
  final _controllerPassWord = TextEditingController();
  bool _obscureText = true;
  bool isRememberMe = false;
  String email = '';
  String password = '';
  bool remember_me = false;
  bool checkInputEmail = false;
  Map<String, String> get headers => {
        "Content-Type": "application/json",
        "Accept": "application/json",
      };
  String? get _errorText {
    final text = _controllerEmail.value.text;
    if (checkInputEmail) {
      if (text.isEmpty || !text.contains('@')) {
        return 'Email Is invalid';
      }
    }
    return null;
  }

  Future<void> login() async {
    //replace your restFull API here.
    String url = "http://127.0.0.1:8000/api/login/";
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
    Map<String, dynamic> data = {
      "remember_me": remember_me.toString(),
      "email": email,
      "password": password,
    };
    final response = await http.post(Uri.parse(url), body: data);

    var responseData = json.decode(response.body);

    print(responseData);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 19, 93, 231),
                Color.fromARGB(255, 255, 81, 0),
                Color.fromARGB(255, 255, 0, 221),
              ]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 80,
            ),
            Text(
              "Login\nCatchyBeauty",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255)),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 500,
              width: 355,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Welcome !!",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Please Login To Your Account.",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  inputText(
                    typeController: _controllerEmail,
                    label: "Email Adress",
                    paramsValidator: _errorText,
                    paramsOnSave: (value) {
                      setState(() {
                        if (!checkInputEmail) {
                          checkInputEmail = true;
                        }
                        email = value;
                      });
                    },
                    obscureText: false,
                    icon_off: FontAwesomeIcons.envelope,
                    icon: FontAwesomeIcons.envelope,
                    press: () {},
                  ),
                  inputText(
                    typeController: _controllerPassWord,
                    label: "Password",
                    paramsValidator: '',
                    paramsOnSave: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                    obscureText: _obscureText,
                    icon_off: FontAwesomeIcons.eye,
                    icon: FontAwesomeIcons.eyeSlash,
                    press: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Checkbox(
                            value: isRememberMe,
                            activeColor: Color.fromARGB(255, 255, 153, 0),
                            onChanged: (value) {
                              setState(() {
                                isRememberMe = value!;
                                remember_me = isRememberMe;
                              });
                            },
                          ),
                          Text(
                            "Remember Me",
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 94, 0),
                            ),
                          ),
                        ]),
                        Text(
                          'Forget Password',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 94, 0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      print("--------------------------------------");
                      login();
                      print("--------------------------------------");
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromARGB(255, 19, 93, 231),
                              Color.fromARGB(255, 255, 81, 0),
                              Color.fromARGB(255, 255, 0, 221),
                            ]),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(FontAwesomeIcons.facebookF),
                      Icon(FontAwesomeIcons.solidEnvelope),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class inputText extends StatelessWidget {
  final String label;
  final TextEditingController typeController;
  final bool obscureText;
  final IconData icon;
  final IconData icon_off;
  final VoidCallback press;
  final paramsOnSave;
  final paramsValidator;
  const inputText({
    Key? key,
    required this.label,
    required this.obscureText,
    required this.typeController,
    required this.icon,
    required this.icon_off,
    required this.press,
    required this.paramsValidator,
    required this.paramsOnSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 250,
        child: TextField(
          controller: typeController,
          onChanged: paramsOnSave,
          obscureText: obscureText,
          decoration: InputDecoration(
            errorText: paramsValidator,
            labelText: label,
            suffixIcon: InkWell(
              onTap: press,
              child: Icon(
                obscureText ? icon : icon_off,
                size: 17,
              ),
            ),
          ),
        ));
  }
}
