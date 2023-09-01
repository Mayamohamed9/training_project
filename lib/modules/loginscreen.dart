
import 'package:flutter/material.dart';

import '../shared/components/components/defaultbutton.dart';
import '../shared/components/components/defaulttextfield.dart';

class loginScreen extends StatelessWidget {
 var emailcontrol = TextEditingController();
 var passcontrol = TextEditingController();
Icon email=
  Icon(
    Icons.email,
    color: Colors.grey,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,

        title: Text(
          'Data me',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.brown
          ),
        ),

      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Login',
            style: TextStyle(
                fontSize: 40,
                color: Colors.brown[300],
                fontWeight:FontWeight.bold
            ),
            ),
              SizedBox(
            height: 20,
          ),
              defaultFormField(
                type: TextInputType.emailAddress,
                validate: (String? value){
                  if(value != null){
                    if(value.isEmpty){
                      return 'Email address can not be empty';
                    }
                  }
                  return null;
                },
                label:  'Email Address',
                prefix: Icons.email,
                controller: emailcontrol,
              ),
              SizedBox(
                height: 15,
              ),
              defaultFormField(
                type: TextInputType.visiblePassword,
                label:  'Password',
                controller: passcontrol,
                isPassword: true,
                prefix: Icons.lock,
                prefixColor:Colors.brown,
                  suffix:Icons.remove_red_eye,
                onSubmit: (String? value){
                print(value);
              },
                onChange: (String? value){
                  print(value);
                },
                validate: (String? value){
                  if(value != null) {
                    if (value.isEmpty) {
                      return 'Password can not be empty';
                    }
                  }
                  return null;
                },

              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 55,

                child: Center(
                  child: Text(
                    'LOGIN WITH EMAIL',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.brown
                ),

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account ?',
                    style: TextStyle(
                        color: Colors.brown,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  TextButton(onPressed: (){},
                    child: Text(
                      'Register Now'
                  ),)
                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}
