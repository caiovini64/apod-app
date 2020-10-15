import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DatePicker extends StatefulWidget {
  DatePicker({
    @required this.selectedDate,
  });

  DateTime selectedDate;

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
      child: GestureDetector(
          child: Container(
            width: 500,
            height: 50,
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 3),
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.selectedDate == null
                        ? 'Pick a date '
                        : widget.selectedDate.toString().substring(0, 10),
                    style: TextStyle(
                      color: Theme.of(context).textSelectionColor,
                    ),
                  ),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),
          onTap: () {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            ).then((date) {
              setState(() {
                widget.selectedDate = date;
              });
            });
          }),
    );
  }
}
