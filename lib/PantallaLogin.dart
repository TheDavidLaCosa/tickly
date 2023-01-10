import 'package:flutter/material.dart';
import 'package:tickly/PantallaRegister.dart';

import 'Global widgets/redButton.dart';
import 'Global widgets/redText.dart';
import 'Global widgets/textInput.dart';

class PantallaLogin extends StatelessWidget {

  final txtInEmail = TextEditingController();
  final txtInPassword = TextEditingController();

  PantallaLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(232, 231, 231, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Text("Hello Again!", style: TextStyle(fontFamily: "jaldi",
              fontSize: 50,
              fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          const Text("Wellcome back, you've been missed",style: TextStyle(fontFamily: "jaldi",
              fontSize: 20,
              fontWeight: FontWeight.bold)),

          const SizedBox(height: 60),
          TextInput(text: "Enter email address", controller: txtInEmail,),

          Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                const SizedBox(height: 10),
                TextInput(text: "Password", controller: txtInPassword),
                const SizedBox(height: 10),
                RedText(text: "Forgot password?", textSize: 25, function: () => {print("a")}),
              ]
          ),
          const SizedBox(height: 50),
          RedButton(text: "Sign in", function: () => {print(txtInEmail.text)}),
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

          //TODO: Borrar aquesta línia abans d'entrega.
          RedButton(text: "[[[CLOSE MENÚ]]]", function: () => {Navigator.pop(context)})
        ],
      ),
    );
  }
}
