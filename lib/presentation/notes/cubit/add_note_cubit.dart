import 'package:bloc/bloc.dart';
import 'package:eduvibe/noteDatabase/note_model.dart';
import 'package:eduvibe/presentation/notes/cubit/add_note_state.dart';
import 'package:hive/hive.dart';

class AddNoteCubit extends Cubit<AddNoteState>{
  AddNoteCubit() : super(AddNoteInitial());

  addNote(NoteModel note) async{
    emit(AddNoteLoading());
    try{
      var notesBox =Hive.box<NoteModel>('notes_box');
      await notesBox.add(note);
      emit(AddNoteSuccess());
    } catch(e){
      AddNoteFailure(e.toString());
    }
  }
}