import 'package:furniture_app/models/furniture.dart';

final _chair_1 = Furniture(
  title: 'Chair One',
  description: 'Some description',
  price: '\$ 200',
  imageUrl: 'assets/images/image_2.png',
);

final _chair_2 = Furniture(
  title: 'Chair Two',
  description: 'Some description for chair two',
  price: '\$ 300',
  imageUrl: 'assets/images/image_3.png',
);

final chairs = [
  _chair_1,
  _chair_2,
];
