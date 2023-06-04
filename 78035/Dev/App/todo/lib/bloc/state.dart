import '../repo/todo_repo.dart';

abstract class TodoState{
  List<TodoRepo> todo = [];
  TodoState(this.todo);
}

class UpdateTodoState extends TodoState{
  UpdateTodoState(super.todo);
}

class DeleteTodoState extends TodoState{
  DeleteTodoState(super.todo);
}

class InitialState extends TodoState{
  InitialState(super.todo);
}