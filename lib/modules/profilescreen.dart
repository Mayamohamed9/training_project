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
        backgroundColor: Colors.indigo,
        body:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/mghmada.png",
              height: 200,
            ),

            cubit.isLoading?
            const Center(
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
