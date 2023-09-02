import 'package:flutter/material.dart';
import 'package:training_project/shared/components/components/defaulttextfield.dart';

import '../shared/components/components/defaultbutton.dart';

class ResetPassword extends StatelessWidget {
   ResetPassword({super.key});


  var repaasscontrol = TextEditingController();
  var passcontrol = TextEditingController();
  bool ispass=true;
  bool ispass2=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text('reset your password',
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.brown[300],
                          fontWeight:FontWeight.bold
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),defaultFormField(
                        controller: passcontrol,
                        type: TextInputType.visiblePassword,
                        isPassword: ispass,
                        onSubmit: (String? value){
                          print(value);
                        },
                        onChange: (String? value){
                          print(value);
                        },
                        onTap: () {

                        } ,
                        validate: (String? value){
                          if(value != null) {
                            if (value.isEmpty) {
                              return 'Password can not be empty';
                            }
                          }
                          return null;
                        },
                        label: 'Password',
                        prefix: Icons.lock,
                        suffix: Icons.remove_red_eye,
                        suffixPressed: (){
                          ispass=!ispass;}),
                    SizedBox(
                      height: 20,
                    ),
                    defaultFormField(
                        controller: repaasscontrol,
                        type: TextInputType.visiblePassword,
                        isPassword: ispass2,
                        onSubmit: (String? value){
                          print(value);
                        },
                        onChange: (String? value){
                          print(value);
                        },
                        onTap: () {

                        } ,
                        validate: (String? value){
                          if(value != null) {
                            if (value.isEmpty) {
                              return 'Confirmed Password can not be empty';
                            }
                          }
                          return null;
                        },
                        label: 'Confirm Password',
                        prefix: Icons.lock,
                        suffix: Icons.remove_red_eye,
                        suffixPressed: (){
                          ispass2=!ispass2;
                        }),
                    SizedBox(
                      height: 20,
                    ),
                     Center(
                        child: defaultButton(function: (){}, text: 'change password',radius: 20,background: Colors.brown)
                    ),
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}
