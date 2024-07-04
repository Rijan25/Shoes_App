class Review {
  String id;
  String imageUrl;
  String profileName;
  double rate;
  String discription;
  DateTime dateTime;

  Review(
      {required this.id,
      required this.imageUrl,
      required this.profileName,
      required this.rate,
      required this.discription,
      required this.dateTime});

  @override
  bool operator ==(covariant Review other) {
    if (identical(this, other)) return true;
    return other.id == id &&
        other.imageUrl == imageUrl &&
        other.profileName == profileName &&
        other.rate == rate &&
        other.discription == discription &&
        other.dateTime == dateTime;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        imageUrl.hashCode ^
        profileName.hashCode ^
        rate.hashCode ^
        discription.hashCode ^
        dateTime.hashCode;
  }

  Review copyWith({
    String? id,
    String? imageUrl,
    String? profileName,
    double? rate,
    String? discription,
    DateTime? dateTime,
  }) {
    return Review(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      profileName: profileName ?? this.profileName,
      rate: rate ?? this.rate,
      discription: discription ?? this.discription,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'imageUrl': imageUrl,
      'profileName': profileName,
      'rate': rate,
      'discription': discription,
      'dateTime': dateTime.millisecondsSinceEpoch,
    };
  }

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'] as String,
      imageUrl: json['imageUrl'] as String,
      profileName: json['profileName'] as String,
      rate: json['rate'] as double,
      discription: json['discription'] as String,
      dateTime: DateTime.fromMillisecondsSinceEpoch(json['dateTime'] as int),
    );
  }
}
