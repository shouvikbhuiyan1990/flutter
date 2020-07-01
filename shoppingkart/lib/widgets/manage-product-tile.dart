import 'package:flutter/material.dart';

class ManageProductTile extends StatelessWidget {
  final String productImage;
  final String productTitle;

  ManageProductTile(
    this.productImage,
    this.productTitle,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          width: 40.0,
          height: 40.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(productImage),
            ),
          ),
        ),
        title: Text(productTitle),
        trailing: Container(
          width: 100,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
