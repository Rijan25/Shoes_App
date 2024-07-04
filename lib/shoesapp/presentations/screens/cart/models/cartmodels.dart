import '../../../../../core/models/shoesmodel.dart';

class Cart {
  String id;
  Shoes shoes;
  String shoesSize;
  String shoeColors;
  int quantity;

  Cart(
      {required this.id,
      required this.shoes,
      required this.shoesSize,
      required this.quantity,
      required this.shoeColors});

  @override
  bool operator ==(covariant Cart other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.shoes == shoes &&
        other.shoesSize == shoesSize &&
        other.shoeColors == shoeColors &&
        other.quantity == quantity;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        shoes.hashCode ^
        shoesSize.hashCode ^
        shoeColors.hashCode ^
        quantity.hashCode;
  }

  Cart copyWith({
    String? id,
    Shoes? shoes,
    String? shoesSize,
    String? shoeColors,
    int? quantity,
  }) {
    return Cart(
      id: id ?? this.id,
      shoes: shoes ?? this.shoes,
      shoesSize: shoesSize ?? this.shoesSize,
      shoeColors: shoeColors ?? this.shoeColors,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'shoes': shoes.toJson(),
      'shoesSize': shoesSize,
      'shoeColors': shoeColors,
      'quantity': quantity,
    };
  }

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      id: json['id'] as String,
      shoes: Shoes.fromJson(json['shoes'] as Map<String, dynamic>),
      shoesSize: json['shoesSize'] as String,
      shoeColors: json['shoeColors'] as String,
      quantity: json['quantity'] as int,
    );
  }
}
