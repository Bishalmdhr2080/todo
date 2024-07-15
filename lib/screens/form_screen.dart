import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {
   FormScreen({super.key, required this.addToList,});
  final Function addToList;
 
  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    GlobalKey<FormState> formkey = GlobalKey<FormState>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Form Screen'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text('Title'),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Title can't be empty";
                    }
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.zero)),
                      hintText: "Your Title"),
                  controller: titleController,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('Description'),
                TextFormField(
                  validator: (value) {
                    
                    if (value!.isEmpty) {
                      return "Description can't be empty";
                    }
                  },
                  maxLines: 3,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.zero)),
                      hintText: "Your Description"),
                  controller: descriptionController,
                ),
                const SizedBox(
                  height: 20,
                ),
                OutlinedButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      addToList(titleController.text,descriptionController.text);
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Sucessfully Added"),
                        ),
                      );
                    }
                    else
                    {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Error"),
                      ),
                    );
                    }
                  },
                  child: const Text("Submit"),
                )
              ],
            ),
          ),
        ));
  }
}
