import 'package:flutter/material.dart';
import 'package:netapp/app/presentation/widgets/title_text.dart';

class YesNoRadioButtons extends StatefulWidget {
  const YesNoRadioButtons(
      {super.key,
      required this.groupValueYes,
      required this.groupValueNo,
      required this.onChangedYes,
      required this.onChangedNo,
      required this.label,
      this.radioLabel1 = "Yes:",
      this.radioLabel2 = "No:"});
  final void Function(bool?)? onChangedYes;
  final void Function(bool?)? onChangedNo;
  final String label;
  final String radioLabel1;
  final String radioLabel2;

  final bool groupValueYes;
  final bool groupValueNo;
  @override
  _YesNoRadioButtonsState createState() => _YesNoRadioButtonsState();
}

class _YesNoRadioButtonsState extends State<YesNoRadioButtons> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            text: widget.label,
            fontSize: 15,
            color: const Color.fromARGB(255, 110, 111, 117),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  TextWidget(
                    text: widget.radioLabel1,
                    fontSize: 15,
                    color: const Color.fromARGB(255, 110, 111, 117),
                  ),
                  Radio<bool>(
                      activeColor: const Color.fromARGB(255, 0, 44, 139),
                      value: true,
                      groupValue: widget.groupValueYes,
                      onChanged: widget.onChangedYes),
                ],
              ),
              Row(
                children: [
                  TextWidget(
                    text: widget.radioLabel2,
                    fontSize: 15,
                    color: const Color.fromARGB(255, 110, 111, 117),
                  ),
                  Radio<bool>(
                    value: true,
                    groupValue: widget.groupValueNo,
                    onChanged: widget.onChangedNo,
                    activeColor: const Color.fromARGB(255, 0, 44, 139),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
