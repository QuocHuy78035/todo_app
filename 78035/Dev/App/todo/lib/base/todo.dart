import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/base/base_color.dart';

class Todo extends StatefulWidget {
  final String? content;
  final String? description;
  final int? day;
  final int? month;
  final int? year;

  const Todo(
      {Key? key,
      this.content,
      this.description,
      this.day,
      this.month,
      this.year})
      : super(key: key);

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          12,
        ),
      ),
      color: AppColor.colorF79E89,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          top: 12,
          bottom: 6,
          right: 16,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${widget.content}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColor.colorWhite,
                  ),
                ),
                SvgPicture.asset(
                  'assets/images/Clock_icon.svg',
                  color: AppColor.colorWhite,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  '${widget.description}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColor.colorWhite,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  'Created at ${widget.day}-${widget.month}-${widget.year}',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: AppColor.colorWhite,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
