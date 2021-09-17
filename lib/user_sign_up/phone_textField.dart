import 'package:flutter/material.dart';

class PhoneTextField extends StatelessWidget {
  PhoneTextField({this.text,this.onChange});
  final text;
  final onChange;

  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: TextField(
        onChanged: onChange,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          filled: true,
          hintText: text,
          hintStyle: TextStyle(
              fontSize: 20,
              color: Colors.grey[600]
          ),
          fillColor: Colors.grey.withOpacity(0.5),
          border:OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.0),
              borderSide: BorderSide(
                width: 0,
                  style: BorderStyle.none
              )
          ),
        ),
      ),
    );
  }
}
