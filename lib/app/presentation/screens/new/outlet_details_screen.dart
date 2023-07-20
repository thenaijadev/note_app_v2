import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:netapp/app/data/models/outlet.dart';
import 'package:netapp/app/presentation/screens/new/today_details.dart';
import 'package:netapp/app/presentation/widgets/new/header_underline.dart';
import 'package:netapp/app/presentation/widgets/title_text.dart';
import 'package:netapp/utilities/constants.dart/app_colors.dart';
import 'package:netapp/utilities/router/routes.dart';

class OutletDetailsScreen extends StatefulWidget {
  const OutletDetailsScreen(
      {super.key, required this.outletList, required this.index});
  final List<Outlet?>? outletList;
  final int index;

  @override
  State<OutletDetailsScreen> createState() => _OutletDetailsScreenState();
}

class _OutletDetailsScreenState extends State<OutletDetailsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
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
                            Navigator.pushNamed(context, Routes.productsTable,
                                arguments:
                                    widget.outletList?[widget.index]?.id);
                            // Navigator.pushNamed(context, Routes.outlets);
                          },
                          child: const TextWidget(
                            text: "Trade visit",
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
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
                            Navigator.pushNamed(
                              context,
                              Routes.reviewForm,
                            );
                            // Navigator.pushNamed(context, Routes.outlets);
                          },
                          child: const TextWidget(
                            text: "Competition Review",
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
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
                    text: widget.outletList?[widget.index]?.name!,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            DataRowWidget(
                label: "Date Entered:",
                value: widget.outletList?[widget.index]?.date),
            const HeaderUnderline(height: 1, color: AppColors.hintColor),
            DataRowWidget(
                label: "Last Visited:",
                value: widget.outletList?[widget.index]?.date),
            const HeaderUnderline(height: 1, color: AppColors.hintColor),
            DataRowWidget(
                label: "Last visited",
                value: widget.outletList?[widget.index]?.products?.last
                            .dateEntered ==
                        DateFormat.yMMMMd().format(DateTime.now())
                    ? "Today"
                    : widget
                        .outletList?[widget.index]?.products?.last.dateEntered),
            const HeaderUnderline(height: 1, color: AppColors.hintColor),
            DataRowWidget(
                label: "Address",
                value: widget.outletList?[widget.index]?.address),
            const HeaderUnderline(height: 1, color: AppColors.hintColor),
            DataRowWidget(
                label: "State", value: widget.outletList?[widget.index]?.state),
            const HeaderUnderline(height: 1, color: AppColors.hintColor),
            DataRowWidget(
                label: "City", value: widget.outletList?[widget.index]?.city),
            const HeaderUnderline(height: 1, color: AppColors.hintColor),
            DataRowWidget(
                label: "Region",
                value: widget.outletList?[widget.index]?.region),
            const HeaderUnderline(height: 1, color: AppColors.hintColor),
            DataRowWidget(
                label: "Channel",
                value: widget.outletList?[widget.index]?.channel),
            const HeaderUnderline(height: 1, color: AppColors.hintColor),
            DataRowWidget(
                label: "Sub-channel",
                value: widget.outletList?[widget.index]?.subChannel),
            const HeaderUnderline(height: 1, color: AppColors.hintColor),
            DataRowWidget(
                label: "Manager's name",
                value: widget.outletList?[widget.index]?.managerName),
            const HeaderUnderline(height: 1, color: AppColors.hintColor),
            DataRowWidget(
                label: "Manager's phone",
                value: widget.outletList?[widget.index]?.managerPhoneNumber),
            const HeaderUnderline(height: 1, color: AppColors.hintColor),
            DataRowWidget(
                label: "Supplier",
                value: widget.outletList?[widget.index]?.supplier),
            const HeaderUnderline(height: 1, color: AppColors.hintColor),
            DataRowWidget(
                label: "Latitude",
                value: widget.outletList?[widget.index]?.latitude.toString()),
            const HeaderUnderline(height: 1, color: AppColors.hintColor),
            DataRowWidget(
                label: "Longitude",
                value: widget.outletList?[widget.index]?.longitude.toString()),
            const HeaderUnderline(height: 1, color: AppColors.hintColor),
          ],
        ),
      ),
    );
  }
}
