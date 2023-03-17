import 'package:bloc_flutter/blocs/internet_bloc.dart';
import 'package:bloc_flutter/blocs/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({Key? key}) : super(key: key);

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter_Bloc'),
      ),
      body: SafeArea(
        child: Center(
            child:BlocConsumer<InternetBloc,InternetState>(
              listener: (context,state){
                if(state  is InternetGainedState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:Text("Connected"),
                        backgroundColor:Colors.blueAccent,
                      ),
                  );
                }else if(state  is InternetLostState){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content:Text("Connected"),
                      backgroundColor:Colors.redAccent,
                    ),
                  );
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content:Text("Connected"),
                      backgroundColor:Colors.greenAccent,
                    ),
                  );
                }
              },
              builder: (context,state){
              if(state  is InternetGainedState){
                return Text('Connected');
              }else if(state  is InternetLostState){
                return Text('Not Connected');
              }else{
                return Text('Loading...');
              }
            },

            ),
        ),
      ),
    );
  }
}


//BlocBuilder<InternetBloc,InternetState>(
//               builder: (context,state){
//                 if(state  is InternetGainedState){
//                   return Text('Connected');
//                 }else if(state  is InternetLostState){
//                   return Text('Not Connected');
//                 }else{
//                   return Text('Loading...');
//                 }
//               },
//             ),