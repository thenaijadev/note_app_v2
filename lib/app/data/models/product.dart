import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  Product(
      {required this.channel,
      required this.availability,
      required this.id,
      required this.outletId,
      required this.brand,
      required this.dateEntered,
      required this.sku,
      required this.category,
      required this.isNewListing,
      required this.price,
      required this.hasPriceChanged,
      this.newPrice,
      this.image});
  final String brand;
  final String sku;
  final String outletId;
  final String dateEntered;
  final String category;
  final String id;
  final String availability;
  final String channel;
  final bool isNewListing;
  final double price;
  final bool hasPriceChanged;
  final double? newPrice;
  final String? image;

  @override
  String toString() {
    return 'Product(brand: $brand,availability: $availability, sku: $sku, sku: $outletId,, category: $category, id:$id,  channel: $channel, isNewListing: $isNewListing, price: $price, hasPriceChanged: $hasPriceChanged, newPrice: $newPrice, image: $image, )';
  }

// TODO:The ish
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "outletId": outletId,
      "availability": availability,
      'brand': brand,
      'sku': sku,
      'category': category,
      "id": id,
      'channel': channel,
      'isNewListing': isNewListing,
      'price': price,
      'hasPriceChanged': hasPriceChanged,
      'newPrice': newPrice,
      "dateEntered": dateEntered,
      'image': image,
    };
  }

  factory Product.fromMap(Map<dynamic, dynamic> map) {
    return Product(
      availability: map["availability"] as String,
      outletId: map["outletId"] as String,
      id: map["id"] as String,
      dateEntered: map["dateEntered"] as String,
      brand: map['brand'] as String,
      sku: map['sku'] as String,
      category: map['category'] as String,
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
