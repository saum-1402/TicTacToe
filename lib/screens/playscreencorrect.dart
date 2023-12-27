import 'package:flutter/material.dart';
import 'package:tic_tac_toe/models/grid_model.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({Key? key}) : super(key: key);

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  List<List<Box>> matrix =
  List.generate(3, (i) => List<Box>.generate(3, (j) => Box(index: i * 3 + j, value: 0)));

  int flag = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Take turns to put X & O'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the Tic-Tac-Toe grid
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: 9,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                int rowIndex = index ~/ 3;
                int colIndex = index % 3;
                Box box = matrix[rowIndex][colIndex];
                return GestureDetector(
                  onTap: () {
                    // Handle box tap
                    if (box.value == 0) {
                      // Box is empty, update its value based on the player turn
                      setState(() {
                        box.value = flag % 2 == 0 ? 1 : 2;
                        flag++;
                      });
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: Center(
                      child: Text(
                        box.value == 1 ? 'X' : (box.value == 2 ? 'O' : ''),
                        style: const TextStyle(fontSize: 24.0),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
