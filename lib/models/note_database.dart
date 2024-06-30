import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:noteapp/models/note.dart';
import 'package:path_provider/path_provider.dart';

class NoteDatabase extends ChangeNotifier {
  static late Isar isar;

  static Future<void> initailize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([NoteSchema], directory: dir.path);
  }

  // current list
  List<Note> currentNote = [];

  // create
  Future<void> createNote(String noteText) async {
    final newNote = Note()..text = noteText;
    await isar.writeTxn(() => isar.notes.put(newNote));
    await fetchNote();
  }

// read Data

  Future<void> fetchNote() async {
    List<Note> fetchNotes = await isar.notes.where().findAll();
    currentNote.clear();
    currentNote.addAll(fetchNotes);
    notifyListeners();
  }

  // update

  // ignore: non_constant_identifier_names
  Future<void> UpdataNote(int id, String newtext) async {
    final existingNote = await isar.notes.get(id);
    if (existingNote != null) {
      existingNote.text = newtext;
    await  isar.writeTxn(() => isar.notes.put(existingNote));
      await fetchNote();
    }
  }

  // delete
  Future<void> deleteNote(int id) async {
    await isar.writeTxn(() => isar.notes.delete(id));
    await fetchNote();
  }
}
