import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
 class PinField extends StatelessWidget {
     PinField({required this.result,this.onSubmmit});
     TextEditingController result;
     final onSubmmit;

   @override
   Widget build(BuildContext context) {
     return Container(
       margin: EdgeInsets.symmetric(horizontal: 20),
       child: Form(
         child:  Padding(
           padding: const EdgeInsets.symmetric(
               vertical: 8.0, horizontal: 10),
           child: PinCodeTextField(
             pinTheme: PinTheme(
                 shape: PinCodeFieldShape.underline,
                 borderRadius: BorderRadius.circular(5),
                 fieldHeight: 50,
                 fieldWidth: 20,
                 activeColor: Colors.indigo[700],
                 inactiveColor: Colors.grey
             ),
             appContext: context,
             controller: result,
             onChanged: (value){

             },
             pastedTextStyle: TextStyle(
               color: Colors.indigo[700],
               fontWeight: FontWeight.bold,
             ),
             length: 6,
             obscureText: true,
             obscuringCharacter: '*',
                   onSubmitted: onSubmmit,
           ),),
       ),
     );
   }
 }
