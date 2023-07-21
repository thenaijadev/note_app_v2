import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:netapp/app/presentation/screens/new/today_details.dart';
import 'package:netapp/app/presentation/widgets/new/edit_bottom_sheet_widget.dart';
import 'package:netapp/app/presentation/widgets/new/input_field_widget.dart';
import 'package:netapp/app/presentation/widgets/new/yes_no_radio_buttons.dart';
import 'package:netapp/app/presentation/widgets/title_text.dart';
import 'package:netapp/app/providers/state_providers.dart';
import 'package:netapp/utilities/constants.dart/app_colors.dart';
import 'package:netapp/utilities/lists.dart';
import 'package:netapp/utilities/router/routes.dart';

class TradeVisitForm extends ConsumerStatefulWidget {
  const TradeVisitForm({
    required this.id,
    super.key,
  });
  final String id;

  @override
  ConsumerState<TradeVisitForm> createState() => _TradeVisitFormState();
}

class _TradeVisitFormState extends ConsumerState<TradeVisitForm> {
  final formfieldkey_1 = GlobalKey<FormFieldState>();
  final formfieldkey_2 = GlobalKey<FormFieldState>();
  final formfieldkey_3 = GlobalKey<FormFieldState>();
  final formfieldkey_4 = GlobalKey<FormFieldState>();
  final formfieldkey_5 = GlobalKey<FormFieldState>();
  final _formKey = GlobalKey<FormState>();

  String sku = "";
  String? brand;
  String? category = "";
  String? channel = "";
  double? price;
  double? newPrice;

  String? isAvailable;
  bool? isOutOfStock;
  bool? isNew;
  bool? hasPriceChanged;

  @override
  void initState() {
    super.initState();
  }

  bool _isNewListing = false;
  bool _isNoSelected1 = false;

  bool _isPriceChanged = false;
  bool _isNoSelected2 = false;

  bool _isAvailable = false;
  bool _isNoSelected3 = false;
  @override
  Widget build(BuildContext context) {
    final product = ref.read(productsProvider.notifier);

    return Form(
      key: _formKey,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .7,
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                const HorizontalDivider(width: 500),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
                  child: TextWidget(
                    text: "Enter details on relevant brands and products",
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const HorizontalDivider(width: 500),

                DropDownInput(
                    isMandatory: true,
                    onChanged: (val) {
                      setState(() {
                        category = val.name.toString();
                      });
                    },
                    enableSearch: true,
                    label: "Category:",
                    options: theCategories()),
                // DropDownInput(
                //     onChanged: (val) {
                //       setState(() {
                //         sku = val.name.toString();
                //       });
                //     },
                //     enableSearch: true,
                //     label: "Brand:",
                //     options: category == "Wines"
                //         ? theWines()
                //         : category == "Spirits"
                //             ? theSpirits()
                //             : thefoods()),
                DropDownInput(
                    isMandatory: true,
                    onChanged: (val) {
                      setState(() {
                        brand = val.name.toString();
                      });
                    },
                    enableSearch: true,
                    label: "Brand:",
                    options: category == "Wines"
                        ? theWineBrandList()
                        : category == "Spirits"
                            ? theSpiritBrandList()
                            : theFoodBrandList()),
                DropDownInput(
                    isMandatory: true,
                    onChanged: (val) {
                      setState(() {
                        sku = val.name.toString();
                      });
                    },
                    enableSearch: true,
                    label: "Sku:",
                    options: category == "Wines"
                        ? theWines()
                        : category == "Spirits"
                            ? theSpirits()
                            : thefoods()),

                YesNoRadioButtons(
                  label: "Is this brand available?",
                  groupValueYes: _isAvailable,
                  groupValueNo: _isNoSelected3,
                  radioLabel1: "In stock",
                  radioLabel2: "Out of stock",
                  onChangedYes: (value) {
                    setState(() {
                      _isAvailable = value ?? false;
                      _isNoSelected3 = !_isAvailable;
                    });
                  },
                  onChangedNo: (value) {
                    setState(() {
                      _isNoSelected3 = value ?? false;
                      _isAvailable = !_isNoSelected3;
                    });
                  },
                ),

                YesNoRadioButtons(
                  label: "Is it a new listing?",
                  groupValueYes: _isNewListing,
                  groupValueNo: _isNoSelected1,
                  onChangedYes: (value) {
                    setState(() {
                      _isNewListing = value ?? false;
                      _isNoSelected1 = !_isNewListing;
                    });
                  },
                  onChangedNo: (value) {
                    setState(() {
                      _isNoSelected1 = value ?? false;
                      _isNewListing = !_isNoSelected1;
                    });
                  },
                ),

                InputFieldWidget(
                    isMandatory: true,
                    label: "What is it's price?",
                    hintText: "",
                    onChanged: (val) {},
                    textFieldkey: formfieldkey_1),

                YesNoRadioButtons(
                  label: "Has it's price changed?",
                  groupValueYes: _isPriceChanged,
                  groupValueNo: _isNoSelected2,
                  onChangedYes: (value) {
                    setState(() {
                      _isPriceChanged = value ?? false;
                      _isNoSelected2 = !_isPriceChanged;
                    });
                  },
                  onChangedNo: (value) {
                    setState(() {
                      _isNoSelected2 = value ?? false;
                      _isPriceChanged = !_isNoSelected2;
                    });
                  },
                ),

                _isPriceChanged
                    ? InputFieldWidget(
                        isMandatory: true,
                        label: "What is it's new price?",
                        hintText: "",
                        onChanged: (val) {},
                        textFieldkey: formfieldkey_2)
                    : const Text(""),
                const SizedBox(
                  height: 20,
                ),
                // const TextWidget(

                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 10.0,
                      ),
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
                            onPressed: () {
                              Navigator.popAndPushNamed(
                                  context, Routes.productsTable,
                                  arguments: widget.id);

                              product.createProduct(
                                  outletId: widget.id,
                                  price: double.parse(
                                      formfieldkey_1.currentState?.value),
                                  newPrice: _isPriceChanged
                                      ? double.parse(
                                          formfieldkey_2.currentState?.value)
                                      : null,
                                  brand: brand,
                                  isNewListing: _isNewListing,
                                  hasPriceChanged: _isPriceChanged,
                                  sku: sku,
                                  category: getCategory(sku),
                                  channel: getChannel(sku),
                                  availability: _isAvailable
                                      ? "In Stock"
                                      : "Out of Stock");

                              // logger.e({
                              //   "outletId": widget.id,
                              //   "price": double.parse(
                              //       formfieldkey_1.currentState?.value),
                              //   "newPrice": double.parse(
                              //       formfieldkey_2.currentState?.value),
                              //   "brand": brand,
                              //   "isNewListing": _isNewListing,
                              //   "hasPriceChanged": _isPriceChanged,
                              //   "sku": sku,
                              //   "category": getCategory(sku),
                              //   "channel": getChannel(sku),
                              //   "availability":
                              //       _isAvailable ? "In Stock" : "Out of Stock"
                              // });
                            },
                            child: const TextWidget(
                              text: "Next",
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 10.0,
                      ),
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
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                Routes.reviewForm,
                              );
                            },
                            child: const TextWidget(
                              text: "Competition review",
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class PageViewWidget extends StatefulWidget {
  const PageViewWidget({super.key, required this.id});
  final String id;

  @override
  State<PageViewWidget> createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20.0,
      ),
      child: Column(
        children: [
          // SmoothPageIndicator(
          //     controller: controller,
          //     count: products.length,
          //     effect: const ScrollingDotsEffect(dotWidth: 5, dotHeight: 8),
          //     onDotClicked: (index) {}),
          Flexible(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: controller,
              children: [TradeVisitForm(id: widget.id)],
            ),
          ),
        ],
      ),
    );
  }
}
