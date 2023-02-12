// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fruits_shop/models/cart_model_class.dart';
import 'package:fruits_shop/ui_components/fruit_card_widget.dart';
import 'package:provider/provider.dart';

import 'cart_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => CartModelClass(),
    child: MaterialApp(
      home: MyApp(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // List<CartModelClass>list = CartModelClass().getfruitList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              color: Colors.teal,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  return CartPage();
                })));
              },
              icon: const Icon(
                Icons.shopping_bag_outlined,
                size: 30,
              ))
        ],
        backgroundColor: Colors.grey[50],
        title: Text(
          'Fruits',
          style: TextStyle(fontSize: 22, color: Colors.teal),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Consumer<CartModelClass>(
        builder: (context, value, child) {
          return ListView.builder(
              itemCount: value.getfruitList.length,
              itemBuilder: ((context, index) {
                return FruitCard(
                  fruitName: value.getfruitList[index][0],
                  friutPrice: value.getfruitList[index][1],
                  fruitImage: value.getfruitList[index][2],
                  onTapFunc: () {
                    Provider.of<CartModelClass>(context, listen: false)
                        .addItemsToCart(index);
                  },
                );
              }));
        },
      ),
    );
  }
}
