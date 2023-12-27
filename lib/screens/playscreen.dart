import 'package:flutter/material.dart';
import 'package:tic_tac_toe/models/grid_model.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({Key? key}) : super(key: key);

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  List<List<Box>> matrix = List.generate(
      3, (i) => List<Box>.generate(3, (j) => Box(ind: i * 3 + j, value: 0)));
  // nt flag = 0;
  int flag = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Take turns to put X & O'),
      ),
      body: Center(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: 9,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            // int flag = 0;
            int row = index ~/ 3;
            int column = index % 3;
            Box box = matrix[row][column];
            return GestureDetector(
              onTap: () {
                if (box.value == 0 && flag == 0) {
                  setState(() {
                    box.value = 1; // 1 means a cross
                    flag = 1;
                  });
                } else if (box.value == 0 && flag == 1) {
                  setState(() {
                    box.value = 2; // 2 means a circle
                    flag = 0;
                  });
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: Center(
                  child: Text(
                    box.value == 1 ? "X" : (box.value == 2 ? "O" : ''),
                    style: const TextStyle(fontSize: 24.0),

                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}