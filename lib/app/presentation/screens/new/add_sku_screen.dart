import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:netapp/app/presentation/screens/new/today_details.dart';
import 'package:netapp/app/presentation/widgets/new/header_underline.dart';
import 'package:netapp/app/presentation/widgets/new/trade_visit_form.dart';
import 'package:netapp/app/presentation/widgets/title_text.dart';
import 'package:netapp/app/providers/state_providers.dart';
import 'package:netapp/utilities/constants.dart/app_colors.dart';
import 'package:netapp/utilities/geolocator.dart';

class SkuScreen extends ConsumerStatefulWidget {
  const SkuScreen({super.key, required this.id});
  final String id;
  @override
  ConsumerState<SkuScreen> createState() => _SkuScreenState();
}

class _SkuScreenState extends ConsumerState<SkuScreen>
    with SingleTickerProviderStateMixin {
  Position? position;
  late TabController controller;
  @override
  void initState() {
    controller = TabController(length: 1, vsync: this);
    ref.read(stopwatchProvider.notifier).start();
    getLocation();
    super.initState();
  }

  getLocation() async {
    position = await GeoLocatorHelper.getUserLocation();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    final stopwatchDuration = ref.watch(stopwatchProvider);

    String date = DateFormat.yMMMMd().format(now);
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
                            height: 1250,
                            child: TabBarView(
                              physics: const NeverScrollableScrollPhysics(),
                              controller: controller,
                              children: [
                                PageViewWidget(id: widget.id),

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

String formatDuration(Duration duration) {
  final hours = duration.inHours.toString().padLeft(2, '0');
  final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
  final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');

  return '$hours:$minutes:$seconds';
}
