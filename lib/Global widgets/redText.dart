import 'package:flutter/cupertino.dart';

class RedText extends StatelessWidget {

  final String text;
  final double textSize;
  final Function() function;

  const RedText({Key? key,
                 required this.text,
                 required this.textSize,
                 required this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        child: Text(text,
                    style: TextStyle(color: const Color.fromRGBO(210, 36, 36, 1),
                    fontSize: textSize,
                    fontFamily: "jaldi")
        ),
      ),
    );
  }
}
