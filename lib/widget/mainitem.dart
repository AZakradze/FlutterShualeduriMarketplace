import 'package:flutter/material.dart';

class MainListItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String size;
  final double price;

  MainListItem({
    required this.imageUrl,
    required this.title,
    required this.size,
    required this.price,
  });
  @override Widget build(BuildContext context) {
    return Card(child: Container(padding: EdgeInsets.all(10),
        child: Column(children: [Container(
              child: FadeInImage(width: 200, height: 200, fit: BoxFit.cover,
                placeholder: AssetImage("assets/images/clothes_placeholder.png"),
                image: NetworkImage(imageUrl),
              ),
            ),
            Container(width: 30, height: 30),
            Align(alignment: Alignment.center, child: Text(title)),
            Align(alignment: Alignment.center, child: Text(price.toString()),
            )
          ],
        ),
      ),
    );
  }
}