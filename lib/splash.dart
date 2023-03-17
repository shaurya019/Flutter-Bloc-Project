import 'package:bloc_flutter/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/validation/signin_bloc.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Sign IN"),
    ),
    body:Center(
       child: ElevatedButton(
         onPressed: () {
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => BlocProvider(
                  create: (context) => SignIn_bloc(),
                child: Validation_screen(),
              )

          ));
         },
         child: Padding(
    padding: EdgeInsets.all(10.0),
    child: Text('Welcome to My Email',
      style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
         ),
    )
    ),

    );
  }
}
