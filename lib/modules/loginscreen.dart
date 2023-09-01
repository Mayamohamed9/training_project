import 'package:flutter/material.dart';

class loginScreen extends StatelessWidget {
 var emailcontrol = TextEditingController();
 var passcontrol = TextEditingController();

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
                TextFormField(


              controller: emailcontrol,
              keyboardType: TextInputType.emailAddress,
              onFieldSubmitted: (String value){
                print(value);
              },
              onChanged: (String value){
                print(value);
              },
              validator: (String? value){
                if(value != null){
                  if(value.isEmpty){
                    return 'Email address can not be empty';
                  }
                }
                return null;
              },
              decoration: InputDecoration(

                labelText: 'Email Address',

                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.brown,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                      width: 2,
                      color: Colors.brown
                  ),
                ) ,
              ),
            ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: passcontrol,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,

                  onFieldSubmitted: (String? value){
                    print(value);
                  },
                  onChanged: (String? value){
                    print(value);
                  },
                  validator: (String? value){
                    if(value != null) {
                      if (value.isEmpty) {
                        return 'Password can not be empty';
                      }
                    }
                    return null;
                  },

                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.brown,
                    ),
                    suffixIcon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.brown,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          width: 2,
                          color: Colors.brown
                      ),
                    ) ,

                  ),


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
      ),
    );
  }
}
