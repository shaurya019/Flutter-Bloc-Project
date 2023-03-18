import 'package:bloc_flutter/cubits/first_cubits.dart';
import 'package:bloc_flutter/cubits/second_cubits.dart';
import 'package:bloc_flutter/screens/second.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class First_screen extends StatefulWidget {

  const First_screen({Key? key}) : super(key: key);

  @override
  State<First_screen> createState() => _First_screenState();
}

class _First_screenState extends State<First_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        centerTitle: true,
        title: Text("First Screen"),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.pushNamed(context, "/second",
                    arguments: {
                  "title" : "Screen - 2"
                    });
                // Navigator.push(context,
                //     MaterialPageRoute(
                //         builder: (context) => BlocProvider(
                //             create: (context) => SecondCubit(),
                //           child: Second_screen(),
                //         )
                //     ));
              },
              icon: Icon(Icons.arrow_forward),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: BlocBuilder<FirstCubit,int>(
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
          BlocProvider.of<FirstCubit>(context).increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}