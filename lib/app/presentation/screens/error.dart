import 'package:flutter/material.dart';
import 'package:netapp/app/presentation/widgets/title_text.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: TextWidget(
          text: "This route does not exist",
          textAlign: TextAlign.center,
          fontSize: 20,
        ),
      ),
    );
  }
}
