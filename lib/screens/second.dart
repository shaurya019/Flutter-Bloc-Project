import 'package:bloc_flutter/cubits/second_cubits.dart';
import 'package:bloc_flutter/cubits/third_cubits.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_flutter/screens/third.dart';

class Second_screen extends StatefulWidget {
  final String title;
  const Second_screen({Key? key, required this.title}) : super(key: key);

  @override
  State<Second_screen> createState() => _Second_screenState();
}

class _Second_screenState extends State<Second_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        centerTitle: true,
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.pushNamed(context, "/third");
              // Navigator.push(context,
              //     MaterialPageRoute(
              //         builder: (context) => BlocProvider(
              //           create: (context) => ThirdCubit(),
              //           child: Third_screen(),
              //         )
              //     ));
            },
            icon: Icon(Icons.arrow_forward),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: BlocBuilder<SecondCubit,int>(
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
          BlocProvider.of<SecondCubit>(context).increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}