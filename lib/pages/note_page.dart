import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noteapp/component/my_drawer.dart';
import 'package:noteapp/component/note_tile.dart';
import 'package:noteapp/models/note.dart';
import 'package:noteapp/models/note_database.dart';
import 'package:provider/provider.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  TextEditingController textController = TextEditingController();
  createNote() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.background,
        content: TextField(
          controller: textController,
          decoration: InputDecoration(
            hintText: 'Add tasks',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.secondary)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.secondary)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.secondary)),
          ),
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              context.read<NoteDatabase>().createNote(textController.text);
              textController.clear();
              Navigator.pop(context);
            },
            child: const Text('Create'),
          )
        ],
      ),
    );
  }

  readNote() {
    context.read<NoteDatabase>().fetchNote();
  }

  @override
  void initState() {
    super.initState();
    readNote();
  }

  updateNote(Note note) {
    textController.text = note.text;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text('Update'),
        content: TextField(
          controller: textController,
          decoration: InputDecoration(
            hintText: 'Update tasks',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.secondary)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.secondary)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.secondary)),
          ),
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              context
                  .read<NoteDatabase>()
                  .UpdataNote(note.id, textController.text);
              textController.clear();
              Navigator.pop(context);
            },
            child: const Text('Update'),
          )
        ],
      ),
    );
  }

  deleteNote(int id) {
    context.read<NoteDatabase>().deleteNote(id);
  }

  @override
  Widget build(BuildContext context) {
    final fetchNote = context.watch<NoteDatabase>();
    List<Note> currentNote = fetchNote.currentNote;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        // title: const Text('Note app'),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      drawer: const MyDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              'Notes',
              style: GoogleFonts.dmSerifDisplay(
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: currentNote.length,
              itemBuilder: (BuildContext context, int index) {
                final note = currentNote[index];
                return NoteTile(
                  title: note.text,
                  onDeletePressed: () {
                    deleteNote(note.id);
                  },
                  onEditPressed: () {
                    updateNote(note);
                  },
                );
                // ListTile(
                //   title: Text(note.text),
                //   trailing: SizedBox(
                //     width: 100,
                //     child: Row(
                //       children: [
                //         IconButton(
                //           onPressed: () {
                //             deleteNote(note.id);
                //           },
                //           icon: const Icon(Icons.delete),
                //         ),
                //         IconButton(
                //           onPressed: () {
                //             updateNote(note);
                //           },
                //           icon: const Icon(Icons.edit),
                //         )
                //       ],
                //     ),
                //   ),
                // );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () {
          createNote();
        },
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
    );
  }
}
