import 'package:training_project/modules/signupscreen.dart';

import 'package:flutter/material.dart';

import '../../cubit/appCubit.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  required Function onSubmit,
  required Function onChange,
  required Function onTap,
  bool isPassword = false,
  bool confirmpass = false,
  // required Function validate,
  required String label,
  required IconData prefix,
  Color? prefixColor=Colors.brown,
  IconData ?suffix,
  required Function suffixPressed,
  bool isClickable = true,
   required GlobalKey formKey ,

}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: (s) {
        onSubmit(s);
      },
      onChanged: (s) {
        onChange(s);
      },
      onTap: () {
        onTap();
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'required';
        }
       /* if(confirmpass){
          if(value != passcont.text){
            print('Passwords don\'t match ' );

          }
        }*/
        return null;
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
            suffixPressed();
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