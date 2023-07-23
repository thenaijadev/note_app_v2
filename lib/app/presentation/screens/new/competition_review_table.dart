import 'package:animation_search_bar/animation_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netapp/app/data/models/competition_review.dart';
import 'package:netapp/app/presentation/screens/new/today_details.dart';
import 'package:netapp/app/presentation/widgets/new/competition_review_form.dart';
import 'package:netapp/app/presentation/widgets/new/header_underline.dart';
import 'package:netapp/app/presentation/widgets/title_text.dart';
import 'package:netapp/app/providers/state_providers.dart';
import 'package:netapp/utilities/constants.dart/app_colors.dart';
import 'package:netapp/utilities/image_helper.dart';
import 'package:netapp/router/routes.dart';

class CompetitionReviewTable extends ConsumerStatefulWidget {
  const CompetitionReviewTable({super.key});

  @override
  ConsumerState<CompetitionReviewTable> createState() => _OutletDataState();
}

class _OutletDataState extends ConsumerState<CompetitionReviewTable> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final reviews = ref.watch(reviewProvider.notifier);
    Future.delayed(const Duration(seconds: 1), () {
      reviews.getReviews();
      // setState(() {});
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(children: [
          AnimationSearchBar(
              backIconColor: Colors.black,
              centerTitle: 'Competition Reviews',
              onChanged: (text) => debugPrint(text),
              searchTextEditingController: controller,
              horizontalPadding: 5),
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: ListView.builder(
                  itemCount: reviews.reviews.length,
                  itemBuilder: (BuildContext context, index) {
                    return MobileDataTable(
                      outletList: reviews.reviews,
                      index: index,
                      image: ImageHelper.decodeImage(
                          reviews.reviews[index].image ?? ""),
                    );
                  }))
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 0, 44, 139),
        onPressed: () {
          Navigator.pushReplacementNamed(context, Routes.reviewForm);
        },
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}

class MobileDataTable extends StatelessWidget {
  const MobileDataTable(
      {super.key, required this.outletList, required this.index, this.image});
  final List<CompetitionReview> outletList;
  final int index;
  final Image? image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 0, 44, 139),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: outletList[index].date!,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                GestureDetector(
                  onTap: () {
                    showImageAlertDialog(context, image);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: const TextWidget(
                      text: "View",
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 44, 139),
                      fontSize: 12,
                    ),
                  ),
                )
              ],
            ),
          ),
          DataRowWidget(
              label: "Activated brand",
              value: outletList[index].acticatedBrand),
          const HeaderUnderline(height: 1, color: AppColors.hintColor),
          DataRowWidget(
              label: "What activation",
              value: outletList[index].whatActication),
          const HeaderUnderline(height: 1, color: AppColors.hintColor),
          DataRowWidget(
              label: "Additional information",
              value: outletList[index].additionalInformtion),
          const HeaderUnderline(height: 1, color: AppColors.hintColor),
        ],
      ),
    );
  }
}
