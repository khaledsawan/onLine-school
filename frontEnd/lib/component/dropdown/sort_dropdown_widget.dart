import 'package:flutter/material.dart';

class SortDropDownWidget extends StatelessWidget {
  dynamic controller;
  SortDropDownWidget({Key? key, required this.controller}) : super(key: key);

  String dropdownvalue = 'id';
  var items = [
    'id',
    'firstName',
    'lastName',
    'email',
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      child: DropdownButton(
        value: controller.sortSelected,
        icon: const Padding(
          padding: EdgeInsets.all(4.0),
          child: Icon(Icons.sort),
        ),
        underline: const SizedBox(),
        alignment: Alignment.bottomRight,
        items: items.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),
        onChanged: (Object? value) {
          controller.changeSort(value);
        },
        // After selecting the desired option,it will
        // change button value to selected value
      ),
    );
  }
}
