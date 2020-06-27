import 'package:flutter/material.dart';

import '../widgets/product-list-grid.dart';

enum FilterOptions { FilteredItem, AllItems }

class ProdctListing extends StatefulWidget {
  @override
  _ProdctListingState createState() => _ProdctListingState();
}

class _ProdctListingState extends State<ProdctListing> {
  bool _isFavouriteSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Listing'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selctedItem) {
              setState(() {
                if (selctedItem == FilterOptions.FilteredItem) {
                  _isFavouriteSelected = true;
                } else if (selctedItem == FilterOptions.AllItems) {
                  _isFavouriteSelected = false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (ctx) => [
              PopupMenuItem(
                child: Text('Show Only Favourites'),
                value: FilterOptions.FilteredItem,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.AllItems,
              ),
            ],
          ),
        ],
      ),
      body: ProductListGrid(_isFavouriteSelected),
    );
  }
}
