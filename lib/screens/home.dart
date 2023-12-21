// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/playscreen.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TicTacToe'),

      ),
      body: Center(
        child: TextButton(
          onPressed: (){},
          child: IconButton(
            iconSize: 200,
            icon: Image.asset('assets/start.png'),
            // alignment: Alignment.center,
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder:(context)=> const PlayScreen()));
            },
          ),

        ),
      ),

    );
  }
}
