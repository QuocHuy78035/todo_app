import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bloc/event.dart';
import 'package:todo/bloc/state.dart';
import '../repo/todo_repo.dart';

List<TodoRepo> todo = [];

class TodoBloc extends Bloc<TodoEvent, TodoState>{
  TodoBloc(): super(InitialState(todo)){
    on<AddTodoEvent>(_onAddTodoEvent);
    on<DeleteTodoEvent>(_onDeleteTodoEvent);
  }

  void _onAddTodoEvent(AddTodoEvent event, Emitter<TodoState> emit){
    emit(UpdateTodoState(todo));
  }

  void _onDeleteTodoEvent(DeleteTodoEvent event, Emitter<TodoState> emit){
    emit(DeleteTodoState(todo));
  }
}