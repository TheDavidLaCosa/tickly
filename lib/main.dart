import 'package:flutter/material.dart';
import 'package:tickly/Global%20widgets/redButton.dart';
import 'package:tickly/Global%20widgets/redText.dart';
import 'package:tickly/Global%20widgets/textInput.dart';
import 'package:tickly/Global%20widgets/timePicker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//TODO: Mirar si cal posar classe Padding en general o fer padding classe per classe
class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RedButton(text: 'Sing up', function: doSomething,),
          ],
        ),
      ),
    );
  }

  //Aquesta el nom és temporal, la funció es fa servir per veure que funciona el GestureDetector
  void doSomething(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => const PantallaLogin()));
  }

  //Aquesta el nom és temporal, la funció es fa servir per veure que funciona el GestureDetector
  void CarregaLogin(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => const PantallaLogin()));
  }
}

class PantallaLogin extends StatelessWidget {
  const PantallaLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 50,),
            const Text("Hello Again!", style: TextStyle(fontFamily: "jaldi",
                                                        fontSize: 50)),
            const SizedBox(height: 10),
            const Text("Wellcome back, you've been missed",style: TextStyle(fontFamily: "jaldi", fontSize: 20)),
            const SizedBox(height: 10),
            const TextInput(text: "Enter email text"),
            const SizedBox(height: 10),
            const TextInput(text: "Enter email text"),
            const SizedBox(height: 10),
            RedText(text: "Sign in", textSize: 25, function: () => {print("a")}),
            const SizedBox(height: 10),
            RedButton(text: "Sign in", function: () => {print("a")}),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text("Not a member?  ", style: TextStyle(fontFamily: "jaldi", fontSize: 25)),
                RedText(text: "Register here", textSize: 25, function: () => {print("a")})
              ],
            ),
            const SizedBox(height: 30),
            RedButton(text: "[[[CLOSE MENÚ]]]", function: () => {Navigator.pop(context)})
          ],
        ),
    );
  }
}
