// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:netapp/app/bloc/products/products_bloc.dart';
// import 'package:netapp/app/presentation/widgets/input_field_widget.dart';
// import 'package:netapp/app/presentation/widgets/loading.dart';
// import 'package:netapp/app/presentation/widgets/select_widget.dart';
// import 'package:netapp/app/presentation/widgets/title_text.dart';
// import 'package:netapp/utilities/drop_down_items.dart';
// import 'package:netapp/utilities/image_helper.dart';
// import 'package:netapp/utilities/snackbar.dart';
// import 'package:searchfield/searchfield.dart';

// class BottomSheetScreen extends StatefulWidget {
//   const BottomSheetScreen({super.key});

//   @override
//   _BottomSheetScreenState createState() => _BottomSheetScreenState();
// }

// class _BottomSheetScreenState extends State<BottomSheetScreen> {
//   String cust = "";
//   String cat = "";
//   String brandCat = "";
//   String bran = "";
//   String prod = "";
//   String tipe = "";
//   bool? checkBoxValue = false;
//   final formfieldkey_1 = GlobalKey<FormFieldState>();
//   File? image;

//   @override
//   Widget build(BuildContext context) {
//     ProductsBloc bloc = context.watch<ProductsBloc>();

//     return Material(
//       color: Colors.transparent,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: <Widget>[
//           Container(
//               height: MediaQuery.of(context).size.height *
//                   0.95, // Adjust the height as needed
//               decoration: const BoxDecoration(
//                 color: Color.fromARGB(255, 237, 237, 237),
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 20.0),
//                 child: Form(
//                     child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       const Padding(
//                         padding: EdgeInsets.symmetric(vertical: 20.0),
//                         child: TextWidget(
//                           text: "Add product",
//                           fontSize: 18,
//                         ),
//                       ),
//                       SelectWidget(
//                         hint: "Customer",
//                         suggestions: customers
//                             .map((e) => SearchFieldListItem(e))
//                             .toList(),
//                         validator: (x) {
//                           if (!customers.contains(x) || x!.isEmpty) {
//                             return 'Please Enter a valid customer';
//                           }
//                           return null;
//                         },
//                         onSuggestedTap: (value) {
//                           cust = value.searchKey;
//                         },
//                       ),

//                       const SizedBox(
//                         height: 20,
//                       ),
//                       SelectWidget(
//                         hint: "Category",
//                         suggestions: category
//                             .map((e) => SearchFieldListItem(e))
//                             .toList(),
//                         validator: (x) {
//                           if (!category.contains(x) || x!.isEmpty) {
//                             return 'Please Enter a valid customer';
//                           }
//                           return null;
//                         },
//                         onSuggestedTap: (value) {
//                           cat = value.searchKey;
//                         },
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       SelectWidget(
//                         hint: "Brand Category",
//                         suggestions: brandCategory
//                             .map((e) => SearchFieldListItem(e))
//                             .toList(),
//                         validator: (x) {
//                           if (!brandCategory.contains(x) || x!.isEmpty) {
//                             return 'Please Enter a valid customer';
//                           }
//                           return null;
//                         },
//                         onSuggestedTap: (value) {
//                           brandCat = value.searchKey;
//                         },
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       SelectWidget(
//                         hint: "Brand",
//                         suggestions:
//                             brand.map((e) => SearchFieldListItem(e)).toList(),
//                         validator: (x) {
//                           if (!brand.contains(x) || x!.isEmpty) {
//                             return 'Please Enter a valid customer';
//                           }
//                           return null;
//                         },
//                         onSuggestedTap: (value) {
//                           bran = value.searchKey;
//                         },
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       SelectWidget(
//                         hint: "Products",
//                         suggestions: products
//                             .map((e) => SearchFieldListItem(e))
//                             .toList(),
//                         validator: (x) {
//                           if (!products.contains(x) || x!.isEmpty) {
//                             return 'Please Enter a valid customer';
//                           }
//                           return null;
//                         },
//                         onSuggestedTap: (value) {
//                           prod = value.searchKey;
//                         },
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       SelectWidget(
//                         hint: "Type",
//                         suggestions:
//                             theType.map((e) => SearchFieldListItem(e)).toList(),
//                         validator: (x) {
//                           if (!theType.contains(x) || x!.isEmpty) {
//                             return 'Please Enter a valid customer';
//                           }
//                           return null;
//                         },
//                         onSuggestedTap: (value) {
//                           tipe = value.searchKey;
//                         },
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       // SfDateRangePicker(

//                       //   onSelectionChanged: _onSelectionChanged,
//                       //   selectionMode: DateRangePickerSelectionMode.single,
//                       // ),
//                       InputFieldWidget(
//                         label: "Quantity",
//                         hintText: "Eg: 10",
//                         onChanged: (value) {
//                           formfieldkey_1.currentState?.validate();
//                         },
//                         textFieldkey: formfieldkey_1,
//                         validator: (value) {
//                           return null;
//                         },
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       image == null
//                           ? const TextWidget(text: "No image to show")
//                           : CircleAvatar(
//                               backgroundImage: FileImage(image!),
//                             ),
//                       ElevatedButton(
//                         onPressed: () async {
//                           image =
//                               await ImageHelper.pickImage(ImageSource.gallery);
//                           setState(() {});
//                           print(image.toString());
//                         },
//                         style: ButtonStyle(
//                             backgroundColor: MaterialStateColor.resolveWith(
//                                 (states) => const Color(0xff6C757D))),
//                         child: const Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 108.0),
//                           child: TextWidget(
//                             text: "Choose image",
//                             color: Colors.white,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                       ),
//                       ElevatedButton(
//                         onPressed: () async {
//                           image =
//                               await ImageHelper.pickImage(ImageSource.camera);
//                           setState(() {});
//                         },
//                         style: ButtonStyle(
//                             backgroundColor: MaterialStateColor.resolveWith(
//                                 (states) => const Color(0xff6C757D))),
//                         child: const Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 108.0),
//                           child: TextWidget(
//                             text: "Take photo",
//                             color: Colors.white,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                       ),
//                       BlocConsumer<ProductsBloc, ProductsState>(
//                         listener: (context, state) {
//                           if (state is ProductStateError) {
//                             InfoSnackBar.showErrorSnackBar(
//                                 context, "There has been an error");
//                           } else if (state
//                               is ProductStateAllProductsRetrieved) {
//                             InfoSnackBar.showSuccessSnackBar(
//                                 context, "Success");
//                           }
//                         },
//                         builder: (context, state) {
//                           if (state is ProductStateIsLoading) {
//                             return const LoadingWidget();
//                           }
//                           return ElevatedButton(
//                             onPressed: () {
//                               bloc.add(ProductEventCreateProduct(
//                                   customer: cust,
//                                   product: prod,
//                                   brand: bran,
//                                   category: cat,
//                                   brandCategory: brandCat,
//                                   quantity: int.parse(
//                                       formfieldkey_1.currentState?.value),
//                                   type: tipe,
//                                   image: image?.path ?? ""));
//                               Navigator.pop(context);
//                             },
//                             style: ButtonStyle(
//                                 backgroundColor: MaterialStateColor.resolveWith(
//                                     (states) => const Color(0xff6C757D))),
//                             child: const Padding(
//                               padding: EdgeInsets.symmetric(horizontal: 108.0),
//                               child: TextWidget(
//                                 text: "Save Details",
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w400,
//                               ),
//                             ),
//                           );
//                         },
//                       ),

//                       const SizedBox(
//                         height: 300,
//                       ),
//                     ],
//                   ),
//                 )),
//               )),
//         ],
//       ),
//     );
//   }
// }

// // void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
// //   print(args.value);
// // }