import 'package:flutter/material.dart';
import 'package:shualedurialeksandrezakradze/data/model/clothesmodel.dart';
import 'package:shualedurialeksandrezakradze/data/repository/helper.dart';
import 'homescreen.dart';

class clothesdetailsscreen extends StatefulWidget {
  static const routeName = "/details-screen";

  @override
  State<clothesdetailsscreen> createState()=>_clothesdetailsscreenstate();
}
class _clothesdetailsscreenstate extends State<clothesdetailsscreen> {
  @override
  Widget build(BuildContext context) {
    final Clothes product = ModalRoute.of(context)!.settings.arguments as Clothes;
    return Scaffold(appBar: AppBar(actions: <Widget>[
        Padding(padding: const EdgeInsets.only(right: 20.0), child: GestureDetector(onTap: () {
                showDialog(context: context, builder:(_)=>AlertDialog(
                    title: const Text("Do you want to remove this product?"),
                    actions: [TextButton(onPressed: () {setState(() {
                              productrepository().deleteproduct(product.id);
                              Navigator.push(context, MaterialPageRoute(
                                      builder:(_)=>homescreen()));});
                          },
                          child: const Text("Yes")), TextButton(onPressed:()=>Navigator.pop(context),
                        child: const Text("No")),
                    ],
                  ),
                );
              },
              child: const Icon(Icons.delete, size: 35.0)))
      ]),
      body: SingleChildScrollView(child: Center(child: Center(
            child: Column(children: [Column(children: [
                    Container(width: 65, height: 65),
                    Container(width: 250, height: 250, child: Image.network(product.imageUrl),
                    ),
                    Container(width: 35, height: 35),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [Text("Name:"), Text(product.name)]),
                    Container(width: 35, height: 35),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [Text("Price:"), Text(product.price.toString())
                        ]),
                    Container(width: 35, height: 35),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [Text("Size:"), Text(product.size)]),
                    Container(width: 35, height: 35),
                  ],
                ),
                Text(product.description),
              ],
            ),
          ),
        ),
      ),
    );
  }
}