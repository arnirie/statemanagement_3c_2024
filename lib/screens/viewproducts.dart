import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement_3c/models/product.dart';
import 'package:statemanagement_3c/providers/productprovider.dart';
import 'package:statemanagement_3c/screens/manageproduct.dart';

class ViewProductsScreen extends StatelessWidget {
  ViewProductsScreen({super.key});

  // List<Product> listProducts = [
  //   Product(productCode: 'AB1', nameDesc: 'iPhone15', price: 56000),
  //   Product(productCode: 'ET1', nameDesc: 'Samsung Galaxy', price: 35000),
  //   Product(productCode: 'ET2', nameDesc: 'Samsung Galaxy2', price: 5000),
  // ];

  // void addProduct(Product p) {
  //   setState(() {
  //     listProducts.add(p);
  //   });
  // }

  // void editProduct(Product p, int index) {
  //   // listProducts[index].nameDesc = p.nameDesc;
  //   // listProducts[index].price = p.price;
  //   listProducts[index] = p;
  //   setState(() {});
  // }

  // void openAddScreen() {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (_) => ManageProductScreen(
  //         add: addProduct,
  //       ),
  //     ),
  //   );
  // }

  // void openEditScreen(Product p, int index) {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (_) => ManageProductScreen(
  //         edit: editProduct,
  //         product: p,
  //         index: index,
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Products'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
              onPressed: () {
                var provider = Provider.of<Products>(context, listen: false);
                provider.add(Product(
                    productCode: 'productCode',
                    nameDesc: 'nameDesc',
                    price: 500));
              },
              icon: Icon(Icons.add)),
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
                  onTap: null,
                  title: Text(products[index].nameDesc),
                ),
              );
            },
            itemCount: provider.totalNoItems,
          );
        },
      ),
    );
  }
}
