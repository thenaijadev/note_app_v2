import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:netapp/app/presentation/widgets/new/input_field_widget.dart';
import 'package:netapp/app/presentation/widgets/title_text.dart';
import 'package:netapp/app/providers/state_providers.dart';
import 'package:netapp/utilities/constants.dart/app_colors.dart';
import 'package:netapp/utilities/image_helper.dart';
import 'package:netapp/utilities/router/routes.dart';

class CompetitionReviewForm extends ConsumerStatefulWidget {
  const CompetitionReviewForm({super.key});

  @override
  ConsumerState<CompetitionReviewForm> createState() =>
      _CompetitionReviewFormState();
}

class _CompetitionReviewFormState extends ConsumerState<CompetitionReviewForm> {
  final formfieldkey_1 = GlobalKey<FormFieldState>();
  final formfieldkey_2 = GlobalKey<FormFieldState>();
  final formfieldkey_3 = GlobalKey<FormFieldState>();
  String? imageAsString;
  Image? image;
  Future<void> createReview() async {
    final review = ref.watch(reviewProvider.notifier);

    review.createReview(
        date: DateFormat.yMMMMd().format(DateTime.now()),
        activatedBrand: formfieldkey_1.currentState?.value,
        additionalInformation: formfieldkey_3.currentState?.value,
        image: imageAsString,
        brandActivation: formfieldkey_3.currentState?.value);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputFieldWidget(
            label: "What brand is activated?",
            hintText: "",
            onChanged: (val) {},
            textFieldkey: formfieldkey_1),
        InputFieldWidget(
            label: "What activation?",
            hintText: "",
            onChanged: (val) {},
            textFieldkey: formfieldkey_2),
        InputFieldWidget(
            label: "Any additional information?",
            hintText: "",
            onChanged: (val) {},
            textFieldkey: formfieldkey_3),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20),
              child: GestureDetector(
                onTap: () async {
                  imageAsString =
                      await ImageHelper.pickImage(ImageSource.gallery);
                  image = ImageHelper.decodeImage(imageAsString!);
                  setState(() {});
                },
                child: const CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 0, 44, 139),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            image != null
                ? TextButton(
                    onPressed: () async {
                      await showImageAlertDialog(context, image);
                    },
                    child: const TextWidget(text: "View Image"),
                  )
                : const Text("")
          ],
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0, top: 30),
            child: Container(
              width: 272,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: AppColors.inputBorder),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 0, 44, 139),
                    ),
                  ),
                  onPressed: () async {
                    await createReview();
                    Navigator.pushNamed(context, Routes.reviews);
                  },
                  child: const TextWidget(
                    text: "Next",
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }
}

showImageAlertDialog(BuildContext context, image) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: image!,
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0, top: 30),
              child: Container(
                width: 272,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: AppColors.inputBorder),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 0, 44, 139),
                      ),
                    ),
                    onPressed: () async {
                      Navigator.of(context).pop();
                    },
                    child: const TextWidget(
                      text: "Close",
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      );
    },
  );
}
