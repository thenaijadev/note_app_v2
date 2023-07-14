import 'package:animation_search_bar/animation_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:netapp/app/data/models/outlet.dart';
import 'package:netapp/app/data/models/product.dart';
import 'package:netapp/app/presentation/screens/new/today_details.dart';
import 'package:netapp/app/presentation/widgets/new/header_underline.dart';
import 'package:netapp/app/presentation/widgets/title_text.dart';
import 'package:netapp/utilities/constants.dart/app_colors.dart';

class ProductsTable extends StatefulWidget {
  const ProductsTable({
    super.key,
    required this.outlet,
  });
  final Outlet outlet;

  @override
  State<ProductsTable> createState() => _ProductsTableState();
}

class _ProductsTableState extends State<ProductsTable> {
  late TextEditingController controller;
  late List<Product>? products;
  @override
  void initState() {
    products = widget.outlet.products;
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {});
    });
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(children: [
          AnimationSearchBar(
              backIconColor: Colors.black,
              centerTitle: 'Products',
              onChanged: (text) => debugPrint(text),
              searchTextEditingController: controller,
              horizontalPadding: 5),
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: ListView.builder(
                  itemCount: products?.length,
                  itemBuilder: (BuildContext context, index) {
                    return MobileDataTableProducts(
                        productList: products!,
                        index: index,
                        outlet: widget.outlet);
                  }))
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 0, 44, 139),
        onPressed: () {
          // Navigator.pushReplacementNamed(context, Routes.dataCapture);
        },
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}

class MobileDataTableProducts extends StatelessWidget {
  const MobileDataTableProducts(
      {super.key,
      required this.productList,
      required this.index,
      required this.outlet});
  final List<Product> productList;
  final int index;
  final Outlet outlet;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 0, 44, 139),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextWidget(
                  text: "Outlet:",
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                TextWidget(
                  text: "${outlet.name}",
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                TextWidget(
                  text: "${outlet.date}",
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                // GestureDetector(
                //   onTap: () {
                //     // Navigator.pushNamed(context, Routes.productsTable,
                //     //     arguments: outletList[index]);
                //   },
                //   child: Container(
                //     padding: const EdgeInsets.all(5),
                //     decoration: BoxDecoration(
                //         color: Colors.white,
                //         borderRadius: BorderRadius.circular(10)),
                //     child: const TextWidget(
                //       text: "Trade visit",
                //       fontWeight: FontWeight.bold,
                //       color: Color.fromARGB(255, 0, 44, 139),
                //       fontSize: 12,
                //     ),
                //   ),
                // )
              ],
            ),
          ),
          DataRowWidget(label: "Brand", value: productList[index].brand),
          const HeaderUnderline(height: 1, color: AppColors.hintColor),
          DataRowWidget(label: "SKU", value: productList[index].sku),
          const HeaderUnderline(height: 1, color: AppColors.hintColor),
          DataRowWidget(label: "Category", value: productList[index].category),
          const HeaderUnderline(height: 1, color: AppColors.hintColor),
          DataRowWidget(label: "Channel", value: productList[index].channel),
          const HeaderUnderline(height: 1, color: AppColors.hintColor),
          DataRowWidget(
              label: "Brand availability",
              value: productList[index].isAvailable
                  ? "Available"
                  : "Not Available"),
          const HeaderUnderline(height: 1, color: AppColors.hintColor),
          DataRowWidget(
              label: "In stock?",
              value: productList[index].isOutOfStock ? "No" : "Yes"),
          const HeaderUnderline(height: 1, color: AppColors.hintColor),
          DataRowWidget(
              label: "Is it new?",
              value: productList[index].isNewListing ? "Yes" : "No"),
          const HeaderUnderline(height: 1, color: AppColors.hintColor),
          DataRowWidget(
              label: "Price", value: productList[index].price.toString()),
          const HeaderUnderline(height: 1, color: AppColors.hintColor),
          DataRowWidget(
              label: "Has it's price changed?",
              value: productList[index].hasPriceChanged ? "Yes" : "No"),
          const HeaderUnderline(height: 1, color: AppColors.hintColor),
          DataRowWidget(
              label: "New price",
              value: productList[index].newPrice.toString()),
          const HeaderUnderline(height: 1, color: AppColors.hintColor),
        ],
      ),
    );
  }
}
