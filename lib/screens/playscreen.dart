import 'package:flutter/material.dart';
import 'package:tic_tac_toe/models/grid_model.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({Key? key}) : super(key: key);

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {

  List<List<Box>> matrix = List.generate(3, (i) => List<Box>.generate(3, (j) => Box(ind: i * 3 + j, value: 0)));
  int flag = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Take turns to put X & O'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (context,index){
          if(matrix[index][0].ind==0){
              
          }
        },

        ),
      );
  }
}
