import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:netapp/app/presentation/widgets/edit_bottom_sheet_widget.dart';
import 'package:netapp/app/presentation/widgets/input_field_widget.dart';
import 'package:netapp/app/presentation/widgets/title_text.dart';
import 'package:netapp/app/providers/state_providers.dart';
import 'package:netapp/utilities/constants.dart/app_colors.dart';
import 'package:netapp/utilities/lists.dart';

class OutletDetailsForm extends ConsumerStatefulWidget {
  const OutletDetailsForm(
      {super.key, required this.controller, required this.data});
  final TabController controller;
  final Map<String, dynamic> data;

  @override
  ConsumerState<OutletDetailsForm> createState() => _OutletDetailsFormState();
}

class _OutletDetailsFormState extends ConsumerState<OutletDetailsForm> {
  final formfieldkey_1 = GlobalKey<FormFieldState>();
  final formfieldkey_2 = GlobalKey<FormFieldState>();
  final formfieldkey_3 = GlobalKey<FormFieldState>();
  final formfieldkey_4 = GlobalKey<FormFieldState>();
  final formfieldkey_5 = GlobalKey<FormFieldState>();
  String? state;
  String? city;
  String? channel;
  String? region;
  String? subChannel;

  void createOutlet() {
    final outlet = ref.watch(outletProvider.notifier);
    outlet.createOutlet(
        date: DateFormat.yMMMMd().format(DateTime.now()),
        capturedBy: widget.data["capturedBy"],
        latitude: widget.data["latitude"],
        longitude: widget.data["longitude"],
        name: formfieldkey_1.currentState?.value,
        managerName: formfieldkey_3.currentState?.value,
        managerPhoneNumber: formfieldkey_4.currentState?.value,
        supplier: formfieldkey_5.currentState?.value,
        address: formfieldkey_2.currentState?.value,
        stateCity: state!,
        city: city!,
        region: region!,
        channel: channel!,
        subChannel: subChannel!);
    widget.controller.animateTo(1,
        duration: const Duration(seconds: 1), curve: Curves.bounceIn);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          InputFieldWidget(
              label: "Outlet name",
              hintText: "",
              onChanged: (val) {},
              textFieldkey: formfieldkey_1),
          InputFieldWidget(
              label: "Address",
              hintText: "",
              onChanged: (val) {},
              textFieldkey: formfieldkey_2),
          DropDownInput(
            onChanged: (val) {
              state = val.name;
            },
            label: "State",
            options: states(),
            enableSearch: true,
          ),
          DropDownInput(
            onChanged: (val) {
              city = val.name;
            },
            label: "City",
            enableSearch: true,
            options: cities(),
          ),
          DropDownInput(
            onChanged: (val) {
              region = val.name;
            },
            label: "Region",
            enableSearch: true,
            options: regions(),
          ),
          DropDownInput(
              onChanged: (val) {
                channel = val.name;
              },
              label: "Channel",
              options: channels),
          DropDownInput(
            onChanged: (val) {
              subChannel = val.name;
            },
            label: "Sub Channels",
            enableSearch: true,
            options: subChannels(),
          ),
          InputFieldWidget(
              label: "Name of Manager",
              hintText: "",
              onChanged: (val) {},
              textFieldkey: formfieldkey_3),
          InputFieldWidget(
              label: "Phone Number of Manager",
              hintText: "",
              onChanged: (val) {},
              textFieldkey: formfieldkey_4),
          InputFieldWidget(
              label: "Supplier(s)",
              hintText: "",
              onChanged: (val) {},
              textFieldkey: formfieldkey_5),
          const SizedBox(
            height: 20,
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
                    createOutlet();
                  },
                  child: const TextWidget(
                    text: "Next",
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
