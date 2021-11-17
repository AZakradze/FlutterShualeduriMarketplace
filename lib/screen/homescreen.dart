import 'package:flutter/material.dart';
import 'package:shualedurialeksandrezakradze/data/model/dummymodeldata.dart';
import 'package:shualedurialeksandrezakradze/data/model/clothesmodel.dart';
import 'package:shualedurialeksandrezakradze/data/repository/helper.dart';
import 'package:shualedurialeksandrezakradze/widget/mainitem.dart';
import 'addscreen.dart';
import 'editscreen.dart';
import 'detailmarketscreen.dart';

class homescreen extends StatefulWidget {
  @override _HomeScreenState createState()=>_HomeScreenState();
}
List<Clothes> clothesList = DUMMY_DATA;
void getRecentlyAdded() {List<Clothes> mList = [];
  mList = DUMMY_DATA.where((element)=>element.size == "RecentlyAdded").toList();
  clothesList = mList;
}
void getMyFavorites() {List<Clothes> mList = [];
  mList = DUMMY_DATA.where((element)=>element.size == "MyFavorites").toList();
  clothesList = mList;
}
void reset() {clothesList = DUMMY_DATA;
}
class _HomeScreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(centerTitle: true, title: const Text('MARKETPLACE'),
      ),

      body: GridView.builder(gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 360,
            childAspectRatio: 0.75,
            crossAxisSpacing: 35,
            mainAxisSpacing: 35),
        itemBuilder: (ctx, index) {var product = clothesList[index];
          return Dismissible(background: Container(
              alignment: Alignment.centerRight,
              color: Colors.cyan,
              child: const Icon(Icons.delete, color: Colors.white),
            ),

            child: GestureDetector(onTap:()=>Navigator.pushNamed(context,
                clothesdetailsscreen.routeName,
                arguments: product),
              onLongPress: () {Navigator.pushNamed(context,
                editclothesscreen.routeName,
                arguments: {"product": product, "index": index},
                ).then((_) {setState(() {});
                });
              },
              child: MainListItem(imageUrl: product.imageUrl,
                  title: product.name,
                  size: product.size,
                  price: product.price),
            ),
            key: UniqueKey(),
            direction: DismissDirection.endToStart,
            confirmDismiss:(direction)=>showDialog(context: context,
              builder:(_)=>AlertDialog(title: const Text("Do you want to remove this product?"),
                actions: [TextButton(onPressed: () {setState(() {
                  productrepository().deleteproduct(product.id);
                  Navigator.pop(context);
                });
                },
                    child: const Text("Yes")),
                  TextButton(onPressed:()=>Navigator.pop(context),
                    child: const Text("No"),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: clothesList.length,
      ),

      floatingActionButton: FloatingActionButton(onPressed:()=>Navigator.pushNamed(context,
          addclothesscreen.routeName).then((_) {setState(() {});
            }),

        child: const Icon(Icons.add),
      ),
    );
  }
}