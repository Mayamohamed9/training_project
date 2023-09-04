import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/cubit/appCubit.dart';
import '../shared/cubit/appStates.dart';
import 'info class.dart';

class profileScreen extends StatelessWidget {
   profileScreen({super.key,required Info info });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AppCubit()..createDatabase(),
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
                /*color:Color(0xffc2baae),*/
                color:Colors.brown[300],
                child: Row(
                  children: [
                    Center(
                      child: Image.asset(
                        'images/logindeba-removebg-preview (1).png',
                        width: 130,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

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
                  ],
                ),

              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    //color: const Color(0xffD3D3D3),
                    borderRadius: BorderRadius.circular(5),
                  ),
                   child:SingleChildScrollView(
                     scrollDirection: Axis.horizontal,
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Your Data ',

                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Colors.red,
                          letterSpacing: 2,

                        ),
                        ),
                        SizedBox(height: 30,),
                        Row(
                          children: [
                           Container(
                                width:50,
                                height: 50,

                                decoration: BoxDecoration(
                                  color: Colors.brown[100],
                                  borderRadius: BorderRadius.circular(20),
                                ),

                                child: Icon(Icons.person,
                                color:Colors.brown ,
                                )
                            ),
                            SizedBox(width:15),
                            Text('Name :',
                              style: TextStyle(
                                color: const Color(0xff7c5022),
                                fontSize: 30,
                                fontWeight: FontWeight.bold
                              ),),
                            SizedBox(width:15),
                            Text('${cubit.info!.name}',
                              style: TextStyle(
                                color: const Color(0xff7c5022),
                                fontSize: 30,
                              ),
                            ),

                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(

                          children: [
                            Container(
                                width:50,
                                height: 50,

                                decoration: BoxDecoration(
                                  color: Colors.brown[100],
                                  borderRadius: BorderRadius.circular(20),
                                ),

                                child: Icon(Icons.email,
                                    color:Colors.brown
                                )
                            ),
                            SizedBox(width:15),

                               Text('Email :',
                                style: TextStyle(
                                  color: const Color(0xff7c5022),
                                  fontSize: 30,
                                    fontWeight: FontWeight.bold
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
                                  color: Colors.brown[100],
                                  borderRadius: BorderRadius.circular(20),
                                ),

                                child: Icon(Icons.phone,
                                    color:Colors.brown )
                            ),
                            SizedBox(width:15),
                            Text('Phone :',
                              style: TextStyle(
                                color: const Color(0xff7c5022),
                                fontSize: 30,
                                  fontWeight: FontWeight.bold
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
                                  color: Colors.brown[100],
                                  borderRadius: BorderRadius.circular(20),
                                ),

                                child: Icon(Icons.calendar_month,
                                    color:Colors.brown )
                            ),
                            SizedBox(width:15),
                            Text('Date of birth:',
                              style: TextStyle(
                                color: const Color(0xff7c5022),
                                fontSize: 30,
                                  fontWeight: FontWeight.bold
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
                                  color: Colors.brown[100],
                                  borderRadius: BorderRadius.circular(20),
                                ),

                                child: Icon(Icons.height,
                                    color:Colors.brown )
                            ),
                            SizedBox(width:15),
                            Text('Height :',
                              style: TextStyle(
                                color: const Color(0xff7c5022),
                                fontSize: 30,
                                  fontWeight: FontWeight.bold
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
