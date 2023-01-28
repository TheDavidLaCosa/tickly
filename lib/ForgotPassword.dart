import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Global widgets/redButton.dart';
import 'Global widgets/textInput.dart';
import 'PantallaLogin.dart';

class ForgotPassword extends StatefulWidget {

  ForgotPassword({Key? key}) : super(key: key);

  final controller = TextEditingController();

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(210, 36, 36, 1),
          title: const Text('TICKLY',
              style: TextStyle(fontFamily: "jaldi", fontSize: 30)),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, size: 25),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (BuildContext context) => PantallaLogin()));
            },
          ),
        ),
        backgroundColor: const Color.fromRGBO(232, 231, 231, 1),
        body: Center(
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text("Enter your e-mail to reset your password",
                             style: TextStyle(fontFamily: "jaldi", fontSize: 25)),
                  const SizedBox(height: 20,),
                  TextInput(text: "Enter email address", controller: widget.controller, hide: false),
                  const SizedBox(height: 20,),
                  RedButton(text: "Send email", function: () => {sendEmail()}),
                ],
              ),
            )
        )
    );
  }

  Future sendEmail() async {

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
          email: widget.controller.text,);
    } on FirebaseAuthException catch (error) {

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.message.toString()),
        backgroundColor: const Color.fromRGBO(210, 36, 36, 1),
      ));

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => PantallaLogin()));

    }
  }

}
