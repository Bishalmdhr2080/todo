import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key, required this.addToList});
  final Function addToList;
  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Form Screen'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.zero)),
                    hintText: "Your Title"),
                controller: titleController,
              ),
              OutlinedButton(
                onPressed: () {
                  addToList(titleController.text);
                  Navigator.of(context).pop();
                },
                child: const Text("Submit"),
              )
            ],
          ),
        ));
  }
}
