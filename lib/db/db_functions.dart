import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/note.dart';

ValueNotifier<List<Note>> noteListNotifier = ValueNotifier([]);

late Database _db;

Future<void> initializeDb() async {
  _db = await openDatabase(
    join(await getDatabasesPath(), 'note.db'),
    version: 1,
    onCreate: (Database db, int version) async {
      await db.execute(
        'CREATE TABLE note (id INTEGER PRIMARY KEY, title TEXT, description TEXT)',
      );
    },
  );
  getAllNotes();
}

Future<void> addNote(Note note) async {
  await _db.insert('note', note.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  getAllNotes();
}

Future<void> getAllNotes() async {
  final List<Map<String, dynamic>> maps = await _db.query('note');
  noteListNotifier.value = List.generate(maps.length, (i) {
    return Note.fromMap(maps[i]);
  });
  noteListNotifier.notifyListeners();
}

Future<void> deleteNote(int id) async {
  await _db.delete('note', where: 'id = ?', whereArgs: [id]);
  getAllNotes();
}

Future<void> updateNote(Note note) async {
  await _db.update(
    'note',
    note.toMap(),
    where: 'id = ?',
    whereArgs: [note.id],
  );
  getAllNotes();
}
