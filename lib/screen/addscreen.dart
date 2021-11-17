import 'package:flutter/material.dart';
import 'package:shualedurialeksandrezakradze/data/model/clothesmodel.dart';
import 'package:shualedurialeksandrezakradze/data/repository/helper.dart';
import 'homescreen.dart';

class addclothesscreen extends StatelessWidget {
  static const routeName = "/add-new-movie";
  final _formKey = GlobalKey<FormState>();
  TextEditingController productID = TextEditingController();
  TextEditingController productname = TextEditingController();
  TextEditingController productdescription = TextEditingController();
  TextEditingController productsize = TextEditingController();
  TextEditingController productprice = TextEditingController();
  TextEditingController producturl = TextEditingController();
  @override Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(centerTitle: true, title: const Text('ADD PRODUCT'),
    ),
      body: SingleChildScrollView(child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
          child: Form(key: _formKey, child: Column(children: [Card(child: TextFormField(
                    controller: productID,
                    decoration: const InputDecoration(hintText: "Enter Product ID"),
                    keyboardType: TextInputType.number,
                    validator: (value) {if (value == null || value.isEmpty) {
                        return "Enter Product ID";
                      }return null;
                    },
                  ),
                ),
                Card(child: TextFormField(
                    controller: productname,
                    decoration: const InputDecoration(hintText: "Enter Product Name"),
                    validator: (value) {if (value == null || value.isEmpty) {
                        return "Enter Product Name";
                      }return null;
                    },
                  ),
                ),
                Card(child: TextFormField(
                    controller: producturl,
                    decoration: const InputDecoration(hintText: "Enter Image URL"),
                    validator: (value) {if (value == null || value.isEmpty) {
                        return "Enter Image URL";
                      }
                      return null;
                    },
                  ),
                ),
                Card(child: TextFormField(
                    controller: productdescription,
                    decoration: const InputDecoration(hintText: "Enter Product Description"),
                    validator: (value) {if (value == null || value.isEmpty) {
                        return "Enter Product Description";
                      }
                      return null;
                    },
                  ),
                ),
                Card(child: TextFormField(
                    controller: productsize,
                    decoration: const InputDecoration(hintText: "Enter Product Size"),
                    validator: (value) {if (value == null || value.isEmpty) {
                        return "Enter Product Size";
                      }
                      return null;
                    },
                  ),
                ),
                Card(child: TextFormField(
                    controller: productprice,
                    decoration: const InputDecoration(hintText: "Enter Product Price"),
                    keyboardType: TextInputType.number,
                    validator: (value) {if (value == null || value.isEmpty) {
                        return "Enter Product Price";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 50),
                Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [ElevatedButton(onPressed:()=>Navigator.pop(context),
                      child: const Text("Back")),
                      ElevatedButton(onPressed: () {if (_formKey.currentState!.validate()) {
                          Clothes product = Clothes(
                              id: int.parse(productID.text),
                              name: productname.text,
                              imageUrl: producturl.text,
                              description: productdescription.text,
                              size: productsize.text,
                              price: double.parse(productprice.text),
                          );
                          productrepository().addProduct(
                              product.id,
                              product.name,
                              product.imageUrl,
                              product.description,
                              product.size,
                              product.price);
                          Navigator.push(context, MaterialPageRoute(builder:(_)=>homescreen()));
                          // Navigator.pop(context);
                        }
                      },
                      child: const Text("Add"),
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