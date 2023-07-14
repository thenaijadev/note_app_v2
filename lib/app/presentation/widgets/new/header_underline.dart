import 'package:flutter/material.dart';
import 'package:netapp/utilities/constants.dart/app_colors.dart';

class HeaderUnderline extends StatelessWidget {
  const HeaderUnderline({super.key, this.height = 5, this.color});

  final double height;

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: height,
          width: 100,
          decoration: const BoxDecoration(
            color: AppColors.hintColor,
          ),
        ),
        Container(
          height: height,
          width: 150,
          decoration: BoxDecoration(
            color: color ?? const Color.fromARGB(255, 0, 44, 139),
          ),
        ),
        Container(
          height: height,
          width: 100,
          decoration: const BoxDecoration(
            color: AppColors.hintColor,
          ),
        )
      ],
    );
  }
}
