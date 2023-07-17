import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:netapp/app/presentation/screens/new/today_details.dart';
import 'package:netapp/app/presentation/widgets/new/header_underline.dart';
import 'package:netapp/app/presentation/widgets/new/trade_visit_form.dart';
import 'package:netapp/app/presentation/widgets/title_text.dart';
import 'package:netapp/utilities/constants.dart/app_colors.dart';
import 'package:netapp/utilities/geolocator.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class SkuScreen extends StatefulWidget {
  const SkuScreen({super.key});

  @override
  State<SkuScreen> createState() => _SkuScreenState();
}

class _SkuScreenState extends State<SkuScreen>
    with SingleTickerProviderStateMixin {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();
  Position? position;
  late TabController controller;
  @override
  void initState() {
    _stopWatchTimer.onStartTimer();
    controller = TabController(length: 1, vsync: this);
    getLocation();
    super.initState();
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose(); // Need to call dispose function.
  }

  getLocation() async {
    position = await GeoLocatorHelper.getUserLocation();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();

    String date = DateFormat.yMMMMd().format(now);
    String displayTime;
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
                          StreamBuilder<int>(
                              stream: _stopWatchTimer.rawTime,
                              builder: (context, snap) {
                                final value = snap.data;
                                displayTime = StopWatchTimer.getDisplayTime(
                                    value!,
                                    milliSecond: false);
                                return DataRowWidget(
                                  label: "Total time spent:",
                                  value: displayTime,
                                );
                              }),
                          const HorizontalDivider(width: 500),
                          const DataRowWidget(
                            label: "Outlet captured by",
                            value: "12",
                          ),
                          const HorizontalDivider(width: 500),
                          DataRowWidget(
                            label: "Capture date",
                            value: date,
                          ),
                          const HorizontalDivider(width: 500),
                          DataRowWidget(
                            label: "Gps Co-ordinates",
                            value: position == null
                                ? "Getting Co-ordinates..."
                                : "${position?.latitude},${position?.longitude} ",
                          ),
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
                                  text: "Sku Details",
                                  fontSize: 14,
                                ),
                                // TextWidget(
                                //   text: "Trade visit",
                                //   fontSize: 14,
                                // ),
                                // TextWidget(
                                //   text: "Competition Review",
                                //   fontSize: 14,
                                // ),
                              ]),
                          SizedBox(
                            height: 1200,
                            child: TabBarView(
                              physics: const NeverScrollableScrollPhysics(),
                              controller: controller,
                              children: const [
                                // OutletDetailsForm(
                                //   controller: controller,
                                //   data: {
                                //     "capturedBy:": "Okwor",
                                //     "date": date,
                                //     "latitude": position?.latitude,
                                //     "longitude": position?.longitude
                                //   },
                                // ),
                                PageViewWidget(),
                                // const CompetitionReviewForm()
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
