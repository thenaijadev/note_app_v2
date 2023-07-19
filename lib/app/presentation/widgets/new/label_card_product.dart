import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:netapp/app/presentation/screens/new/today_details.dart';
import 'package:netapp/app/presentation/widgets/title_text.dart';
import 'package:netapp/utilities/constants.dart/app_colors.dart';

class LabelCardProduct extends StatelessWidget {
  const LabelCardProduct({
    super.key,
    required this.onTap,
  });

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();

    String date = DateFormat.yMMMMd().format(now);
    return Card(
      elevation: 0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 20,
          ),
          const TextWidget(
            text: "Trade Visit",
            color: Color.fromARGB(255, 0, 44, 139),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 5,
                width: 100,
                decoration: const BoxDecoration(
                  color: AppColors.hintColor,
                ),
              ),
              Container(
                height: 5,
                width: 150,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 0, 44, 139),
                ),
              ),
              Container(
                height: 5,
                width: 100,
                decoration: const BoxDecoration(
                  color: AppColors.hintColor,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const HorizontalDivider(width: 500),
          DataRowWidget(
            label: "Date:",
            value: date,
          ),
          const HorizontalDivider(width: 500),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextWidget(
                  text: "Add new SKU",
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                const SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => const Color.fromARGB(255, 0, 44, 139))),
                    onPressed: onTap,
                    child: const TextWidget(
                      text: "Add",
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ))
              ],
            ),
          ),
          const HorizontalDivider(width: 500),
        ],
      ),
    );
  }
}
