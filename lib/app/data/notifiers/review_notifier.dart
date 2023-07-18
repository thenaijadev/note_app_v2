import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:netapp/app/data/models/competition_review.dart';

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
