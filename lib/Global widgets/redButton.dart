///
/// NOTA: No posar textos molt llargs que si no la caixa es fa massa gran.
///

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RedButton extends StatelessWidget {

  final String text;
  final Function() function;

  const RedButton({Key? key,
                  required this.text,
                  required this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(210, 36, 36, 1),
          borderRadius: BorderRadius.circular(10),
          border: null,

          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(1),
              blurRadius: 1,
              offset: const Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 300,
              height: 50,
              //padding: const EdgeInsets.fromLTRB(110, 10, 110, 10),
              child: Center(
                child: Text(text, style: const TextStyle(fontSize: 25,
                                                         fontWeight: FontWeight.w300,
                                                         color: Color.fromRGBO(255, 255, 255, 1.0),
                                                         fontFamily: "jaldi",)),

              ),
            ),

          ]
        ),
      ),
    );
  }
}
