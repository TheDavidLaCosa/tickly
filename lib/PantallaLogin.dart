import 'package:flutter/material.dart';
import 'package:tickly/ForgotPassword.dart';
import 'package:tickly/PantallaRegister.dart';
import 'package:tickly/PantallaSearch.dart';

import 'Global widgets/redButton.dart';
import 'Global widgets/redText.dart';
import 'Global widgets/textInput.dart';

import 'package:firebase_auth/firebase_auth.dart';

class PantallaLogin extends StatefulWidget {

  PantallaLogin({super.key});

  final txtInEmail = TextEditingController();
  final txtInPassword = TextEditingController();

  @override
  State<PantallaLogin> createState() => _PantallaLoginState();
}

class _PantallaLoginState extends State<PantallaLogin> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(232, 231, 231, 1),
      body: Center(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text("Hello Again!", style: TextStyle(fontFamily: "jaldi",
                  fontSize: 50,
                  fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              const Text("Welcome back, you've been missed",style: TextStyle(fontFamily: "jaldi",
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),

              const SizedBox(height: 60),
              TextInput(text: "Enter email address", controller: widget.txtInEmail, hide: false),

              Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    const SizedBox(height: 10),
                    TextInput(text: "Password", controller: widget.txtInPassword, hide: true),
                    const SizedBox(height: 10),
                    RedText(text: "Forgot password?", textSize: 25, function: () => {Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (BuildContext context) => ForgotPassword()))}),
                  ]
              ),
              const SizedBox(height: 50),
              RedButton(text: "Sign in", function: () => {signIn()}),
              const SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("Not a member?  ", style: TextStyle(fontFamily: "jaldi", fontSize: 25)),
                  RedText(text: "Register here", textSize: 25, function: () => {Navigator.of(context).pushReplacement(
                                                                                MaterialPageRoute(builder: (BuildContext context) => PantallaRegister()))})
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      )
    );
  }

  Future signIn() async {

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: widget.txtInEmail.text,
          password: widget.txtInPassword.text);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => PantallaSearch()));
    } on FirebaseAuthException catch (error) {

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.message.toString()),
        backgroundColor: const Color.fromRGBO(210, 36, 36, 1),
      ));

    }
  }

  @override
  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }
}


