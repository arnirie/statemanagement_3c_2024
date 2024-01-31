import 'package:flutter/material.dart';
import 'package:statemanagement_3c/models/product.dart';
import 'package:gap/gap.dart';

class ManageProductScreen extends StatefulWidget {
  ManageProductScreen(
      {super.key, this.add, this.edit, this.product, this.index});

  final Function(Product p)? add;
  final Function(Product p, int index)? edit;
  Product? product;
  int? index;

  @override
  State<ManageProductScreen> createState() => _ManageProductScreenState();
}

class _ManageProductScreenState extends State<ManageProductScreen> {
  var codeController = TextEditingController();

  var nameController = TextEditingController();

  var priceController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //set text controller
    if (widget.product != null) {
      codeController.text = widget.product!.productCode;
      nameController.text = widget.product!.nameDesc;
      priceController.text = widget.product!.price.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product == null ? 'Add Product' : 'Edit Product'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView(
          children: [
            TextField(
              controller: codeController,
              readOnly: widget.product != null,
              decoration: InputDecoration(
                label: const Text('Product Code'),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                label: const Text('Name/Desc'),
                border: OutlineInputBorder(),
              ),
            ),
            // Gap(12),
            const SizedBox(
              height: 12,
            ),
            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                label: const Text('Price'),
                border: OutlineInputBorder(),
              ),
            ),
            const Gap(12),
            ElevatedButton(
              onPressed: () {
                var p = Product(
                  productCode: codeController.text,
                  nameDesc: nameController.text,
                  price: double.parse(priceController.text),
                );
                if (widget.product == null) {
                  widget.add!(p);
                } else {
                  widget.edit!(p, widget.index!);
                }

                Navigator.of(context).pop();
              },
              child: Text(widget.product == null ? 'ADD' : 'EDIT'),
            ),
          ],
        ),
      ),
    );
  }
}
