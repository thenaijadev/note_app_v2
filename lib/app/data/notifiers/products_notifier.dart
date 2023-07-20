import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:netapp/app/data/models/product.dart';
import 'package:uuid/uuid.dart';

class ProductNotifier extends StateNotifier<List<Product>> {
  // ignore: unused_field
  Product? _product;

  ProductNotifier() : super([]);

  List<Product> _products = [];

  List<Product> get products => _products;
  var uuid = const Uuid();

  final productBox = Hive.box("products");

  Future<List<Product>> getProducts() async {
    List<Product> list = [];
    for (var key in productBox.keys) {
      var dataAsMap = await productBox.getAt(key);
      var dataAsProduct = Product.fromMap(dataAsMap);
      list.add(dataAsProduct);
    }

    state = list;
    _products = state;
    return list;
  }

  void createProduct(
      {required brand,
      required outletId,
      required sku,
      required channel,
      required category,
      required isNewListing,
      required availability,
      required price,
      required hasPriceChanged,
      required newPrice,
      image}) async {
    _product = Product(
      price: price,
      availability: availability,
      outletId: outletId,
      id: uuid.v4(),
      dateEntered: DateFormat.yMMMMd().format(DateTime.now()),
      newPrice: newPrice,
      brand: brand!,
      isNewListing: isNewListing,
      hasPriceChanged: hasPriceChanged!,
      sku: sku,
      category: category,
      channel: channel,
    );
    productBox.add(_product?.toMap());

    List<Product> theProducts = await getProducts();
    print({"theProducts": theProducts});

    state = theProducts;
    _products = state;

    print({"state": state});
  }
}
