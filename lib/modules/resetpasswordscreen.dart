import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_project/shared/components/components/defaulttextfield.dart';

import '../shared/components/components/defaultbutton.dart';
import '../shared/cubit/appCubit.dart';
import '../shared/cubit/appStates.dart';

class ResetPassword extends StatelessWidget {
   ResetPassword({super.key});


   var formKey = GlobalKey<FormState>();
  var repaasscontrol = TextEditingController();
  var passcontrol = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AppCubit(),
        child:BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
    builder: (context,state){
    AppCubit cubit = AppCubit.get(context);
     return  Scaffold(
     body: SafeArea(
     child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Center(
    child: SingleChildScrollView(
    child: Form(
    key: formKey,
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
cubit: cubit,
    formKey: formKey,
    controller: passcontrol,
    type: TextInputType.visiblePassword,
    isPassword: cubit.ispass1,
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
    //       return 'Password can not be empty';
    //     }
    //   }
    //   return null;
    // },
    label: 'Password',
    prefix: Icons.lock,
    suffix: cubit.ispass1 ? Icons.visibility_off :Icons.visibility ,
    suffixPressed: (){
    cubit.changeResetPassword(cubit.ispass1);
    }),
    SizedBox(
    height: 20,
    ),
    defaultFormField(
      cubit: cubit,
    formKey: formKey,
    controller: repaasscontrol,
    type: TextInputType.visiblePassword,
    isPassword: cubit.ispass2,
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
    suffix: cubit.ispass2 ? Icons.visibility_off :Icons.visibility ,
    suffixPressed: (){
      cubit.changeResetConfirmPassword(cubit.ispass2);
    }),
    SizedBox(
    height: 20,
    ),
    Center(
    child: defaultButton(function: (){if(formKey.currentState!.validate()){

    }}, text: 'change password',radius: 20,background: Colors.brown)
    ),
    ],
    ),
    ),
    ),
    ),
    )
    ),
    );
    },
        ),
    );

  }
}