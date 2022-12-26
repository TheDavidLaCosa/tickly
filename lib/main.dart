import 'package:flutter/material.dart';
import 'package:tickly/Global%20widgets/redButton.dart';
import 'package:tickly/Global%20widgets/redText.dart';
import 'package:tickly/Global%20widgets/textInput.dart';

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
            redText(text: "Forgot password?", textSize: 25, function: doSomething,),
            const SizedBox(height: 10,),
            redButton(text: 'Sing up', function: doSomething,),
            const SizedBox(height: 10,),
            const textInput(text: "Keyword of event"),
          ],
        ),
      ),
    );
  }
  //Aquesta el nom és temporal, la funció es fa servir per veure que funciona el GestureDetector
  void doSomething(){
    print("AAA");
  }

}
