import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tickly/Global%20widgets/redButton.dart';
import 'package:tickly/Global%20widgets/redText.dart';
import 'package:tickly/Global%20widgets/textInput.dart';
import 'package:tickly/Global%20widgets/timePicker.dart';
import 'package:tickly/PantallaRegister.dart';
import 'PantallaLogin.dart';
import 'PantallaInfo.dart';
import 'PantallaSearch.dart';
import 'PantallaInfo.dart';
import 'PantallaFavourites.dart';
import 'PantallaResults.dart';
import 'PantallaNearEvent.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(Firebase.apps.isEmpty){
    await Firebase.initializeApp(name: 'Tickly', options: DefaultFirebaseOptions.currentPlatform,);
  }
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
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: "Hola"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot){
            if (snapshot.hasData) { //Si s'ha fet login carreguem el menú search.
              return PantallaSearch();
            }
            return PantallaLogin();
          }
      ),
    );
  }
  //Aquesta el nom és temporal, la funció es fa servir per veure que funciona el GestureDetector
  void doSomething(){
    Navigator.push(context,
                   MaterialPageRoute(builder: (context) => PantallaRegister()));
  }

  //Aquesta el nom és temporal, la funció es fa servir per veure que funciona el GestureDetector
  void CarregaLogin(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => PantallaLogin()));
  }
}
