class Shoes {
  String id;
  String brand;
  String name;
  String discription;
  String imageUrl;
  double price;
  double rating;
  String noOfRating;
  String gender;
  
  Shoes(
      {required this.id,
      required this.brand,
      required this.name,
      required this.discription,
      required this.imageUrl,
      required this.price,
      required this.noOfRating,
      required this.gender,
      required this.rating});

  Shoes copyWith({
    String? id,
    String? brand,
    String? name,
    String? discription,
    String? imageUrl,
    double? price,
    double? rating,
    String? noOfRating,
    String? gender
  }) {
    return Shoes(
      id: id ?? this.id,
      brand: brand ?? this.brand,
      name: name ?? this.name,
      discription: discription ?? this.discription,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      rating: rating ?? this.rating,
      noOfRating: noOfRating ?? this.noOfRating,
      gender: gender?? this.gender,
    );
  }

  @override
  bool operator ==(covariant Shoes other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.brand == brand &&
        other.name == name &&
        other.discription == discription &&
        other.imageUrl == imageUrl &&
        other.price == price &&
        other.rating == rating &&
        other.noOfRating == noOfRating;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        brand.hashCode ^
        name.hashCode ^
        discription.hashCode ^
        imageUrl.hashCode ^
        price.hashCode ^
        rating.hashCode ^
        noOfRating.hashCode;
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'brand': brand,
      'name': name,
      'discription': discription,
      'imageUrl': imageUrl,
      'price': price,
      'rating': rating,
      'noOfRating': noOfRating,
      'gender': gender
    };
  }

  factory Shoes.fromJson(Map<String, dynamic> json) {
    return Shoes(
        id: json['id'] as String,
        brand: json['brand'] as String,
        name: json['name'] as String,
        discription: json['discription'] as String,
        imageUrl: json['imageUrl'] as String,
        price: json['price'] as double,
        rating: json['rating'] as double,
        gender: json['gender'] as String,
        noOfRating: json['noOfRating'] as String);
  }
}
