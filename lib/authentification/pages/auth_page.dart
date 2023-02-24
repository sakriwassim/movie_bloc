import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/my_colors.dart';
import '../../constants/small_button_style.dart';
import '../../constants/text_widget_text1.dart';
import '../controllers/auth_controller.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();
  String? errorMessage = '';

  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerPasswordConfirm =
      TextEditingController();

  Future<void> signIn() async {
    try {
      await Auth().signIn(
        email: _controllerEmail.text.trim(),
        password: _controllerPassword.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> signUp() async {
    try {
      await Auth().signUp(
        email: _controllerEmail.text.trim(),
        password: _controllerPassword.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _entryFieldPassword(String text, TextEditingController controller,
      Function function, bool passwordVisible) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            width: 3,
            color: Colors.greenAccent,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide:
              const BorderSide(width: 3, color: Color.fromARGB(31, 0, 0, 0)),
        ),
        labelText: text,
        suffixIcon: IconButton(
          icon: Icon(passwordVisible ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            function;
          },
        ),
      ),
      textInputAction: isLogin ? TextInputAction.done : TextInputAction.next,
      keyboardType: TextInputType.visiblePassword,
      obscureText: !passwordVisible,
      validator: (value) {
        if (value == null || value.isEmpty || value.length < 6) {
          return "Password should be at least 6 characters";
        }
      },
    );
  }

  Widget _entryFieldEmail(
    TextEditingController controller,
  ) {
    return TextFormField(
      controller: controller,
      decoration: decoration("Email"),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
        if (value == null || value.isEmpty || !emailRegExp.hasMatch(value)) {
          return "Enter a valid email address";
        }
      },
    );
  }

  Widget _errorMessage() {
    return Text(
      errorMessage == "" ? "" : "Humm? $errorMessage",
      style: TextStyle(color: Colors.red),
    );
  }

  Widget _submitButton() {
    return InkWell(
      onTap: () {
        final form = _formKey.currentState;
        if (form!.validate()) {
          isLogin ? signIn() : signUp();
        }
      },
      child: Button(
        gradientbackground: gradientbackground,
        fontSize: 25,
        fontWeight: FontWeight.w400,
        height: 50,
        text: 'Next',
        textcolor: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/icons/logo.png",
                  height: 150,
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 30,
                      right: 30,
                      top: 15,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text("Email"),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: _controllerEmail,
                                decoration: decoration("Email"),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  final emailRegExp = RegExp(
                                      r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                                  if (value == null ||
                                      value.isEmpty ||
                                      !emailRegExp.hasMatch(value)) {
                                    return "Enter a valid email address";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      Text("Password"),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: _controllerPassword,
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: const BorderSide(
                                          width: 3,
                                          color: Colors.greenAccent,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: const BorderSide(
                                            width: 3,
                                            color: Color.fromARGB(31, 0, 0, 0)),
                                      ),
                                      labelText: "Password",
                                      suffixIcon: IconButton(
                                        icon: Icon(_passwordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                        onPressed: () {
                                          setState(() {
                                            _passwordVisible =
                                                !_passwordVisible;
                                          });
                                        },
                                      ),
                                    ),
                                    textInputAction: isLogin
                                        ? TextInputAction.done
                                        : TextInputAction.next,
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: !_passwordVisible,
                                    validator: (value) {
                                      if (value == null ||
                                          value.isEmpty ||
                                          value.length < 6) {
                                        return "Password should be at least 6 characters";
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              !isLogin
                                  ? Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: const [
                                            Text("Confirm password"),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          obscureText: !_confirmPasswordVisible,
                                          decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: const BorderSide(
                                                width: 3,
                                                color: Colors.greenAccent,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: const BorderSide(
                                                  width: 3,
                                                  color: Color.fromARGB(
                                                      31, 0, 0, 0)),
                                            ),
                                            labelText: "Confirm password",
                                            suffixIcon: IconButton(
                                              icon: Icon(_confirmPasswordVisible
                                                  ? Icons.visibility
                                                  : Icons.visibility_off),
                                              onPressed: () {
                                                setState(() {
                                                  _confirmPasswordVisible =
                                                      !_confirmPasswordVisible;
                                                });
                                              },
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty ||
                                                value.length < 6 ||
                                                value !=
                                                    _controllerPassword.text) {
                                              return "Password doesn't match";
                                            }
                                          },
                                        ),
                                      ],
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                        ),
                        _errorMessage(),
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  final form = _formKey.currentState;
                                  if (form!.validate()) {
                                    isLogin ? signIn() : signUp();
                                  }
                                },

                                // () => isLogin ? signIn() : signUp(),
                                child: Button(
                                  gradientbackground: gradientbackground,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w400,
                                  height: 50,
                                  text: 'Next',
                                  textcolor: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: (() => setState(() {
                                isLogin = !isLogin;
                              })),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    style: const TextStyle(color: Colors.grey),
                                    text: isLogin
                                        ? "New user? "
                                        : "You have an account? "),
                                TextSpan(
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: MyColors.myGrey,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline),
                                    text: isLogin ? "Sign up" : "Login")
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
