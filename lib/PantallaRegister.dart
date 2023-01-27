import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tickly/PantallaLogin.dart';

import 'Global widgets/redButton.dart';
import 'Global widgets/redText.dart';
import 'Global widgets/textInput.dart';

/*TODO: En les línies 38,40, 42 i 45 hi ha coses a canviar (no es pot fer fins
        a que estigui fet el merge amb login (ho he fet per evitar conflictes)).*/

class PantallaRegister extends StatefulWidget {
  PantallaRegister({Key? key}) : super(key: key);

  final txtEmail = TextEditingController();
  final txtPassword = TextEditingController();
  final txtRepPassword = TextEditingController();

  @override
  State<PantallaRegister> createState() => _PantallaRegisterState();
}

class _PantallaRegisterState extends State<PantallaRegister> {

  void saveData() {

    if(widget.txtEmail.text == "" || widget.txtPassword.text == "" || widget.txtRepPassword.text == ""){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Falten dades"),
      ));

      register();
      return;
    }
  }

  Future register() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: widget.txtEmail.text,
          password: widget.txtPassword.text);
    } on FirebaseAuthException catch (error) {

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.message.toString()),
        backgroundColor: const Color.fromRGBO(210, 36, 36, 1),
      ));

      return;
    }
  }

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
              const Text("Welcome!", style: TextStyle(fontFamily: "jaldi",
                  fontSize: 50,
                  fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              const Text("One step closer to start enjoying Tickly",style: TextStyle(fontFamily: "jaldi",
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),

              const SizedBox(height: 60),
              TextInput(text: "Enter email address", controller: widget.txtEmail),
              const SizedBox(height: 15),
              TextInput(text: "Password", controller: widget.txtPassword),
              const SizedBox(height: 15),
              TextInput(text: "Repeat password", controller: widget.txtRepPassword),

              const SizedBox(height: 50),
              RedButton(text: "Sign up", function: () => {register()}),
              const SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("Already a member?  ", style: TextStyle(fontFamily: "jaldi", fontSize: 25)),
                  RedText(text: "Log in here", textSize: 25, function: () => {Navigator.of(context).pushReplacement(
                                                                              MaterialPageRoute(builder: (BuildContext context) => PantallaLogin()))})
                ],
              ),
              const SizedBox(height: 30),
          ],
        ),
      )
      )
    );;
  }
}
