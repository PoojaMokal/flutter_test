import 'package:flutter/material.dart';
import 'package:meui_project/utils/size_config.dart';


class CommonButton extends StatelessWidget {
  final Function onTap;
  final String title;
  const CommonButton({super.key, required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: double.infinity,
        color: const Color(0xff2d2b75),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 2.h,
          ),
        ),
      ),
    );
  }
}
