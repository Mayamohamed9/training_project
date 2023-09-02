import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../shared/components/components/defaultbutton.dart';
import '../shared/components/components/defaulttextfield.dart';

class signupScreen extends StatelessWidget {
  var name = TextEditingController();
  var emailcont = TextEditingController();
  var passcont = TextEditingController();
  var confirmPasscont = TextEditingController();
  var phonecont = TextEditingController();
  var dateofbirthcontroller = TextEditingController();
  var heightcont = TextEditingController();

  bool ispassword = true;
  bool isConfirmedpassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Sign Up',
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
                    controller: name,
                    type: TextInputType.text,
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
                          return 'Name can not be empty';
                        }
                      }
                      return null;
                    },
                    label: 'Name',
                    prefix: Icons.person,
                    suffixPressed: (){}
                ),
                SizedBox(
                  height: 15,
                ),
                defaultFormField(
                    controller: emailcont,
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
                          return 'Email Address can not be empty';
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
                    controller: phonecont,
                    type: TextInputType.phone,
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
                          return 'Phone can not be empty';
                        }
                      }
                      return null;
                    },
                    label: 'Phone Number',
                    prefix: Icons.phone,
                    suffixPressed: (){}
                ),
                SizedBox(
                  height: 15,
                ),
                defaultFormField(
                    controller: dateofbirthcontroller,
                    type: TextInputType.datetime,
                    onSubmit: (String value){
                      print(value);
                    },
                    onChange: (String value){
                      print(value);
                    },
                    onTap: () {
                     showDatePicker(context: context,
                         initialDate: DateTime.parse("1850-01-01"),
                         firstDate: DateTime.parse("1850-01-01"),
                         lastDate: DateTime.now(),).then((value) {
                       dateofbirthcontroller.text=DateFormat.yMMMd().format(value!);
                     });
                    } ,
                    validate: (String? value){
                      if(value != null){
                        if(value.isEmpty){
                          return 'Age can not be empty';
                        }
                      }
                      return null;
                    },
                    label: 'Date Of Birth',
                    prefix: Icons.calendar_month,
                    suffixPressed: (){}
                ),
                SizedBox(
                  height: 15,
                ),
                defaultFormField(
                    controller: heightcont,
                    type: TextInputType.number,
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
                          return 'Height can not be empty';
                        }
                      }
                      return null;
                    },
                    label: 'Height',
                    prefix: Icons.height,
                    suffixPressed: (){}
                ),
                SizedBox(
                  height: 15,
                ),
                defaultFormField(
                    controller: passcont,
                    type: TextInputType.visiblePassword,
                    isPassword: ispassword,
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
                      ispassword=!ispassword;
                    }),
                SizedBox(
                  height: 15,
                ),
                defaultFormField(
                    controller: confirmPasscont,
                    type: TextInputType.visiblePassword,
                    isPassword: ispassword,
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
                      isConfirmedpassword=!isConfirmedpassword;
                    }),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 55,

                  child: Center(
                      child: defaultButton(
                          function: (){},
                          text: 'Sign Up',
                          radius: 20,
                          background: Colors.brown)
                  ),


                ),
                TextButton(onPressed: (){}, child: Text("reset password",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,decoration: TextDecoration.underline),))
              ],
            ),
          ),
        ),
      ),

    );
  }
}
