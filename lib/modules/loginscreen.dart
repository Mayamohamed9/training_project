import 'package:flutter/material.dart';
import 'package:training_project/shared/components/components/defaultbutton.dart';
import 'package:training_project/shared/components/components/defaulttextfield.dart';

class loginScreen extends StatelessWidget {
 var emailcontrol = TextEditingController();
 var passcontrol = TextEditingController();
bool ispass=true;
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
      body: SingleChildScrollView(
        child: Padding(
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
                Center(
                  child: Image.asset(
                      'images/doba-removebg-preview.png'
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                defaultFormField(
                    controller: emailcontrol,
                    type: TextInputType.emailAddress,
                    onSubmit: (String value){
                  print(value);
                },
                    onChange: (String value){
                  print(value);
                },
                    onTap: () {

                    } ,
                    validate: (String? value){
                  if(value != null){
                    if(value.isEmpty){
                      return 'Email address can not be empty';
                    }
                  }
                  return null;
                },
                    label: 'Email Address',
                    prefix: Icons.email,
                    suffixPressed: (){}
                ),
                SizedBox(
                  height: 15,
                ),
                defaultFormField(
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
                      ispass=!ispass;
                    }),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 55,

                  child: Center(
                    child: defaultButton(function: (){}, text: 'LOGIN WITH EMAIL',radius: 20,background: Colors.brown)
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
      ),
    );
  }
}
