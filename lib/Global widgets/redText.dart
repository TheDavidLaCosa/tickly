import 'package:flutter/cupertino.dart';

class redText extends StatelessWidget {

  final String text;
  final double textSize;
  final Function() function;

  const redText({Key? key,
                 required this.text,
                 required this.textSize,
                 required this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Center(
        child: Text(text, style: TextStyle(color: const Color.fromRGBO(255, 0, 0, 1),
                                                 fontSize: textSize)),
      ),
    );
  }
}
