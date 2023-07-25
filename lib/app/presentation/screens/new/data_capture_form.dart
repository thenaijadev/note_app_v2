import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:netapp/app/presentation/screens/new/today_details.dart';
import 'package:netapp/app/presentation/widgets/new/header_underline.dart';
import 'package:netapp/app/presentation/widgets/new/outlet_details_form.dart';
import 'package:netapp/app/presentation/widgets/title_text.dart';
import 'package:netapp/app/providers/state_providers.dart';
import 'package:netapp/utilities/constants.dart/app_colors.dart';
import 'package:netapp/utilities/geolocator.dart';

class DataCatureScreen extends ConsumerStatefulWidget {
  const DataCatureScreen({super.key});

  @override
  ConsumerState<DataCatureScreen> createState() => _DataCatureScreenState();
}

class _DataCatureScreenState extends ConsumerState<DataCatureScreen>
    with SingleTickerProviderStateMixin {
  Position? position;
  late TabController controller;
  @override
  void initState() {
    controller = TabController(length: 1, vsync: this);

    ref.read(stopwatchProvider.notifier).start();

    setState(() {
      getLocation();
    });

    super.initState();
  }

  getLocation() async {
    position = await GeoLocatorHelper.getUserLocation();
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();

    String date = DateFormat.yMMMMd().format(now);

    final stopwatchDuration = ref.watch(stopwatchProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.inputBorder, width: 2)),
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    const Center(
                      child: TextWidget(
                        text: "Data Capture Form",
                        color: Color.fromARGB(255, 0, 44, 139),
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const HeaderUnderline(),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: AppColors.inputBorder, width: 1),
                      ),
                      child: Column(
                        children: [
                          const HorizontalDivider(width: 500),

                          DataRowWidget(
                            label: "Total time spent:",
                            value: formatDuration(stopwatchDuration),
                          ),
                          const HorizontalDivider(width: 500),
                          const DataRowWidget(
                            label: "Outlet captured by",
                            value: "Ojo Williams",
                          ),
                          const HorizontalDivider(width: 500),
                          DataRowWidget(
                            label: "Capture date",
                            value: date,
                          ),
                          // const HorizontalDivider(width: 500),
                          // DataRowWidget(
                          //   label: "Gps Co-ordinates",
                          //   value: position == null
                          //       ? "Getting Co-ordinates..."
                          //       : "${position?.latitude},${position?.longitude} ",
                          // ),
                          const HorizontalDivider(width: 500),
                          const SizedBox(
                            height: 20,
                          ),
                          TabBar(
                              controller: controller,
                              indicatorColor:
                                  const Color.fromARGB(255, 0, 44, 139),
                              indicatorWeight: 2,
                              tabs: const [
                                TextWidget(
                                  text: "Outlet details",
                                  fontSize: 14,
                                ),
                              ]),
                          SizedBox(
                            height: 1200,
                            child: TabBarView(
                              physics: const NeverScrollableScrollPhysics(),
                              controller: controller,
                              children: [
                                OutletDetailsForm(
                                  controller: controller,
                                  data: {
                                    "capturedBy:": "Okwor",
                                    "date": date,
                                    "latitude": position?.latitude,
                                    "longitude": position?.longitude
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
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

String formatDuration(Duration duration) {
  final hours = duration.inHours.toString().padLeft(2, '0');
  final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
  final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');

  return '$hours:$minutes:$seconds';
}
