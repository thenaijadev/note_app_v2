import 'package:flutter/material.dart';
import 'package:netapp/app/data/models/product.dart';
import 'package:netapp/app/presentation/screens/new/today_details.dart';
import 'package:netapp/app/presentation/widgets/new/header_underline.dart';
import 'package:netapp/app/presentation/widgets/title_text.dart';
import 'package:netapp/utilities/constants.dart/app_colors.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 0, 44, 139),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: product.dateEntered,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              DataRowWidget(label: "Outlet id", value: product.outletId),
              const HeaderUnderline(height: 1, color: AppColors.hintColor),
              DataRowWidget(label: "Brand", value: product.brand),
              const HeaderUnderline(height: 1, color: AppColors.hintColor),
              DataRowWidget(label: "SKU", value: product.sku),
              const HeaderUnderline(height: 1, color: AppColors.hintColor),
              DataRowWidget(label: "Category", value: product.category),
              const HeaderUnderline(height: 1, color: AppColors.hintColor),
              DataRowWidget(label: "Channel", value: product.channel),
              const HeaderUnderline(height: 1, color: AppColors.hintColor),
              DataRowWidget(
                  label: "Brand availability", value: product.availability),
              const HeaderUnderline(height: 1, color: AppColors.hintColor),
              DataRowWidget(
                  label: "Is it new?",
                  value: product.isNewListing ? "Yes" : "No"),
              const HeaderUnderline(height: 1, color: AppColors.hintColor),
              DataRowWidget(label: "Price", value: product.price.toString()),
              const HeaderUnderline(height: 1, color: AppColors.hintColor),
              DataRowWidget(
                  label: "Has it's price changed?",
                  value: product.hasPriceChanged ? "Yes" : "No"),
              const HeaderUnderline(height: 1, color: AppColors.hintColor),
              DataRowWidget(
                  label: "New price",
                  value: product.newPrice.toString() == "null"
                      ? "N/A"
                      : product.newPrice.toString()),
              const HeaderUnderline(height: 1, color: AppColors.hintColor),
            ],
          ),
        ),
      ),
    );
  }
}
