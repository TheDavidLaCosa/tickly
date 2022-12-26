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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget> [
        SizedBox(
          width: 300,
          height: 50,
          child: TextField(
            controller: estat,
            decoration: InputDecoration(
              hintText: widget.text, //Posem widget perqué és statefull.
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                onPressed: () {
                  estat.clear();
                },
                icon: const Icon(Icons.clear),
              ),
            ),
          ),
        )
      ],
    );
  }
}
