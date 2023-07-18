import 'package:animation_search_bar/animation_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:netapp/app/data/models/outlet.dart';
import 'package:netapp/app/presentation/screens/new/today_details.dart';
import 'package:netapp/app/presentation/widgets/new/header_underline.dart';
import 'package:netapp/app/presentation/widgets/title_text.dart';
import 'package:netapp/app/providers/state_providers.dart';
import 'package:netapp/utilities/constants.dart/app_colors.dart';
import 'package:netapp/utilities/router/routes.dart';

class OutletTable extends ConsumerStatefulWidget {
  const OutletTable({super.key});

  @override
  ConsumerState<OutletTable> createState() => _OutletDataState();
}

class _OutletDataState extends ConsumerState<OutletTable> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();

    super.initState();
  }

  List<Outlet> filteredOutlets = [];

  String formattedDate = DateFormat.yMMMMd().format(DateTime.now());

  bool _isFunctionExecuted = false;

  void runFunctionOnce(outlet) {
    if (!_isFunctionExecuted) {
      Future.delayed(const Duration(milliseconds: 100), () {
        outlet.getOutlets();
        setState(() {});
      });
      _isFunctionExecuted = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final outlet = ref.watch(outletProvider.notifier);
    runFunctionOnce(outlet);

    List<Outlet>? filterOutlets(
      date,
    ) {
      filteredOutlets = outlet.outlets.where((element) {
        return element.date == date;
      }).toList();

      return filteredOutlets;
    }

    setState(() {});

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(children: [
          AnimationSearchBar(
              backIconColor: Colors.black,
              centerTitle: 'Outlets',
              onChanged: (text) => debugPrint(text),
              searchTextEditingController: controller,
              horizontalPadding: 5),
          filteredOutlets.isEmpty
              ? SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: ListView.builder(
                    itemCount: outlet.outlets.length,
                    itemBuilder: (BuildContext context, index) {
                      return MobileDataTable(
                        outletList: outlet.outlets,
                        index: index,
                      );
                    },
                  ),
                )
              : SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: ListView.builder(
                    itemCount: filteredOutlets.isEmpty
                        ? outlet.outlets.length
                        : filteredOutlets.length,
                    itemBuilder: (BuildContext context, index) {
                      return MobileDataTable(
                        outletList: filteredOutlets.isEmpty
                            ? outlet.outlets
                            : filteredOutlets,
                        index: index,
                      );
                    },
                  ),
                )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 0, 44, 139),
        onPressed: () {
          showCupertinoModalPopup(
              context: context,
              builder: (context) {
                return Container(
                  height: MediaQuery.of(context).size.height * .4,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Expanded(
                          child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        onDateTimeChanged: (date) {
                          String dateString = "$date";
                          DateTime theDate = DateTime.parse(dateString);
                          formattedDate =
                              DateFormat('MMMM d, yyyy').format(theDate);
                        },
                      )),
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
                                  filterOutlets(formattedDate);
                                  Navigator.of(context).pop();
                                },
                                child: const TextWidget(
                                  text: "Filter",
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              });
        },
        child: const Icon(
          Icons.calendar_month,
          size: 30,
        ),
      ),
    );
  }
}

class MobileDataTable extends StatefulWidget {
  const MobileDataTable(
      {super.key, required this.outletList, required this.index});
  final List<Outlet?>? outletList;
  final int index;

  @override
  State<MobileDataTable> createState() => _MobileDataTableState();
}

class _MobileDataTableState extends State<MobileDataTable> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 0, 44, 139),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextWidget(
                  text: "Name:",
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                TextWidget(
                  text: widget.outletList?[widget.index]?.name!,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.productsTable,
                        arguments: widget.outletList?[widget.index]?.id);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: const TextWidget(
                      text: "Trade visit",
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
              label: "Date entered",
              value: widget.outletList?[widget.index]?.date),
          const HeaderUnderline(height: 1, color: AppColors.hintColor),

          //  DataRowWidget(
          //     label: "Last visited",
          //     value: widget.outletList?[widget.index]?.products?.last
          //                 .dateEntered ==
          //             DateFormat.yMMMMd().format(DateTime.now())
          //         ? "Today"
          //         : widget.outletList?[widget.index]?.products?.last
          //             .dateEntered)

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
              label: "Region", value: widget.outletList?[widget.index]?.region),
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
    );
  }
}
