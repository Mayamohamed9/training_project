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
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
               color: const Color(0xffc2baae),
                //color: const Color(0xffD3D3D3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "images/mghmada.png",
                    height: 200,
                  ),
                ],

              ),


            ),


             SizedBox(height: 60),
            //Name
            Container(
              width:double.infinity,
              height: 60,
              decoration: BoxDecoration(

                color: const Color(0xffD3D3D3),

                borderRadius: BorderRadius.circular(20),
              ),

             child:const Row(

               children: [
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

            ),
          const SizedBox(height: 20),
            //EMAIL
            Container(
              width:double.infinity,
              height: 60,
              decoration: BoxDecoration(

                color: const Color(0xffD3D3D3),
                borderRadius: BorderRadius.circular(20),
              ),

              child:const Row(

                children: [
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

            ),
            const SizedBox(height: 20),
            //PHONE
            Container(
              width:double.infinity,
              height: 60,
              decoration: BoxDecoration(

                color: const Color(0xffD3D3D3),
                borderRadius: BorderRadius.circular(20),
              ),

              child:const Row(

                children: [
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

            ),
            const SizedBox(height: 20),
            //AGE
            Container(
              width:double.infinity,
              height: 60,
              decoration: BoxDecoration(

                color: const Color(0xffD3D3D3),
                borderRadius: BorderRadius.circular(20),
              ),

              child:const Row(

                children: [
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

            ),
            const SizedBox(height: 20),
            //HEIGHT
            Container(
              width:double.infinity,
              height: 60,
              decoration: BoxDecoration(

                color: const Color(0xffD3D3D3),
                borderRadius: BorderRadius.circular(20),
              ),

              child:const Row(

                children: [
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

            ),

            //cubit.isLoading?
           /* const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ) :
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      cubit.cairo.name,

                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
            ),*/

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
