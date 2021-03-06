import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:provider/provider.dart';

import '../widgets/app-drawer.dart';
import '../provider/cart.dart';
import '../provider/productDetails.dart';
import '../screens/cart-details-screen.dart';
import '../widgets/product-list-grid.dart';

enum FilterOptions { FilteredItem, AllItems }

class ProdctListing extends StatefulWidget {
  @override
  _ProdctListingState createState() => _ProdctListingState();
}

class _ProdctListingState extends State<ProdctListing> {
  bool _isFavouriteSelected = false;
  bool _isInitiated = false;
  bool _setLoader = false;

  @override
  void didChangeDependencies() {
    if (!_isInitiated) {
      setState(() {
        _setLoader = true;
      });
      final productProvider = Provider.of<ProductDetails>(context);
      productProvider.getAllProductsApi.then((value) {
        setState(() {
          _setLoader = false;
        });
      });
    }
    _isInitiated = true;
    super.didChangeDependencies();
  }

  Future<void> _onPullRefresh(ctx) async {
    await Provider.of<ProductDetails>(ctx, listen: false).getAllProductsApi;
  }

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
          Consumer<Cart>(
            builder: (_, cart, child) {
              return Padding(
                padding: EdgeInsets.only(right: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      CartDetails.routeName,
                    );
                  },
                  child: Badge(
                    borderRadius: 10,
                    position: BadgePosition.topLeft(
                      top: 4,
                      left: 12,
                    ),
                    badgeContent: Text(
                      cart.getTotalCartLengthQuantity.toString(),
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                    child: Icon(Icons.shopping_cart),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: _setLoader
          ? Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: () => _onPullRefresh(context),
              child: ProductListGrid(_isFavouriteSelected),
            ),
      drawer: AppDrawer(),
    );
  }
}
