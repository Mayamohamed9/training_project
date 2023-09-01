
import 'package:flutter/material.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function ?onSubmit,
  Function ?onChange,
  Function ?onTap,
  bool isPassword = false,
  required Function validate,
  required String label,
   required IconData prefix,
    Color? prefixColor=Colors.brown,
  IconData ?suffix,
  Function ?suffixPressed,
  bool isClickable = true,

}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: (s) {
        onSubmit!(s);
      },
      onChanged: (s) {
        onChange!(s);
      },
      onTap: () {
        onTap!();
      },
      validator: (s) {
        validate!(s);
      },
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
          color: prefixColor,
        ),
        suffixIcon: suffix != null
            ? IconButton(
          onPressed: () {
            suffixPressed!();
          },
          icon: Icon(
            suffix,
            color:Colors.brown,
          ),
        )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
          width: 2,
          color: Colors.brown
      ),
    ) ,
      ),
    );