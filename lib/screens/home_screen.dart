import 'dart:math';

import 'package:codeitpractise/screens/form_screen.dart';
import 'package:codeitpractise/widgets/task_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var dataList = [
    {"id": "1", "title": "title1"},
    {'id': "2", "title": "title2"}
  ];
  void addToDataList(String data) {
    setState(
      () {
        dataList.add(
          {"id": DateTime.now().toString(), 
          "title": data},
        );
      },
    );
  }

  void deletToDataList(String id) {
    setState(() {
     dataList.removeWhere((e) {
      return e["id"]==id;
     },);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) {
                    return FormScreen(
                      addToList: addToDataList,
                    );
                  },
                ),
              );
              // addToDataList();
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          ...dataList.map(
            (e) {
              return TaskCard(
                title:e["title"] ?? "no",
                deletToDataList: (){
                  deletToDataList(e["id"]??"");
                },
              );
            },
          ),
        ],
      )
          // children: [
          //
          // ],
          ),
    );
  }
}
