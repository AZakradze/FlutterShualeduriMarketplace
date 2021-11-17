import 'package:flutter/material.dart';
import 'package:shualedurialeksandrezakradze/data/model/clothesmodel.dart';
import 'package:shualedurialeksandrezakradze/data/repository/helper.dart';

class editclothesscreen extends StatefulWidget {
  static const routeName = "/edit-movie-screen";

  @override _editclothesscreenstate createState()=>_editclothesscreenstate();
}
class _editclothesscreenstate extends State<editclothesscreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController productID;
  late TextEditingController productname;
  late TextEditingController productdescription;
  late TextEditingController productsize;
  late TextEditingController productprice;
  late TextEditingController producturl;

  @override Widget build(BuildContext context) {
    final Map parsedData = ModalRoute.of(context)!.settings.arguments as Map;
    final Clothes product = parsedData["product"];
    final int index = parsedData["index"];
    productID = TextEditingController(text: product.id.toString());
    productname = TextEditingController(text: product.name);
    productdescription = TextEditingController(text: product.description);
    productsize = TextEditingController(text: product.size);
    productprice = TextEditingController(text: product.price.toString());
    producturl = TextEditingController(text: product.imageUrl);
    return Scaffold(appBar: AppBar(centerTitle: true, title: const Text('Edit Product')),
      body: SingleChildScrollView(child: Padding(
          padding: const EdgeInsets.only(left: 35, right: 35, top: 35),
          child: Form(key: _formKey, child: Column(children: [Card(
                  child: TextFormField(
                    controller: productID,
                    keyboardType: TextInputType.number,
                    validator: (value) {if (value == null || value.isEmpty) {
                        return "ID";
                      }
                      return null;
                    },
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: productname,
                    validator: (value) {if (value == null || value.isEmpty) {
                        return "Product Name";
                      }
                      return null;
                    },
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: producturl,
                    validator: (value) {if (value == null || value.isEmpty) {
                        return "Image URL";
                      }
                      return null;
                    },
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: productdescription,
                    validator: (value) {if (value == null || value.isEmpty) {
                        return "Product Description";
                      }
                      return null;
                    },
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: productsize,
                    validator: (value) {if (value == null || value.isEmpty) {
                        return "Product Size";
                      }
                      return null;
                    },
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: productprice,
                    keyboardType: TextInputType.number,
                    validator: (value) {if (value == null || value.isEmpty) {
                        return "Product Price";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(onPressed:()=>Navigator.pop(context),
                      child: const Text("Back"),
                    ),
                    ElevatedButton(onPressed: () {if (_formKey.currentState!.validate()) {
                          Clothes product = Clothes(
                            id: int.parse(productID.text),
                            name: productname.text,
                            imageUrl: producturl.text,
                            description: productdescription.text,
                            size: productsize.text,
                            price: double.parse(productprice.text),
                          );
                          productrepository().editproduct(product, index);
                          Navigator.pop(context);
                        }
                      },
                      child: const Text("Change"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}