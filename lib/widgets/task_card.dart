import 'dart:math';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TaskCard extends StatefulWidget {
  TaskCard({super.key, required this.title, required this.deletToDataList,required this.description});
  String title;
  String description;
  final Function deletToDataList;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  late Color color;
  List<Color> colorList = [
    const Color.fromARGB(255, 3, 144, 214),
    Colors.lightBlue,
    Colors.lightBlueAccent,
  ];

  @override
  void initState() {
    color = colorList[Random().nextInt(colorList.length)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(2),
          color: color,
          height: 60,
          child: ListTile(
            title: Text(
              widget.title,
              
              style: const TextStyle(color: Colors.white),
            ),
            subtitle: Text(widget.description),
            trailing: IconButton(
              onPressed: () {
                widget.deletToDataList();
              },
              icon: const Icon(Icons.delete),
              color: Colors.white,
            ),
          ),
        ),
        
      ],
    );
  }
}
