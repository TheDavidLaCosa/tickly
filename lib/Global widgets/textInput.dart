import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class textInput extends StatefulWidget {

  final String text;

  const textInput({Key? key,
                   required this.text}) : super(key: key);

  @override
  State<textInput> createState() => _textInputState();
}

class _textInputState extends State<textInput> {

  final estat = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          TextField(
            style: const TextStyle(fontWeight: FontWeight.bold),
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
