import 'package:flutter/material.dart';
import 'package:netapp/app/presentation/widgets/title_text.dart';

class InfoSnackBar {
  static SnackBar successSnackBar(String message) {
    return SnackBar(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      backgroundColor: Colors.green,
      behavior: SnackBarBehavior.floating,
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Icon(
              Icons.verified,
              color: Colors.lightGreen,
              size: 20,
            ),
            Text(
              message,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      margin: const EdgeInsets.only(left: 18, right: 18, bottom: 20),
      elevation: 2,
    );
  }

  static SnackBar errorSnackBar(String message) {
    return SnackBar(
      duration: const Duration(seconds: 2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      backgroundColor: const Color(0xffFCD9D7),
      behavior: SnackBarBehavior.floating,
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: Image.asset("assets/images/caution.png"),
            ),
            const SizedBox(
              width: 20,
            ),
            Flexible(
              flex: 5,
              child: TextWidget(
                text: message,
                color: const Color(0xffbac2f0d0b),
              ),
            ),
          ],
        ),
      ),
      margin: const EdgeInsets.only(left: 18, right: 18, bottom: 20),
      elevation: 2,
    );
  }

  static void showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(InfoSnackBar.errorSnackBar(message));
  }

  static void showSuccessSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(InfoSnackBar.successSnackBar(message));
  }
}
