import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo/base/base_color.dart';

class HomeScreenNoTasks extends StatelessWidget {
  const HomeScreenNoTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        SvgPicture.asset(
          'assets/images/Check_list_icon.svg',
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
          'What do you want to do today?',
          style: TextStyle(
            fontSize: 20,
            color: AppColor.colorF79E89
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Tap + to add your tasks',
          style: TextStyle(
              fontSize: 16,
              color: AppColor.colorF79E89
          ),
        ),
      ],
    );
  }
}
