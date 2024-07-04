import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faker/faker.dart';
import 'package:shoesapp/core/models/shoesmodel.dart';
import 'package:shoesapp/core/services/meta.dart';
import 'package:shoesapp/shoesapp/presentations/screens/review/model/reviewmodels.dart';
import 'package:shoesapp/shoesapp/presentations/screens/homedisplay/shoesgridview.dart';

const brand = ['Nike', 'Jordan', 'Adidas', 'Reebok', 'Puma', 'Vans'];

const imageURL = [
  'https://firebasestorage.googleapis.com/v0/b/shoes-app-d6dc0.appspot.com/o/Shoes%2FRebook%2FFreebokbrand1.webp?alt=media&token=54304d2d-eb66-46f8-b3ae-07d7418109d6',
  'https://firebasestorage.googleapis.com/v0/b/shoes-app-d6dc0.appspot.com/o/Shoes%2FRebook%2Freebokbrand2.webp?alt=media&token=a4bfe63e-93ef-41bd-8634-3525c137962d',
  'https://firebasestorage.googleapis.com/v0/b/shoes-app-d6dc0.appspot.com/o/Shoes%2FRebook%2Freebokbrand3.webp?alt=media&token=00666910-aa7b-4edc-9da3-ceeb61d64d25',
  'https://firebasestorage.googleapis.com/v0/b/shoes-app-d6dc0.appspot.com/o/Shoes%2FNike%2Fnikebrand1.webp?alt=media&token=e5541259-20af-4518-b36e-76d25fba4f09',
  'https://firebasestorage.googleapis.com/v0/b/shoes-app-d6dc0.appspot.com/o/Shoes%2FNike%2Fnikebrand2.webp?alt=media&token=2a6aae54-473f-4996-b14d-1151894ade4a',
  'https://firebasestorage.googleapis.com/v0/b/shoes-app-d6dc0.appspot.com/o/Shoes%2FNike%2Fnikebrand3.webp?alt=media&token=bafb198c-dea6-471d-8d7d-5f167b7a5533',
  'https://firebasestorage.googleapis.com/v0/b/shoes-app-d6dc0.appspot.com/o/Shoes%2FNike%2Fnikebrand4.webp?alt=media&token=f718fd19-0f5f-4d56-a057-25b32f8d592a',
  'https://firebasestorage.googleapis.com/v0/b/shoes-app-d6dc0.appspot.com/o/Shoes%2FNike%2Fnikebrand5.webp?alt=media&token=24995494-ee32-4e1e-8037-9ad9474be544',
  'https://firebasestorage.googleapis.com/v0/b/shoes-app-d6dc0.appspot.com/o/Shoes%2FJordan%2Fjordanbrand1.png?alt=media&token=9e276587-6d13-47ef-9144-f4fe7ea17cad',
  'https://firebasestorage.googleapis.com/v0/b/shoes-app-d6dc0.appspot.com/o/Shoes%2FJordan%2Fjordanbrand2.png?alt=media&token=be2211ca-17fd-401c-af54-c36cca55606d',
  'https://firebasestorage.googleapis.com/v0/b/shoes-app-d6dc0.appspot.com/o/Shoes%2FAdidas%2Fadidasbrand1.png?alt=media&token=81c310e4-4d0d-4b95-a63d-092e76de3578',
  'https://firebasestorage.googleapis.com/v0/b/shoes-app-d6dc0.appspot.com/o/Shoes%2FAdidas%2Fadidasbrand2.png?alt=media&token=82aaa326-fad9-43b4-8312-e83034713766',
  'https://firebasestorage.googleapis.com/v0/b/shoes-app-d6dc0.appspot.com/o/Shoes%2FAdidas%2Fadidasbrand3.png?alt=media&token=b4172a6d-61d8-477a-a3c7-e85c06c985ae',
];

generateFakeShoesData() async {
  final random = Random();
  final docUser = FirebaseFirestore.instance.collection("Shoes");
  for (var i = 0; i < 200; i++) {
    int randomIndex = faker.randomGenerator.integer(brand.length);
    final randomBrand = brand[randomIndex];
    final randomDouble = random.nextDouble() * 5;
    randomIndex = faker.randomGenerator.integer(imageURL.length);
    final image = imageURL[randomIndex];
    final index = random.nextInt(3);
    final shoes = Shoes(
        id: faker.guid.guid(),
        brand: randomBrand,
        name: faker.person.name(),
        discription: faker.lorem.sentences(5).join('. '),
        imageUrl: image,
        price: double.parse((random.nextDouble() * 5000).toStringAsFixed(2)),
        noOfRating: faker.randomGenerator.integer(5000).toString(),
        gender: sex[index],
        rating: double.parse(randomDouble.toStringAsFixed(1)));
    await docUser.doc(shoes.id).set(shoes.toJson());
  }
}

generateFakeReview() async {
  final random = Random();
  final docUser = FirebaseFirestore.instance.collection("reviews");
  for (var i in shoesId) {
    final doc = docUser.doc("AllReviews").collection(i);
 
    for (var j = 0; j < 25; j++) {
      // print('Hello $i $j');
      final randomDouble = random.nextDouble() * 5;
      final review = Review(
          id: faker.guid.guid(),
          imageUrl: faker.image.image(keywords: ['people'], random: true),
          profileName: faker.person.name(),
          rate: double.parse(randomDouble.toStringAsFixed(1)),
          discription: faker.lorem.sentences(2).join('. '),
          dateTime:
              faker.date.dateTimeBetween(DateTime(2017, 9, 7), DateTime.now()));
      try {
        await doc.doc(review.id).set(review.toJson());
      } catch (e) {
        Meta.showToast(e.toString());
      }
    }
  }
}

final sex = ["Man", "Woman", 'Unisex'];
