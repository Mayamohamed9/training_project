import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_project/modules/profilescreen.dart';
import 'package:training_project/modules/resetpasswordscreen.dart';
import 'package:training_project/modules/signupscreen.dart';
import 'package:training_project/shared/components/components/defaultbutton.dart';
import 'package:training_project/shared/components/components/defaulttextfield.dart';
import 'package:training_project/shared/cubit/appCubit.dart';
import 'package:training_project/shared/cubit/appStates.dart';
 class loginScreen extends StatefulWidget {
   const loginScreen({super.key});

   @override
   State<loginScreen> createState() => _loginScreenState();
 }

 class _loginScreenState extends State<loginScreen> {
   var emailcontrol = TextEditingController();
   var passcontrol = TextEditingController();
   var formKey = GlobalKey<FormState>();

   @override
   Widget build(BuildContext context) {
     return BlocProvider(
         create: (BuildContext context) => AppCubit()..createDatabase()..getWeather(),
         child:BlocConsumer<AppCubit,AppStates>(
         listener: (context,state){},
         builder: (context,state){
             AppCubit cubit = AppCubit.get(context);
             return Scaffold(
               body: SafeArea(
                 child: Center(
     child: Padding(
     padding: const EdgeInsets.all(25.0),
     child: SingleChildScrollView(
     child: Form(
       key: formKey,
       child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       mainAxisAlignment: MainAxisAlignment.center,
       mainAxisSize: MainAxisSize.max,
       children: [
       Center(
         child: Text('Login',
         style: TextStyle(
         fontSize: 45,
         color: Colors.brown[300],
         fontWeight:FontWeight.bold
         ),
         ),
       ),
       SizedBox(
       height: 20,
       ),
       CircleAvatar(
         radius: 30,
         backgroundColor: Colors.brown[100],
         child: Center(
           child: Text('Hi',
           style: TextStyle(
             fontSize:30,
             fontWeight: FontWeight.bold,
             color: Colors.brown,

           ),
             ),
           ),
       ),
       Center(
       child: Image.asset(
           cubit.ispass? 'images/mghmada.png':'images/doba-removebg-preview.png'
       ),
       ),
       SizedBox(
       height: 15,
       ),
       defaultFormField(
         formKey: formKey,
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
       // validate: (value) {
       //   if (value!.isEmpty) {
       //     return 'Email address cannot be empty';
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

           formKey: formKey,
       controller: passcontrol,
       type: TextInputType.visiblePassword,
       isPassword: cubit.ispass,
       onSubmit: (String? value){
       print(value);
       },
       onChange: (String? value){
       print(value);
       },
       onTap: () {

       } ,
       // validate: (value) {
       //   if (value!.isEmpty) {
       //     return 'Password cannot be empty';
       //   }
       //
       //   return null;
       // },
       label: 'Password',
       prefix: Icons.lock,
       suffix: cubit.ispass ? Icons.visibility_off :Icons.visibility ,
       suffixPressed: (){
         cubit.changePassword(cubit.ispass);

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
             if(formKey.currentState!.validate()){
               print(emailcontrol.text);
               print(passcontrol.text);
               /*Navigator.push(context, MaterialPageRoute(builder: (context)=> profileScreen()));*/
             }
           },
           text: 'LOGIN WITH EMAIL',
           radius: 20,
           background: Colors.brown,
       )
       ),


       ),

       Column(
       children: [
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
       TextButton(onPressed: (){
       Navigator.push(
       context,
       MaterialPageRoute(builder: (context)=> signupScreen()));
       },
       child: Text(
       'Register Now',
       style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,decoration: TextDecoration.underline)

       ),),
       ],
       ),
       TextButton(onPressed: (){
       Navigator.push(context, MaterialPageRoute(builder: (context)=> ResetPassword()));
       },
       child: Text("Reset Password",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,decoration: TextDecoration.underline),)),
       ],
       ),
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

