import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bloc/bloc.dart';
import 'package:todo/bloc/event.dart';
import 'package:todo/bloc/state.dart';
import '../../../base/todo.dart';
import '../../todo_detail_screen.dart';

class HomeScreenHaveTasks extends StatefulWidget {
  const HomeScreenHaveTasks({Key? key}) : super(key: key);

  @override
  State<HomeScreenHaveTasks> createState() => _HomeScreenHaveTasksState();
}

class _HomeScreenHaveTasksState extends State<HomeScreenHaveTasks> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        return SizedBox(
          height: 500,
          child: ListView.builder(
            itemCount: state.todo.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailTodo(
                        indexValue: index,
                      ),
                    ),
                  );
                },
                child: Todo(
                  content: state.todo[index].content,
                  description: state.todo[index].description,
                  day: state.todo[index].day,
                  month: state.todo[index].month,
                  year: state.todo[index].year,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
