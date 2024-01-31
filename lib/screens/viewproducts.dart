import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement_3c/models/product.dart';
import 'package:statemanagement_3c/providers/productprovider.dart';
import 'package:statemanagement_3c/screens/manageproduct.dart';

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
          var products = provider.items;
          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemBuilder: (_, index) {
              return Card(
                child: ListTile(
                  onTap: () => openEditScreen(context, index),
                  leading: IconButton(
                    onPressed: () => changeFavorite(context, index),
                    icon: Icon(products[index].isFavorite
                        ? Icons.favorite
                        : Icons.favorite_outline),
                  ),
                  title: Text(products[index].nameDesc),
                  trailing: IconButton(
                      onPressed: null, icon: Icon(Icons.shopping_cart)),
                ),
              );
            },
            itemCount: provider.totalNoItems,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.shopping_cart_checkout),
      ),
    );
  }
}
