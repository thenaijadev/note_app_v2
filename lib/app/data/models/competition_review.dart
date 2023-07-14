// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CompetitionReview {
  String? acticatedBrand;
  String? whatActication;
  String? image;
  String? additionalInformtion;
  String? date;
  CompetitionReview({
    this.acticatedBrand,
    this.whatActication,
    this.image,
    this.additionalInformtion,
    this.date,
  });

  CompetitionReview copyWith({
    String? acticatedBrand,
    String? whatActication,
    String? image,
    String? additionalInformtion,
    String? date,
  }) {
    return CompetitionReview(
      acticatedBrand: acticatedBrand ?? this.acticatedBrand,
      whatActication: whatActication ?? this.whatActication,
      image: image ?? this.image,
      additionalInformtion: additionalInformtion ?? this.additionalInformtion,
      date: date ?? this.date,
    );
  }

  Map<dynamic, dynamic> toMap() {
    return <dynamic, dynamic>{
      'acticatedBrand': acticatedBrand,
      'whatActication': whatActication,
      'image': image,
      'additionalInformtion': additionalInformtion,
      'date': date,
    };
  }

  factory CompetitionReview.fromMap(Map<dynamic, dynamic> map) {
    return CompetitionReview(
      acticatedBrand: map['acticatedBrand'] != null
          ? map['acticatedBrand'] as String
          : null,
      whatActication: map['whatActication'] != null
          ? map['whatActication'] as String
          : null,
      image: map['image'] != null ? map['image'] as String : null,
      additionalInformtion: map['additionalInformtion'] != null
          ? map['additionalInformtion'] as String
          : null,
      date: map['date'] != null ? map['date'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CompetitionReview.fromJson(String source) =>
      CompetitionReview.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CompetitionReview(acticatedBrand: $acticatedBrand, whatActication: $whatActication, image: $image, additionalInformtion: $additionalInformtion, date: $date)';
  }

  @override
  bool operator ==(covariant CompetitionReview other) {
    if (identical(this, other)) return true;

    return other.acticatedBrand == acticatedBrand &&
        other.whatActication == whatActication &&
        other.image == image &&
        other.additionalInformtion == additionalInformtion &&
        other.date == date;
  }

  @override
  int get hashCode {
    return acticatedBrand.hashCode ^
        whatActication.hashCode ^
        image.hashCode ^
        additionalInformtion.hashCode ^
        date.hashCode;
  }
}
