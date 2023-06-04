import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo/bloc/bloc.dart';
import 'package:todo/bloc/event.dart';
import 'package:todo/bloc/state.dart';
import 'package:todo/repo/todo_repo.dart';
import 'package:todo/screen/home_screen/home_screen_detail/home_screen_havetasks.dart';
import 'package:todo/screen/home_screen/home_screen_detail/home_screen_notask.dart';
import '../../base/base_button.dart';
import '../../base/base_color.dart';
import '../../base/base_input.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        String? content;
        String? description;
        var bloc = context.read<TodoBloc>();
        void onClickButtonAddTask() {
          bloc.add(
            AddTodoEvent(),
          );
          state.todo.add(
            TodoRepo(
              content,
              description,
              DateTime.now().day,
              DateTime.now().month,
              DateTime.now().year,
            ),
          );
        }
        return Scaffold(
          backgroundColor: AppColor.colorWhite,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColor.colorWhite,
            title: SvgPicture.asset(
              'assets/images/Todo_icon.svg',
            ),
            actions: [
              SvgPicture.asset(
                'assets/images/Settings_icon.svg',
              ),
              const SizedBox(
                width: 25,
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/Union_icon.svg',
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'List of todo',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w400,
                            color: AppColor.colorF76C6A,
                          ),
                        )
                      ],
                    ),
                    SvgPicture.asset(
                      'assets/images/Plus_circle_icon.svg',
                    )
                  ],
                ),
                if (state.todo.isNotEmpty)
                  Column(
                    children: const [
                      SizedBox(
                        height: 20,
                      ),
                      HomeScreenHaveTasks(),
                    ],
                  )
                else
                  const HomeScreenNoTasks(),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColor.colorF76C6A,
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      decoration: BoxDecoration(
                        color: AppColor.colorF79E89,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            BaseInput(
                              onChanged: (value) {
                                content = value;
                              },
                              hintText: 'Title',
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            BaseInput(
                              onChanged: (value) {
                                description = value;
                              },
                              hintText: 'Description',
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            BaseButton(
                              onPressed: onClickButtonAddTask,
                              content: 'ADD TODO',
                              color: AppColor.colorWhite,
                              width: MediaQuery.of(context).size.width,
                              height: 48,
                              textStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColor.colorF79E89,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            child: const Icon(
              Icons.add,
              size: 34,
            ),
          ),
        );
      },
    );
  }
}
