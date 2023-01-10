import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {

  final String text;

  const TextInput({Key? key,
                   required this.text}) : super(key: key);

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {

  final estat = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,

      decoration: BoxDecoration(
        color: Colors.white, //S'ha de posar blanc per a que no es vegi l'hombra dins el textInput.
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(1),
            blurRadius: 1,
            offset: const Offset(0, 4), // changes position of shadow
          ),
        ],
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          TextField(
            style: const TextStyle(fontWeight: FontWeight.bold,
                                   fontFamily: "jaldi",
                                   fontSize: 20),
            controller: estat,
            decoration: InputDecoration(
              hintText: widget.text, //Posem widget perqué és statefull.
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  estat.clear();
                },
                icon: const Icon(Icons.clear),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
