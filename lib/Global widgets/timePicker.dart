import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {

  const TimePicker({Key? key}) : super(key: key);

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {

  void _showDatePicker(){
    showDatePicker(context: context,
                   initialDate: DateTime.now(),
                   firstDate: DateTime.now(),
                   lastDate: DateTime(DateTime.now().year + 5));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 40,

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

      child: MaterialButton(
          onPressed: _showDatePicker,
          child: Center(
            child: Text(DateFormat('dd-MM-yyyy').format(DateTime.now()), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: Color.fromRGBO(
                52, 52, 52, 1.0))),
              ),
            ),
    );
  }
}
