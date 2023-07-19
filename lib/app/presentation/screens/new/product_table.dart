import 'package:animation_search_bar/animation_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:netapp/app/data/models/product.dart';
import 'package:netapp/app/presentation/screens/new/today_details.dart';
import 'package:netapp/app/presentation/widgets/new/header_underline.dart';
import 'package:netapp/app/presentation/widgets/new/label_card_product.dart';
import 'package:netapp/app/presentation/widgets/title_text.dart';
import 'package:netapp/app/providers/state_providers.dart';
import 'package:netapp/utilities/constants.dart/app_colors.dart';
import 'package:netapp/utilities/router/routes.dart';

class ProductsTable extends ConsumerStatefulWidget {
  const ProductsTable({super.key, required this.id});

  final String id;

  @override
  ConsumerState<ProductsTable> createState() => _ProductsTableState();
}

class _ProductsTableState extends ConsumerState<ProductsTable> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();

    super.initState();
  }

  List<Product> filteredProducts = [];

  String formattedDate = DateFormat.yMMMMd().format(DateTime.now());

  bool _isFunctionExecuted = false;

  void runFunctionOnce(product) {
    if (!_isFunctionExecuted) {
      Future.delayed(const Duration(milliseconds: 100), () {
        product.getProducts();
        setState(() {});
      });
      _isFunctionExecuted = true;
    }
  }

  bool showAll = true;

  @override
  Widget build(BuildContext context) {
    final product = ref.watch(productsProvider.notifier);

    runFunctionOnce(product);

    final products = product.products.where((element) {
      return element.outletId == widget.id;
    }).toList();

    // List<Product>? filterProducts() {
    //   filteredProducts = product.products.where((element) {
    //     return element.outletId == widget.id;
    //   }).toList();

    //   return filteredProducts;
    // }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: ListView(children: [
          AnimationSearchBar(
              backIconColor: Colors.black,
              centerTitle: '',
              onChanged: (text) => debugPrint(text),
              searchTextEditingController: controller,
              horizontalPadding: 5),
          LabelCardProduct(
            onTap: () {
              Navigator.pushReplacementNamed(context, Routes.skuForm,
                  arguments: widget.id);
            },
          ),
          const SizedBox(
            height: 30,
          ),
          // filteredProducts.isEmpty
          //     ? const Center(
          //         child: TextWidget(
          //           text: "Add products",
          //           fontWeight: FontWeight.bold,
          //         ),
          //       )
          //     : SizedBox(
          //         height: MediaQuery.of(context).size.height * 0.8,
          //         child: ListView.builder(
          //             itemCount: filterProducts()?.length,
          //             itemBuilder: (BuildContext context, index) {
          //               return MobileDataTableProducts(
          //                 productList: filterProducts()!,
          //                 index: index,
          //               );
          //             })),

          products.isEmpty
              ? const Center(
                  child: TextWidget(
                    text: "No Products to show",
                    fontWeight: FontWeight.bold,
                  ),
                )
              : SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (BuildContext context, index) {
                        return MobileDataTableProducts(
                          productList: products,
                          index: index,
                        );
                      }))
        ]),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: const Color.fromARGB(255, 0, 44, 139),
      //   onPressed: () {
      //     Navigator.pushReplacementNamed(context, Routes.skuForm,
      //         arguments: widget.id);
      //   },
      //   child: const Icon(
      //     Icons.add,
      //     size: 30,
      //   ),
      // ),
    );
  }
}

class MobileDataTableProducts extends StatelessWidget {
  const MobileDataTableProducts({
    super.key,
    required this.productList,
    required this.index,
  });
  final List<Product> productList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 0, 44, 139),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: productList[index].dateEntered,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          DataRowWidget(label: "Brand", value: productList[index].brand),
          const HeaderUnderline(height: 1, color: AppColors.hintColor),
          DataRowWidget(label: "SKU", value: productList[index].sku),
          // const HeaderUnderline(height: 1, color: AppColors.hintColor),
          // DataRowWidget(label: "Category", value: productList[index].category),
          // const HeaderUnderline(height: 1, color: AppColors.hintColor),
          // DataRowWidget(label: "Channel", value: productList[index].channel),
          // const HeaderUnderline(height: 1, color: AppColors.hintColor),
          // DataRowWidget(
          //     label: "Brand availability",
          //     value: productList[index].isAvailable
          //         ? "Available"
          //         : "Not Available"),
          // const HeaderUnderline(height: 1, color: AppColors.hintColor),
          // DataRowWidget(
          //     label: "In stock?",
          //     value: productList[index].isOutOfStock ? "No" : "Yes"),
          // const HeaderUnderline(height: 1, color: AppColors.hintColor),
          // DataRowWidget(
          //     label: "Is it new?",
          //     value: productList[index].isNewListing ? "Yes" : "No"),
          // const HeaderUnderline(height: 1, color: AppColors.hintColor),
          // DataRowWidget(
          //     label: "Price", value: productList[index].price.toString()),
          // const HeaderUnderline(height: 1, color: AppColors.hintColor),
          // DataRowWidget(
          //     label: "Has it's price changed?",
          //     value: productList[index].hasPriceChanged ? "Yes" : "No"),
          // const HeaderUnderline(height: 1, color: AppColors.hintColor),
          // DataRowWidget(
          //     label: "New price",
          //     value: productList[index].newPrice.toString()),
          // const HeaderUnderline(height: 1, color: AppColors.hintColor),
        ],
      ),
    );
  }
}
