import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/cubit/appCubit.dart';
import '../shared/cubit/appStates.dart';

class profileScreen extends StatelessWidget {
  const profileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AppCubit(),
    child:BlocConsumer<AppCubit,AppStates>(
    listener: (context,state){},
    builder: (context,state){
    AppCubit cubit = AppCubit.get(context);
      return Scaffold(
       // backgroundColor: const Color(0xffc2baae),
        backgroundColor: Colors.white,

        body:Column(

          children: [
            //dabdob


              cubit.isLoading?
              CircularProgressIndicator(
                color: Colors.brown,
              ) :
              Container(
                width:double.infinity,
                height: 300,
                color:CupertinoColors.activeBlue,
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                         'images/logindeba-removebg-preview (1).png',
                      width: 100,
                    ),
                  ),
                  Text(
                    cubit.cairo.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    cubit.cairo.temp.ceil().toString()+" C",

                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),

                ],
            ),
              ),
              SizedBox(
              height: 30,
            ),
              Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                color: Color(0xffD3D3D3),
                //color: const Color(0xffD3D3D3),
                borderRadius: BorderRadius.circular(20),
              ),
               child:SingleChildScrollView(
                 scrollDirection: Axis.horizontal,
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(

                      children: [
                       Container(
                            width:50,
                            height: 50,

                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),

                            child: Icon(Icons.person)
                        ),
                        SizedBox(width:15),
                        Text('Name :',
                          style: TextStyle(
                            color: const Color(0xff7c5022),
                            fontSize: 30,
                          ),),
                        SizedBox(width:15),
                        Text('Hagar',
                          style: TextStyle(
                            color: const Color(0xff7c5022),
                            fontSize: 30,
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: 20),
                    Row(

                      children: [
                        Container(
                            width:50,
                            height: 50,

                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),

                            child: Icon(Icons.email)
                        ),
                        SizedBox(width:15),

                           Text('Email :',
                            style: TextStyle(
                              color: const Color(0xff7c5022),
                              fontSize: 30,
                            ),),

                        SizedBox(width:15),
                        Text('hagarwaleed@gmail.com',
                          style: TextStyle(
                            color: const Color(0xff7c5022),
                            fontSize: 25,
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: 20),
                    Row(

                      children: [
                        Container(
                            width:50,
                            height: 50,

                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),

                            child: Icon(Icons.phone)
                        ),
                        SizedBox(width:15),
                        Text('Phone :',
                          style: TextStyle(
                            color: const Color(0xff7c5022),
                            fontSize: 30,
                          ),),
                        SizedBox(width:15),
                        Text('01111650006',
                          style: TextStyle(
                            color: const Color(0xff7c5022),
                            fontSize: 30,
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: 20),
                    Row(

                      children: [
                        Container(
                            width:50,
                            height: 50,

                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),

                            child: Icon(Icons.calendar_month)
                        ),
                        SizedBox(width:15),
                        Text('Age :',
                          style: TextStyle(
                            color: const Color(0xff7c5022),
                            fontSize: 30,
                          ),),
                        SizedBox(width:15),
                        Text('20',
                          style: TextStyle(
                            color: const Color(0xff7c5022),
                            fontSize: 30,
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: 20),
                    Row(

                      children: [
                        Container(
                            width:50,
                            height: 50,

                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),

                            child: Icon(Icons.height)
                        ),
                        SizedBox(width:15),
                        Text('Hieght :',
                          style: TextStyle(
                            color: const Color(0xff7c5022),
                            fontSize: 30,
                          ),),
                        SizedBox(width:15),
                        Text('175',
                          style: TextStyle(
                            color: const Color(0xff7c5022),
                            fontSize: 30,
                          ),
                        ),
                        Text('cm',
                          style: TextStyle(
                            color: const Color(0xff7c5022),
                            fontSize: 20,
                          ),
                        ),

                      ],
                    ),

                  ],
              ),
               ),

            ),







          ],


        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          child: const Icon(
            Icons.refresh,
            color: Colors.indigo,
          ),
          onPressed: () {
            cubit.getWeather();
          },
        ),
      );
    },

    ),


    );
  }
}
