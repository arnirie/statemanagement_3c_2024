import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement_3c/providers/cartprovider.dart';
import 'package:statemanagement_3c/providers/productprovider.dart';
import 'package:statemanagement_3c/screens/viewproducts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ActivityApp());
}

class ActivityApp extends StatelessWidget {
  const ActivityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Products(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartItems(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ViewProductsScreen(),
      ),
    );
  }
}
