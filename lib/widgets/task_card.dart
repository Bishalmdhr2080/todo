import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TaskCard extends StatelessWidget {
  TaskCard({super.key, required this.title, required this.deletToDataList});
  String title;
  final Function deletToDataList;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      height: 60,
      color: Colors.blue,
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        trailing: IconButton(
          onPressed: () {
         
            deletToDataList();
          },
          icon: Icon(Icons.delete),
          color: Colors.white,
        ),
      ),
    );
  }
}
