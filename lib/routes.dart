import 'package:bloc_flutter/cubits/first_cubits.dart';
import 'package:bloc_flutter/screens/first.dart';
import 'package:bloc_flutter/screens/second.dart';
import 'package:bloc_flutter/screens/third.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits/second_cubits.dart';
import 'cubits/third_cubits.dart';

class Routes {

  static Route? onGenerateRoute(RouteSettings settings){
    switch(settings.name) {

      case "/first" : return MaterialPageRoute(
          builder: (context) => BlocProvider(
              create:(context) => FirstCubit(),
          child: First_screen(),
          )
      );

      case "/second" :
        Map<String,dynamic> arguments = settings.arguments as Map<String,dynamic>;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create:(context) => SecondCubit(),
            child: Second_screen(title: arguments["title"],),
          )
      );


      case "/third" :
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create:(context) => ThirdCubit(),
            child: Third_screen(),
          )
      );

      default : return null;
    }
  }
}