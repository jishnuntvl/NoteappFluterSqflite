import 'package:flutter/material.dart';
import 'package:notebook/db/db_functions.dart';
import 'package:notebook/models/note.dart';



class AddNote extends StatelessWidget {
  AddNote({super.key});
  final _titleontroller=TextEditingController();
  final _descriptionController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(backgroundColor: Colors.blue,title: Text("Add Notes"),),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          TextFormField(
            controller: _titleontroller,
            decoration: InputDecoration(border: OutlineInputBorder(),hintText: "Title"),
          ),
          SizedBox(height: 10,),
          TextFormField(
            controller: _descriptionController,
            maxLines: 5, 
            decoration: InputDecoration(border: OutlineInputBorder(),hintText: "Content"),
          ),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: () async {
                final title = _titleontroller.text;
                final description = _descriptionController.text;
                if (title.isNotEmpty && description.isNotEmpty) {
                  await addNote(Note(
                    title: title,
                    description: description,
                  ));
                  Navigator.pop(context);
                }
              }, child: Text("Save"))
        ],),
      )),
    );
  }
}
