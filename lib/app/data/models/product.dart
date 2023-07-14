import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  Product(
      {required this.channel,
      required this.brand,
      required this.sku,
      required this.category,
      required this.isAvailable,
      required this.isOutOfStock,
      required this.isNewListing,
      required this.price,
      required this.hasPriceChanged,
      this.newPrice,
      this.image});
  final String brand;
  final String sku;
  final String category;
  final bool isAvailable;
  final bool isOutOfStock;
  final String channel;
  final bool isNewListing;
  final double price;
  final bool hasPriceChanged;
  final double? newPrice;
  final String? image;

  @override
  String toString() {
    return 'Product(brand: $brand, sku: $sku, category: $category, isAvailable: $isAvailable, isOutOfStock: $isOutOfStock, channel: $channel, isNewListing: $isNewListing, price: $price, hasPriceChanged: $hasPriceChanged, newPrice: $newPrice, image: $image, )';
  }

// TODO:The ish
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'brand': brand,
      'sku': sku,
      'category': category,
      'isAvailable': isAvailable,
      'isOutOfStock': isOutOfStock,
      'channel': channel,
      'isNewListing': isNewListing,
      'price': price,
      'hasPriceChanged': hasPriceChanged,
      'newPrice': newPrice,
      'image': image,
    };
  }

  factory Product.fromMap(Map<dynamic, dynamic> map) {
    return Product(
      brand: map['brand'] as String,
      sku: map['sku'] as String,
      category: map['category'] as String,
      isAvailable: map['isAvailable'] as bool,
      isOutOfStock: map['isOutOfStock'] as bool,
      channel: map['channel'] as String,
      isNewListing: map['isNewListing'] as bool,
      price: map['price'] as double,
      hasPriceChanged: map['hasPriceChanged'] as bool,
      newPrice: map['newPrice'] != null ? map['newPrice'] as double : null,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
