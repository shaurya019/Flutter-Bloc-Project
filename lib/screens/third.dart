import 'package:bloc_flutter/cubits/first_cubits.dart';
import 'package:bloc_flutter/cubits/third_cubits.dart';
import 'package:bloc_flutter/screens/first.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/third_cubits.dart';

class Third_screen extends StatefulWidget {
  const Third_screen({Key? key}) : super(key: key);

  @override
  State<Third_screen> createState() => _Third_screenState();
}

class _Third_screenState extends State<Third_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        centerTitle: true,
        title: Text("Third Screen"),
        // actions: [
        //   IconButton(
        //     onPressed: (){
        //       Navigator.push(context,
        //           MaterialPageRoute(
        //               builder: (context) => BlocProvider(
        //                 create: (context) => FirstCubit(),
        //                 child: First_screen(),
        //               )
        //           ));
        //     },
        //     icon: Icon(Icons.arrow_forward),
        //   ),
        // ],
      ),
      body: SafeArea(
        child: Center(
          child: BlocBuilder<ThirdCubit,int>(
            builder: (context,state){
              return Text(state.toString(),style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold
              ),);
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<ThirdCubit>(context).increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}