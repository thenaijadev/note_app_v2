import 'dart:io';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

import 'package:netapp/app/presentation/widgets/new/input_field_widget.dart';
import 'package:netapp/app/presentation/widgets/title_text.dart';
import 'package:netapp/utilities/constants.dart/app_colors.dart';
import 'package:netapp/utilities/router/routes.dart';

class EditForm extends StatefulWidget {
  const EditForm({super.key, required this.data});
  final Map<dynamic, dynamic> data;
  @override
  State<EditForm> createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();

  late SingleValueDropDownController _cntMulti;
  final formfieldkey_1 = GlobalKey<FormFieldState>();

  @override
  void initState() {
    _cntMulti = SingleValueDropDownController();
    customer = widget.data["customer"];
    brand = widget.data["brand"];
    brandCat = widget.data["brandCategory"];
    type = widget.data["type"];
    quantity = widget.data["quantity"].toString();
    category = widget.data["category"];
    product = widget.data["product"];

    super.initState();
  }

  @override
  void dispose() {
    _cntMulti.dispose();
    super.dispose();
  }

  String? customer;
  String? brand;
  String? brandCat;
  String? category;
  String? type;
  String? product;
  String? quantity;
  File? image;

  @override
  Widget build(BuildContext context) {
    // ProductsBloc bloc = context.watch<ProductsBloc>();

    return SafeArea(
      child: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              DropDownInput(
                options: customers,
                label: "Customer",
                onChanged: (val) {
                  customer = val.value;
                },
                initialValue: widget.data["customer"],
              ),
              DropDownInput(
                options: brandCategories,
                label: "Brand Category",
                onChanged: (val) {
                  brandCat = val.value;
                },
                initialValue: widget.data["brandCategory"],
              ),
              DropDownInput(
                options: brands,
                label: "Brand",
                onChanged: (val) {
                  brand = val.value;
                },
                initialValue: widget.data["brand"],
              ),
              DropDownInput(
                options: categories,
                label: "Category",
                onChanged: (val) {
                  category = val.value;
                },
                initialValue: widget.data["category"],
              ),
              DropDownInput(
                options: types,
                label: "Type",
                onChanged: (val) {
                  type = val.value;
                },
                initialValue: widget.data["type"],
              ),
              DropDownInput(
                options: products,
                label: "Product",
                onChanged: (val) {
                  product = val.value;
                },
                initialValue: widget.data["product"],
              ),
              InputFieldWidget(
                label: "Quantity",
                hintText: "Eg: 10",
                initialValue: widget.data["quantity"].toString(),
                onChanged: (value) {
                  formfieldkey_1.currentState?.validate();

                  quantity = formfieldkey_1.currentState?.value;
                },
                textFieldkey: formfieldkey_1,
                validator: (value) {
                  return null;
                },
              ),
              // SizedBox(
              //   height: 200,
              //   width: 200,
              //   child: Image.file(File(widget.data["image"])),
              // ),
              // ElevatedButton(
              //   onPressed: () async {
              //     image = await ImageHelper.pickImage(ImageSource.camera);
              //     setState(() {});
              //   },
              //   style: ButtonStyle(
              //       backgroundColor: MaterialStateColor.resolveWith(
              //           (states) => const Color(0xff6C757D))),
              //   child: const Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 108.0),
              //     child: TextWidget(
              //       text: "Take image",
              //       color: Colors.white,
              //       fontWeight: FontWeight.w400,
              //     ),
              //   ),
              // ),
              // ElevatedButton(
              //   onPressed: () async {
              //     image = await ImageHelper.pickImage(ImageSource.gallery);
              //     setState(() {});
              //   },
              //   style: ButtonStyle(
              //       backgroundColor: MaterialStateColor.resolveWith(
              //           (states) => const Color(0xff6C757D))),
              //   child: const Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 108.0),
              //     child: TextWidget(
              //       text: "Choose image",
              //       color: Colors.white,
              //       fontWeight: FontWeight.w400,
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: ElevatedButton(
                  onPressed: () {
                    // bloc.add(ProductEventUpdateProduct(
                    //   id: widget.data["id"],
                    //   customer: customer!,
                    //   product: product!,
                    //   brand: brand!,
                    //   category: category!,
                    //   brandCategory: brandCat!,
                    //   quantity: int.parse(formfieldkey_1.currentState?.value),
                    //   type: type!,
                    // ));
                    Navigator.pushReplacementNamed(context, Routes.products);
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => const Color(0xff6C757D))),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 108.0),
                    child: TextWidget(
                      text: "Edit Details",
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

class DropDownInput extends StatefulWidget {
  const DropDownInput(
      {super.key,
      this.initialValue,
      required this.onChanged,
      required this.label,
      required this.options,
      this.enableSearch = false});
  final String? initialValue;
  final void Function(dynamic)? onChanged;
  final String label;
  final List<DropDownValueModel> options;
  final bool enableSearch;

  @override
  State<DropDownInput> createState() => _DropDownInputState();
}

class _DropDownInputState extends State<DropDownInput> {
  late SingleValueDropDownController _cnt;

  @override
  void initState() {
    _cnt = SingleValueDropDownController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20.0,
        left: 20,
        right: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            text: widget.label,
            color: const Color.fromARGB(255, 110, 111, 117),
            fontSize: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: DropDownTextField(
              enableSearch: widget.enableSearch,
              initialValue: widget.initialValue,
              controller: _cnt,
              clearOption: true,
              // enableSearch: true,
              // dropdownColor: Colors.green,
              textFieldDecoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(color: AppColors.inputBorder)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(color: AppColors.inputBorder)),
              ),
              validator: (value) {
                if (value == null) {
                  return "Required field";
                } else {
                  return null;
                }
              },
              dropDownItemCount: 6,

              dropDownList: widget.options,
              onChanged: widget.onChanged,
            ),
          ),
        ],
      ),
    );
  }
}

List<DropDownValueModel> customers = [
  const DropDownValueModel(name: 'John Stores', value: "John Stores"),
  const DropDownValueModel(
    name: 'Exquisite Rumours',
    value: "Exquisite Rumours",
  ),
  const DropDownValueModel(name: 'Fobbs lounge', value: "Fobbs Lounge"),
  const DropDownValueModel(
    name: 'Addide',
    value: "Addide",
  )
];

List<DropDownValueModel> brands = [
  const DropDownValueModel(name: 'Moet & Chandon', value: "Moet & Chandon"),
];

List<DropDownValueModel> brandCategories = [
  const DropDownValueModel(name: 'Sprit', value: "Sprit"),
  const DropDownValueModel(
    name: 'Wines',
    value: "Wines",
  ),
];

List<DropDownValueModel> categories = [
  const DropDownValueModel(name: 'Drink Vendor', value: "Drink Vendor"),
];

List<DropDownValueModel> products = [
  const DropDownValueModel(
      name: 'Moet nectar imperial rose 75cl',
      value: "Moet nectar imperial rose 75cl"),
  const DropDownValueModel(
      name: 'Moet nectar imperial rose ', value: "Moet nectar imperial rose "),
  const DropDownValueModel(
    name: 'Hennessy VS 70cl',
    value: "Hennessy VS 70cl",
  ),
  const DropDownValueModel(name: 'Hennessy VS 35cl', value: "Hennessy VS 35cl"),
];

List<DropDownValueModel> types = [
  const DropDownValueModel(name: 'Opening Stock', value: "Opening Stock"),
  const DropDownValueModel(
    name: 'Sales',
    value: "Sales",
  ),
  const DropDownValueModel(name: 'Purchase', value: "Purchase"),
  const DropDownValueModel(
    name: 'Closing Stock',
    value: "Closing Stock",
  )
];
