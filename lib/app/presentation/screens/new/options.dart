import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netapp/app/presentation/widgets/title_text.dart';
import 'package:netapp/utilities/constants.dart/app_colors.dart';
import 'package:netapp/utilities/router/routes.dart';

class Options extends ConsumerWidget {
  const Options({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 120.0, left: 20, right: 20, bottom: 110),
        child: Center(
          child: Card(
            elevation: 50,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const TextWidget(
                      text: "Welcome",
                      color: AppColors.titleBlack,
                      fontSize: 30,
                    ),
                    const SizedBox(height: 20),
                    const TextWidget(
                      text: "What do you want to do?",
                      color: AppColors.titleBlack,
                      fontSize: 15,
                    ),
                    const SizedBox(height: 50),
                    const SizedBox(
                      height: 30,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.todayDetails);
                      },
                      style: ButtonStyle(
                          fixedSize:
                              const MaterialStatePropertyAll(Size(400, 30)),
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => const Color(0xff004F9F))),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextWidget(
                          text: "Create new outlet",
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.outlets);
                      },
                      style: ButtonStyle(
                          fixedSize:
                              const MaterialStatePropertyAll(Size(400, 30)),
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => const Color(0xff004F9F))),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextWidget(
                          text: "View captured outlets",
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // ElevatedButton(
                    //   onPressed: () {},
                    //   style: ButtonStyle(
                    //       backgroundColor: MaterialStateColor.resolveWith(
                    //           (states) => const Color(0xff6C757D))),
                    //   child: const Padding(
                    //     padding: EdgeInsets.symmetric(horizontal: 60.0),
                    //     child: TextWidget(
                    //       text: "Competition",
                    //       color: Colors.white,
                    //       fontWeight: FontWeight.w400,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
