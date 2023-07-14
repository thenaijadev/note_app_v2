// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:netapp/app/data/models/product.dart';

class Outlet {
  Outlet(
      {this.date,
      this.capturedBy,
      this.latitude,
      this.longitude,
      this.name,
      this.address,
      this.state,
      this.city,
      this.region,
      this.channel,
      this.subChannel,
      this.managerName,
      this.managerPhoneNumber,
      this.supplier,
      this.products});
  final String? date;
  final String? capturedBy;
  final double? latitude;
  final double? longitude;
  final String? name;
  final String? address;
  final String? state;
  final String? city;
  final String? region;
  final String? channel;
  final String? subChannel;
  final String? managerName;
  final String? managerPhoneNumber;
  final String? supplier;
  final List<Product>? products;

  Outlet copyWith({
    String? date,
    String? capturedBy,
    double? latitude,
    double? longitude,
    String? name,
    String? address,
    String? state,
    String? city,
    String? region,
    String? channel,
    String? subChannel,
    String? managerName,
    String? managerPhoneNumber,
    String? supplier,
    List<Product>? products,
  }) {
    return Outlet(
      date: date ?? this.date,
      capturedBy: capturedBy ?? this.capturedBy,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      name: name ?? this.name,
      address: address ?? this.address,
      state: state ?? this.state,
      city: city ?? this.city,
      region: region ?? this.region,
      channel: channel ?? this.channel,
      subChannel: subChannel ?? this.subChannel,
      managerName: managerName ?? this.managerName,
      managerPhoneNumber: managerPhoneNumber ?? this.managerPhoneNumber,
      supplier: supplier ?? this.supplier,
      products: products ?? this.products,
    );
  }

  @override
  String toString() {
    return 'Outlet(date: $date, capturedBy: $capturedBy, latitude: $latitude, longitude: $longitude, name: $name, address: $address, state: $state, city: $city, region: $region, channel: $channel, subChannel: $subChannel, managerName: $managerName, managerPhoneNumber: $managerPhoneNumber, supplier: $supplier, products: $products)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'capturedBy': capturedBy,
      'latitude': latitude,
      'longitude': longitude,
      'name': name,
      'address': address,
      'state': state,
      'city': city,
      'region': region,
      'channel': channel,
      'subChannel': subChannel,
      'managerName': managerName,
      'managerPhoneNumber': managerPhoneNumber,
      'supplier': supplier,
      'products': products?.map((x) => x.toMap()).toList(),
    };
  }

  factory Outlet.fromMap(Map<dynamic, dynamic> map) {
    List<Product>? list = [];
    if (map["products"] != null) {
      map["products"].forEach((dynamic item) {
        final productItem = Product.fromMap(item);
        list.add(productItem);
      });
    }

    return Outlet(
      date: map['date'] != null ? map['date'] as String : null,
      capturedBy:
          map['capturedBy'] != null ? map['capturedBy'] as String : null,
      latitude: map['latitude'] != null ? map['latitude'] as double : null,
      longitude: map['longitude'] != null ? map['longitude'] as double : null,
      name: map['name'] != null ? map['name'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      state: map['state'] != null ? map['state'] as String : null,
      city: map['city'] != null ? map['city'] as String : null,
      region: map['region'] != null ? map['region'] as String : null,
      channel: map['channel'] != null ? map['channel'] as String : null,
      subChannel:
          map['subChannel'] != null ? map['subChannel'] as String : null,
      managerName:
          map['managerName'] != null ? map['managerName'] as String : null,
      managerPhoneNumber: map['managerPhoneNumber'] != null
          ? map['managerPhoneNumber'] as String
          : null,
      supplier: map['supplier'] != null ? map['supplier'] as String : null,
      products: map['products'] != null ? list : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory Outlet.fromJson(String source) =>
      Outlet.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant Outlet other) {
    if (identical(this, other)) return true;

    return other.date == date &&
        other.capturedBy == capturedBy &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.name == name &&
        other.address == address &&
        other.state == state &&
        other.city == city &&
        other.region == region &&
        other.channel == channel &&
        other.subChannel == subChannel &&
        other.managerName == managerName &&
        other.managerPhoneNumber == managerPhoneNumber &&
        other.supplier == supplier &&
        listEquals(other.products, products);
  }

  @override
  int get hashCode {
    return date.hashCode ^
        capturedBy.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        name.hashCode ^
        address.hashCode ^
        state.hashCode ^
        city.hashCode ^
        region.hashCode ^
        channel.hashCode ^
        subChannel.hashCode ^
        managerName.hashCode ^
        managerPhoneNumber.hashCode ^
        supplier.hashCode ^
        products.hashCode;
  }
}
