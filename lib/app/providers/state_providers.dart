import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netapp/app/data/models/competition_review.dart';
import 'package:netapp/app/data/models/outlet.dart';
import 'package:netapp/app/data/models/product.dart';
import 'package:netapp/app/data/notifiers/outlet_notifier.dart';
import 'package:netapp/app/data/notifiers/products_notifier.dart';
import 'package:netapp/app/data/notifiers/review_notifier.dart';
import 'package:netapp/app/data/notifiers/stop_watch_notifier.dart';

final outletProvider = StateNotifierProvider<OutletNotifier, List<Outlet>>(
    (ref) => OutletNotifier());

final reviewProvider =
    StateNotifierProvider<ReviewNotifier, List<CompetitionReview>>(
        (ref) => ReviewNotifier());

final productsProvider = StateNotifierProvider<ProductNotifier, List<Product>>(
    (ref) => ProductNotifier());

final stopwatchProvider =
    StateNotifierProvider<StopwatchNotifier, Duration>((ref) {
  return StopwatchNotifier();
});
