import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:netapp/app/data/models/competition_review.dart';
import 'package:netapp/app/data/models/outlet.dart';
import 'package:netapp/app/data/models/product.dart';
import 'package:netapp/utilities/logger.dart';
import 'package:uuid/uuid.dart';

class OutletNotifier extends StateNotifier<List<Outlet>> {
  Outlet? _outlet;

  OutletNotifier() : super([]);

  Outlet? get outlet => _outlet;

  final List<Product> _products = [];
  List<Outlet> _outlets = [];

  List<Outlet> get outlets => _outlets;

  List<Product> get products => _products;
  final outletBox = Hive.box("outlet_box");

  var uuid = const Uuid();

  void createOutlet(
      {required date,
      required capturedBy,
      required latitude,
      required longitude,
      required name,
      required address,
      required stateCity,
      required city,
      required region,
      required channel,
      required subChannel,
      required managerName,
      required managerPhoneNumber,
      required supplier}) async {
    _outlet = Outlet(
        date: date,
        id: uuid.v4(),
        capturedBy: capturedBy,
        latitude: latitude,
        longitude: longitude,
        name: name,
        address: address,
        state: stateCity,
        city: city,
        region: region,
        channel: channel,
        subChannel: subChannel,
        managerName: managerName,
        managerPhoneNumber: managerPhoneNumber,
        supplier: supplier);
    // state.add(_outlet!);

    outletBox.add(_outlet?.toMap());

    List<Outlet> theOutLets = await getOutlets();

    state = theOutLets;
    _outlets = state;
    // state = theOutLets;
    // _outlets = state;
  }

  void addProductToList(
      {required brand,
      required sku,
      required channel,
      required category,
      required isAvailable,
      required isOutOfStock,
      required isNewListing,
      required price,
      required hasPriceChanged,
      required newPrice,
      image}) async {
    final Product product = Product(
        id: uuid.v4(),
        dateEntered: DateFormat.yMMMMd().format(DateTime.now()),
        channel: channel,
        brand: brand,
        sku: sku,
        category: category,
        isAvailable: isAvailable,
        isOutOfStock: isOutOfStock,
        isNewListing: isNewListing,
        price: price,
        hasPriceChanged: hasPriceChanged,
        newPrice: newPrice,
        image: image);

    products.add(product);
    List<Outlet> stateList = await getOutlets();

    final lastItem = stateList.last;
    final updatedItem = lastItem.copyWith(products: products);
    int index = stateList.length - 1;

    final data = updatedItem.toMap();
    await outletBox.put(index, data);

    List<Outlet> newOutlets = await getOutlets();
    logger.e(newOutlets);
    state = newOutlets;
    _outlets = state;
  }

  Future<List<Outlet>> getOutlets() async {
    List<Outlet> list = [];
    for (var key in outletBox.keys) {
      var dataAsMap = await outletBox.getAt(key);
      var dataAsOutlet = Outlet.fromMap(dataAsMap);
      list.add(dataAsOutlet);
    }

    state = list;
    _outlets = state;
    return list;
  }

  Future<int> getOutletsTodayNumber(String date) async {
    List<CompetitionReview> list = [];
    for (var key in outletBox.keys) {
      var dataAsMap = await outletBox.getAt(key);
      var dataAsCompetitionReview = CompetitionReview.fromMap(dataAsMap);
      list.add(dataAsCompetitionReview);
    }

    final todayOutlet = list.where((element) => element.date == date);
    return todayOutlet.length;
  }

  updateOutlet(String id,
      {required brand,
      required sku,
      required channel,
      required category,
      required isAvailable,
      required isOutOfStock,
      required isNewListing,
      required price,
      required hasPriceChanged,
      required newPrice,
      image}) async {
    final product = Product(
        price: price,
        id: uuid.v4(),
        dateEntered: DateFormat.yMMMMd().format(DateTime.now()),
        newPrice: newPrice,
        brand: brand!,
        isOutOfStock: isOutOfStock!,
        isNewListing: isNewListing,
        hasPriceChanged: hasPriceChanged!,
        sku: sku,
        category: category,
        channel: channel,
        isAvailable: isAvailable);
    List<Outlet> itemList = outletBox.values.cast<Map>().map((itemMap) {
      return Outlet.fromMap(itemMap);
    }).toList();

    int indexToUpdate = itemList.indexWhere((item) => item.id == id);

    if (indexToUpdate != -1) {
      List<Product>? itemToUpdateProducts = itemList[indexToUpdate].products;
      List<Product>? updatatedProducts = [...itemToUpdateProducts!, product];
      itemList[indexToUpdate].products = updatatedProducts;

      outletBox.clear(); // Clear the box before adding updated items
      outletBox.addAll(itemList.map((item) => item.toMap()));
      state = await getOutlets();
      print(state);
    }
  }
}

class ReviewNotifier extends StateNotifier<List<CompetitionReview>> {
  CompetitionReview? _review;

  ReviewNotifier() : super([]);

  List<CompetitionReview> _reviews = [];

  List<CompetitionReview> get reviews => _reviews;

  final reviewsBox = Hive.box("competition_reviews");

  Future<List<CompetitionReview>> getReviews() async {
    List<CompetitionReview> list = [];
    for (var key in reviewsBox.keys) {
      var dataAsMap = await reviewsBox.getAt(key);
      var dataAsCompetitionReview = CompetitionReview.fromMap(dataAsMap);
      list.add(dataAsCompetitionReview);
    }

    state = list;
    _reviews = state;
    return list;
  }

  void createReview(
      {required brandActivation,
      required activatedBrand,
      required additionalInformation,
      required date,
      required image}) async {
    _review = CompetitionReview(
        date: date,
        acticatedBrand: activatedBrand,
        whatActication: brandActivation,
        image: image,
        additionalInformtion: additionalInformation);

    reviewsBox.add(_review?.toMap());

    List<CompetitionReview> theReviews = await getReviews();

    state = theReviews;
    _reviews = state;

    // state = theOutLets;
    // _outlets = state;
  }
}
