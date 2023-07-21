import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:netapp/app/presentation/widgets/new/edit_bottom_sheet_widget.dart';
import 'package:netapp/app/presentation/widgets/new/input_field_widget.dart';
import 'package:netapp/app/presentation/widgets/title_text.dart';
import 'package:netapp/app/providers/state_providers.dart';
import 'package:netapp/utilities/constants.dart/app_colors.dart';
import 'package:netapp/utilities/lists.dart';
import 'package:netapp/utilities/logger.dart';
import 'package:netapp/utilities/router/routes.dart';

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
        region: getRegion(state),
        channel: channel!,
        subChannel: subChannel!);

    Navigator.pushNamed(context, Routes.skuForm,
        arguments: outlet.outlets.last.id);

    logger.e(outlet.outlets.last.id);

    // widget.controller.animateTo(1,
    //     duration: const Duration(seconds: 1), curve: Curves.bounceIn);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15.0, top: 10),
            child: Row(
              children: [
                TextWidget(
                  text: "'*'",
                  color: Colors.red,
                ),
                SizedBox(
                  width: 10,
                ),
                TextWidget(
                  text: "Mandatory fields",
                  fontSize: 12,
                  color: Color.fromARGB(255, 107, 106, 106),
                ),
              ],
            ),
          ),
          InputFieldWidget(
              isMandatory: true,
              label: "Outlet name",
              hintText: "",
              onChanged: (val) {},
              textFieldkey: formfieldkey_1),
          InputFieldWidget(
              isMandatory: true,
              label: "Address",
              hintText: "",
              onChanged: (val) {},
              textFieldkey: formfieldkey_2),
          DropDownInput(
            isMandatory: true,
            onChanged: (val) {
              state = val.name;
              setState(() {});
            },
            label: "State",
            options: states(),
            enableSearch: true,
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 4, top: 15, left: 22),
            child: TextWidget(
              text: "Region:",
              fontSize: 15,
              color: Color.fromARGB(255, 110, 111, 117),
            ),
          ),
          Center(
            child: Container(
              height: 45,
              width: 315,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.inputBorder),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 12),
                  child: TextWidget(text: getRegion(state))),
            ),
          ),
          DropDownInput(
            isMandatory: true,
            onChanged: (val) {
              city = val.name;
            },
            label: "City",
            enableSearch: true,
            options: cities(),
          ),
          DropDownInput(
              isMandatory: true,
              onChanged: (val) {
                channel = val.name;
              },
              label: "Channel",
              options: channels),
          DropDownInput(
            isMandatory: true,
            onChanged: (val) {
              subChannel = val.name;
            },
            label: "Sub Channels",
            enableSearch: true,
            options: subChannels(),
          ),
          InputFieldWidget(
              isMandatory: false,
              label: "Name of Manager",
              hintText: "",
              onChanged: (val) {},
              textFieldkey: formfieldkey_3),
          InputFieldWidget(
              isMandatory: false,
              label: "Phone Number of Manager",
              hintText: "",
              onChanged: (val) {},
              textFieldkey: formfieldkey_4),
          InputFieldWidget(
              isMandatory: false,
              label: "Supplier(s)",
              hintText: "",
              onChanged: (val) {},
              textFieldkey: formfieldkey_5),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Padding(
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
                      // Navigator.pushNamed(context, Routes.outlets);
                    },
                    child: const TextWidget(
                      text: "Save",
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
  }
}
