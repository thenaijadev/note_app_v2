import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:netapp/app/data/models/outlet.dart';
import 'package:netapp/app/presentation/widgets/new/label_card_outlets.dart';
import 'package:netapp/app/presentation/widgets/new/mobile_data_table.dart';
import 'package:netapp/app/presentation/widgets/title_text.dart';
import 'package:netapp/app/providers/state_providers.dart';
import 'package:netapp/router/routes.dart';
import 'package:netapp/utilities/constants.dart/app_colors.dart';

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

  List<Outlet> filteredOutlets = [];

  bool showAll = true;

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

    // setState(() {});

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: ListView(children: [
          // AnimationSearchBar(
          // backIconColor: Colors.black,
          // centerTitle: '',
          // onChanged: (text) => debugPrint(text),
          // searchTextEditingController: controller,
          // horizontalPadding: 5),
          const LabelCardOutlets(),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0, bottom: 10),
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        showAll = true;
                      });
                    },
                    child: const TextWidget(
                      text: "Remove filters",
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ],
          ),
          outlet.outlets.isEmpty
              ? const Center(
                  child: TextWidget(
                    text: "No outlets captured",
                    fontWeight: FontWeight.bold,
                  ),
                )
              : showAll
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: ListView.builder(
                        itemCount: outlet.outlets.length,
                        itemBuilder: (BuildContext context, index) {
                          return MobileDataTable(
                            outletList: outlet.outlets.reversed.toList(),
                            index: index,
                          );
                        },
                      ),
                    )
                  : outlet.outlets.isEmpty
                      ? const Center(
                          child: TextWidget(
                            text: "No outlets captured",
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : filteredOutlets.isNotEmpty
                          ? SizedBox(
                              height: MediaQuery.of(context).size.height * 0.8,
                              child: ListView.builder(
                                itemCount: filteredOutlets.isEmpty
                                    ? outlet.outlets.length
                                    : filteredOutlets.length,
                                itemBuilder: (BuildContext context, index) {
                                  return MobileDataTable(
                                    outletList: filteredOutlets.isEmpty
                                        ? outlet.outlets.reversed.toList()
                                        : filteredOutlets.reversed.toList(),
                                    index: index,
                                  );
                                },
                              ),
                            )
                          : const Center(
                              child: TextWidget(
                                text: "No outlets captured",
                                fontWeight: FontWeight.bold,
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
                      const SizedBox(
                        height: 20,
                      ),
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
                                  Navigator.pushNamed(context, Routes.calendar);
                                },
                                child: const TextWidget(
                                  text: "Check Calender",
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0, top: 0),
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

                                  setState(() {
                                    showAll = false;
                                  });

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
