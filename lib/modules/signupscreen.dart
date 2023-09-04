import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:training_project/modules/loginscreen.dart';
import 'package:training_project/modules/resetpasswordscreen.dart';
import 'package:training_project/shared/cubit/appCubit.dart';
import 'package:training_project/shared/cubit/appStates.dart';

import '../shared/components/components/defaultbutton.dart';
import '../shared/components/components/defaulttextfield.dart';

class signupScreen extends StatelessWidget {
  var name = TextEditingController();
  var emailcont = TextEditingController();
  static var passcont = TextEditingController();
  var confirmPasscont = TextEditingController();
  var phonecont = TextEditingController();
  var dateofbirthcontroller = TextEditingController();
  var heightcont = TextEditingController();
late DateTime bod;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child:BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state){
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Form(
                key: formKey,
                child: Center(
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
                                cubit.ispasswordd? 'images/mghmada.png':'images/doba-removebg-preview.png'
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          defaultFormField(
                              cubit: cubit,
                              formKey: formKey,
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

                              label: 'Name',
                              prefix: Icons.person,
                              suffixPressed: (){}
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          defaultFormField(
                            cubit: cubit,
                              formKey: formKey,
                              controller: emailcont,
                              type: TextInputType.emailAddress,
                              onSubmit: (String value){
                                print(value);
                              },
                              onChange: (String value){
                                print(value);
                                cubit.emailvalid(emailcont.text);
                              },
                              onTap: () {

                              } ,
                              validateemail: true,
                              emailenteredprv: cubit.emailenteredprv,
                              // validate: (String? value){
                              //   if(value != null){
                              //     if(value.isEmpty){
                              //       return 'Email Address can not be empty';
                              //     }
                              //   }
                              //   return null;
                              // },
                              label: 'Email Address',
                              prefix: Icons.email,
                              suffixPressed: (){}
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          defaultFormField(
                            cubit: cubit,
                              indentical:cubit.confirmpass,
                              formKey: formKey,
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
                              // validate: (String? value){
                              //   if(value != null){
                              //     if(value.isEmpty){
                              //       return 'Phone can not be empty';
                              //     }
                              //   }
                              //   return null;
                              // },
                              label: 'Phone Number',
                              prefix: Icons.phone,
                              suffixPressed: (){}
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          defaultFormField(
                              formKey: formKey,
                              cubit:cubit,
                              indentical:cubit.confirmpass,
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
                                  bod=value;
                                });
                              } ,
                              // validate: (String? value){
                              //   if(value != null){
                              //     if(value.isEmpty){
                              //       return 'Age can not be empty';
                              //     }
                              //   }
                              //   return null;
                              // },
                              label: 'Date Of Birth',
                              prefix: Icons.calendar_month,
                              suffixPressed: (){}
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          defaultFormField(
                              formKey: formKey,
                              cubit: cubit,
                              controller: heightcont,
                              type: TextInputType.number,
                              onSubmit: (String value){
                                print(value);
                              },
                              onChange: (String value){

                                cubit.validateconfirmpass(passcont.text, confirmPasscont.text);
                                print(value);
                              },
                              onTap: () {

                              } ,
                              // validate: (String? value){
                              //   if(value != null){
                              //     if(value.isEmpty){
                              //       return 'Height can not be empty';
                              //     }
                              //   }
                              //   return null;
                              // },
                              label: 'Height',
                              prefix: Icons.height,
                              suffixPressed: (){}
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          defaultFormField(
                              formKey: formKey,
                              cubit: cubit,
                              controller:passcont,
                              confirmpass:true,
                              type: TextInputType.visiblePassword,
                              isPassword: cubit.ispasswordd,
                              indentical: cubit.confirmpass,
                              onSubmit: (String? value){
                                print(value);
                              },
                              onChange: (String? value){
                                cubit.validateconfirmpass(passcont.text, confirmPasscont.text);
                                print(value);
                              },
                              onTap: () {

                              } ,
                              label: 'Password',
                              prefix: Icons.lock,
                              suffix: cubit.ispasswordd ? Icons.visibility_off :Icons.visibility,
                              suffixPressed: (){
                               cubit.changeSignPasswordd(cubit.ispasswordd);
                              }),
                          SizedBox(
                            height: 15,
                          ),
                          defaultFormField(
                              cubit:cubit,
                              formKey: formKey,
                              controller: confirmPasscont,
                              type: TextInputType.visiblePassword,
                              isPassword:  cubit.isConfirmedpassword,
                              indentical: cubit.confirmpass,
                              confirmpass:true,
                              onSubmit: (String? value){
                                print(value);
                              },
                              onChange: (String? value){
                                print(value);
                              },
                              onTap: () {

                              } ,
                              // validate: (String? value){
                              //   if(value != null) {
                              //     if (value.isEmpty) {
                              //       return 'Confirmed Password can not be empty';
                              //     }
                              //   }
                              //   return null;
                              // },
                              label: 'Confirm Password',
                              prefix: Icons.lock,
                              suffix: cubit.isConfirmedpassword ? Icons.visibility_off :Icons.visibility,
                              suffixPressed: (){
                                cubit.changeConfirmPassword(cubit.isConfirmedpassword);
                              }),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: double.infinity,
                            height: 55,

                            child: Center(
                                child: defaultButton(
                                    function: (){
                                      cubit.validateconfirmpass(passcont.text, confirmPasscont.text);
                                      cubit.emailvalid(emailcont.text);
                                      if(formKey.currentState!.validate()){
                                    cubit.inserttoDB(name: name.text, email: emailcont.text, phone: phonecont.text, password: passcont.text, age: cubit.age(DateTime.now(), bod), height: int.parse(heightcont.text));
                                    }},
                                    text: 'Sign Up',
                                    radius: 20,
                                    background: Colors.brown
                                )
                            ),


                          ),

                          TextButton(onPressed: (){
                            Navigator.push(context,  MaterialPageRoute(builder: (context)=> loginScreen()));
                          },
                              child: Text("already have an account ?",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,decoration: TextDecoration.underline),))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

          );
        },

      ),


    );
  }
}
