// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:ecommerceapiqa/controllers/data_provider.dart';
import 'package:ecommerceapiqa/view/constants/colors_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
//login usage
  TextEditingController usernameNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode myNode = FocusNode();
  FocusNode myNode2 = FocusNode();
  var indicator = false;

  final _formKey = GlobalKey<FormState>();

  void _submit() {
    setState(() {
      indicator = true;
    });
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      Provider.of<DataProvider>(context, listen: false).signIn(
          usernameNameController.text, passwordController.text, context);
    }
    var data = Provider.of<DataProvider>(context, listen: false);
    setState(() {
      indicator = data.indicator;
    });
    data.indicator == false ? indicator = false : indicator = true;
    _formKey.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: SafeArea(
              bottom: true,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.21),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                            image: AssetImage("assets/images/loginHead.jpg"),
                            fit: BoxFit.fitHeight),
                      ),
                    ),

                    //Login Section
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      fontSize: 35, color: kPrimaryColor),
                                )),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                focusNode: myNode,
                                controller: usernameNameController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    labelText: "UserName",
                                    labelStyle: TextStyle(
                                        color: myNode.hasFocus
                                            ? Color(0xFf12C7A5)
                                            : Colors.grey),
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide: BorderSide(
                                            color: Color(0xFF12C7A5))),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                        borderSide: BorderSide(
                                            color: Color(0xFfE8E8E8))),
                                    fillColor: CupertinoColors.white,
                                    filled: true),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter valid Username";
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                focusNode: myNode2,
                                controller: passwordController,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: "Password",
                                  labelStyle: TextStyle(
                                      color: myNode2.hasFocus
                                          ? Color(0xFf12C7A5)
                                          : Colors.grey),
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7),
                                      borderSide:
                                          BorderSide(color: Color(0xFf12C7A5))),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7),
                                      borderSide:
                                          BorderSide(color: Color(0xFfE8E8E8))),
                                  fillColor: CupertinoColors.white,
                                  filled: true,
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                      color: Colors.grey.withOpacity(.50)),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return ("Please enter password");
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 35.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: CupertinoButton(
                                    borderRadius: BorderRadius.circular(4),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        indicator
                                            ? Text(
                                                "Logging in",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            : Text(
                                                "Login",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        indicator
                                            ? SizedBox(
                                                width: 20,
                                                height: 20,
                                                child:
                                                    CircularProgressIndicator(
                                                  backgroundColor: Colors.white,
                                                  strokeWidth: 2,
                                                  valueColor:
                                                      AlwaysStoppedAnimation(
                                                          Colors.black),
                                                ))
                                            : Container(),
                                      ],
                                    ),
                                    color: kPrimaryColor,
                                    onPressed: () {
                                      setState(() {
                                        indicator = true;
                                      });
                                      Future.delayed(
                                          const Duration(milliseconds: 2000),
                                          () {
                                        _submit();
                                      });
                                    }),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
