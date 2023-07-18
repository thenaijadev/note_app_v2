import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:netapp/app/data/models/outlet.dart';
import 'package:netapp/app/data/models/product.dart';
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
    List<Outlet> list = [];
    for (var key in outletBox.keys) {
      var dataAsMap = await outletBox.getAt(key);

      var dataAsOutlet = Outlet.fromMap(dataAsMap);

      list.add(dataAsOutlet);
    }

    final todayOutlet = list.where((element) => element.date == date);

    return todayOutlet.length;
  }
}
