import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget DefaultFormField({
  required String label,
  required IconData prefix,
  IconData? suffix,
  required FormFieldValidator function,
  required TextEditingController controller,
  bool isPassword = false,
  TextInputType? type,
  VoidCallback? suffixpressed,
})

   => TextFormField(
     controller: controller,
       obscureText: isPassword,
      keyboardType: type,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: label,
          prefixIcon: Icon(
            prefix,
          ),
          suffixIcon: suffix != null ?
          IconButton(
              onPressed: suffixpressed,
              icon:Icon(suffix) )
              : Icon(
              suffix
          )
      ),
       validator: function
   );