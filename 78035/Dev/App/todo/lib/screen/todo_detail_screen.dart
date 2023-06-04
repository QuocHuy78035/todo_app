import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/base/base_color.dart';
import 'package:todo/bloc/bloc.dart';
import 'package:todo/bloc/state.dart';

import '../bloc/event.dart';

class DetailTodo extends StatelessWidget {
  final int indexValue;

  const DetailTodo({Key? key,required this.indexValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        void deleteTasks(){
          var bloc = context.read<TodoBloc>();
          bloc.add(DeleteTodoEvent());
          state.todo.remove(todo[indexValue]);
          Navigator.pop(context);
        }
        return Scaffold(
          backgroundColor: AppColor.colorWhite,
          appBar: AppBar(
            backgroundColor: AppColor.colorWhite,
            elevation: 0,
            iconTheme: IconThemeData(color: AppColor.colorBlack),
            actions: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/Clock_icon.svg',
                    color: AppColor.colorBlack,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: deleteTasks,
                    child: SvgPicture.asset(
                      'assets/images/Delete_icon.svg',
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '${state.todo[indexValue].content}',
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '${state.todo[indexValue].description}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 450,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Create at ${state.todo[indexValue].day} ${state.todo[indexValue].month} ${state.todo[indexValue].year}',
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
