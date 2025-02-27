import 'package:isar/isar.dart';

import '../collections/note.dart';

class NotesRepository {
  ///
  Future<Note?> getNote({required Isar isar, required int id}) async => isar.notes.get(id);

  ///
  Future<Note?> getNoteByYearmonth({required Isar isar, required String yearmonth}) async =>
      isar.notes.filter().startDateEqualTo(yearmonth).findFirst();

  ///
  Future<List<Note>?> getNoteList({required Isar isar}) async => isar.notes.where().sortByStartDate().findAll();

  ///
  Future<void> inputNoteList({required Isar isar, required List<Note> noteList}) async {
    for (final Note element in noteList) {
      inputNote(isar: isar, note: element);
    }
  }

  ///
  Future<void> inputNote({required Isar isar, required Note note}) async =>
      isar.writeTxn(() async => isar.notes.put(note));

  ///
  Future<void> updateNote({required Isar isar, required Note note}) async => isar.notes.put(note);
}
