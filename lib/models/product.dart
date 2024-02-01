import 'package:statemanagement_3c/helpers/dbhelper.dart';

class Product {
  final String productCode;
  String nameDesc;
  double price;
  bool isFavorite;

  Product({
    required this.productCode,
    required this.nameDesc,
    required this.price,
    this.isFavorite = false,
  });

  Map<String, dynamic> toMap() {
    return {
      DbHelper.prodCode: productCode,
      DbHelper.prodName: nameDesc,
      DbHelper.prodPrice: price,
    };
  }
}
