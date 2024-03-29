import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement_3c/helpers/dbhelper.dart';
import 'package:statemanagement_3c/models/cartitem.dart';
import 'package:statemanagement_3c/models/product.dart';
import 'package:statemanagement_3c/providers/cartprovider.dart';
import 'package:statemanagement_3c/providers/productprovider.dart';
import 'package:statemanagement_3c/screens/manageproduct.dart';
import 'package:statemanagement_3c/screens/viewcart.dart';

class ViewProductsScreen extends StatelessWidget {
  ViewProductsScreen({super.key});

  void openAddScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ManageProductScreen(),
      ),
    );
  }

  void openEditScreen(BuildContext context, int index) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ManageProductScreen(
          index: index,
        ),
      ),
    );
  }

  void changeFavorite(BuildContext context, int index) {
    Provider.of<Products>(context, listen: false).toggleFavorite(index);
  }

  void openShoppingCart(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => ViewCartScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Products'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
              onPressed: () => openAddScreen(context), icon: Icon(Icons.add)),
        ],
      ),
      body: Consumer<Products>(
        builder: (_, provider, child) {
          return FutureBuilder(
            future: provider.items,
            builder: (context, snapshot) {
              //not yet ready
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              //ready but not records
              if (snapshot.data == null || snapshot.data!.isEmpty) {
                return Center(
                  child: Text('No records found'),
                );
              }
              //ready
              var prodList = snapshot.data!;
              return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemBuilder: (_, index) {
                  return Card(
                    child: ListTile(
                      onTap: () => openEditScreen(context, index),
                      leading: IconButton(
                        onPressed: () => changeFavorite(context, index),
                        icon: Icon(prodList[index].isFavorite
                            ? Icons.favorite
                            : Icons.favorite_outline),
                      ),
                      title: Text(prodList[index].nameDesc),
                      trailing: IconButton(
                        onPressed: () {
                          Provider.of<CartItems>(context, listen: false)
                              .add(CartItem(
                            productCode: prodList[index].productCode,
                          ));
                        },
                        icon: Icon(Icons.shopping_cart),
                      ),
                    ),
                  );
                },
                itemCount: prodList.length,
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => openShoppingCart(context),
        child: Icon(Icons.shopping_cart_checkout),
      ),
    );
  }
}
