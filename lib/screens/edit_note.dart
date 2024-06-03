import 'package:flutter/material.dart';
import '../db/db_functions.dart';
import '../models/note.dart';

class EditNote extends StatelessWidget {
  final Note note;
  final TextEditingController _titleController;
  final TextEditingController _descriptionController;

  EditNote({
    Key? key,
    required this.note,
  })  : _titleController = TextEditingController(text: note.title),
        _descriptionController = TextEditingController(text: note.description),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Note')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final title = _titleController.text;
                final description = _descriptionController.text;
                if (title.isNotEmpty && description.isNotEmpty) {
                  await updateNote(Note(
                    id: note.id,
                    title: title,
                    description: description,
                  ));
                  Navigator.pop(context);
                }
              },
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}
