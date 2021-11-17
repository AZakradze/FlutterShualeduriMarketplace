import 'package:flutter/material.dart';
import 'package:shualedurialeksandrezakradze/data/model/dummymodeldata.dart';
import 'package:shualedurialeksandrezakradze/data/model/clothesmodel.dart';
import 'package:shualedurialeksandrezakradze/screen/homescreen.dart';

class productrepository extends ChangeNotifier {
  addProduct
      (int id,
      String name,
      String imageUrl,
      String description,
      String size,
      double price)
  {Clothes product = Clothes
      (id: id,
      name: name,
      imageUrl: imageUrl,
      description: description,
      size: size,
      price: price);
    clothesList.add(product);
    DUMMY_DATA.add(product);
    notifyListeners();}
  deleteproduct(int id) {
    print(id);
    clothesList.removeWhere((element)=>element.id == id);
    notifyListeners();
  }
  editproduct(Clothes clothes, int index) {
    clothesList.replaceRange(index, index + 1, [clothes]);
    notifyListeners();
  }
}