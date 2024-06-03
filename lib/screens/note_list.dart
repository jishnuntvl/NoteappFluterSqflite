import 'package:flutter/material.dart';
import '../db/db_functions.dart';
import '../models/note.dart';
import 'add_note.dart';
import 'edit_note.dart';

class NoteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notes'),backgroundColor: Colors.blue,),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: noteListNotifier,
          builder: (context, List<Note> notes, child) {
            return ListView.separated(
        itemBuilder: (ctx,index){
          final note = notes[index];
          return ListTile(
            title: Text(note.title),
            subtitle: Text(note.description),
            onTap: () 
            {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditNote(note: note),
                ),
              );
            },
            trailing:IconButton(onPressed: (){deleteNote(note.id!);}, 
            icon: Icon(Icons.delete,color: Colors.red,)),
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.green,
              child: Text(note.id.toString()),
            ),
          );
        }, 
        separatorBuilder: ((context, index) => Divider()), 
        itemCount: notes.length);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNote()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

