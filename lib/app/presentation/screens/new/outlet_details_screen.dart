import 'package:flutter/material.dart';
import 'package:netapp/app/data/models/outlet.dart';
import 'package:netapp/app/presentation/screens/new/today_details.dart';
import 'package:netapp/app/presentation/widgets/new/header_underline.dart';
import 'package:netapp/app/presentation/widgets/title_text.dart';
import 'package:netapp/utilities/constants.dart/app_colors.dart';

class OutletDetailsScreen extends StatefulWidget {
  const OutletDetailsScreen({
    super.key,
    required this.outlet,
  });
  final Outlet outlet;

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        title: const TextWidget(
          text: "Outlet Details",
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
              child: Column(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 0, 44, 139),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: widget.outlet.name!,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  DataRowWidget(
                      label: "Date Entered:", value: widget.outlet.date),
                  const HeaderUnderline(height: 1, color: AppColors.hintColor),
                  DataRowWidget(
                      label: "Last Visited:", value: widget.outlet.date),
                  const HeaderUnderline(height: 1, color: AppColors.hintColor),
                  // DataRowWidget(
                  //     label: "Last visited",
                  //     value: widget.outletList?[widget.index]?.products?.last
                  //                 .dateEntered ==
                  //             DateFormat.yMMMMd().format(DateTime.now())
                  //         ? "Today"
                  //         : widget
                  //             .outletList?[widget.index]?.products?.last.dateEntered),
                  // const HeaderUnderline(height: 1, color: AppColors.hintColor),
                  DataRowWidget(label: "Address", value: widget.outlet.address),
                  const HeaderUnderline(height: 1, color: AppColors.hintColor),
                  DataRowWidget(label: "State", value: widget.outlet.state),
                  const HeaderUnderline(height: 1, color: AppColors.hintColor),
                  DataRowWidget(label: "City", value: widget.outlet.city),
                  const HeaderUnderline(height: 1, color: AppColors.hintColor),
                  DataRowWidget(label: "Region", value: widget.outlet.region),
                  const HeaderUnderline(height: 1, color: AppColors.hintColor),
                  DataRowWidget(label: "Channel", value: widget.outlet.channel),
                  const HeaderUnderline(height: 1, color: AppColors.hintColor),
                  DataRowWidget(
                      label: "Sub-channel", value: widget.outlet.subChannel),
                  const HeaderUnderline(height: 1, color: AppColors.hintColor),
                  DataRowWidget(
                      label: "Manager's name",
                      value: widget.outlet.managerName),
                  const HeaderUnderline(height: 1, color: AppColors.hintColor),
                  DataRowWidget(
                      label: "Manager's phone",
                      value: widget.outlet.managerPhoneNumber),
                  const HeaderUnderline(height: 1, color: AppColors.hintColor),
                  DataRowWidget(
                      label: "Supplier", value: widget.outlet.supplier),
                  const HeaderUnderline(height: 1, color: AppColors.hintColor),
                  DataRowWidget(
                      label: "Latitude",
                      value: widget.outlet.latitude.toString()),
                  const HeaderUnderline(height: 1, color: AppColors.hintColor),
                  DataRowWidget(
                      label: "Longitude",
                      value: widget.outlet.longitude.toString()),
                  const HeaderUnderline(height: 1, color: AppColors.hintColor),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
