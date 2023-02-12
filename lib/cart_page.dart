// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:fruits_shop/main.dart';
import 'package:fruits_shop/models/cart_model_class.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.teal, //change your color here
          ),
          elevation: 0.0,
          backgroundColor: Colors.grey[50],
          title: Text(
            'Cart',
            style: TextStyle(fontSize: 22, color: Colors.teal),
          ),
          centerTitle: true,
        ),
        body: Consumer<CartModelClass>(
          builder: (context, value, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    color: Colors.grey[50],
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 12),
                          child: Text(
                            'Items',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Divider(
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    )),
                Expanded(
                  child: ListView.builder(
                      itemCount: value.getCartList.length,
                      itemBuilder: ((context, index) {
                        // log('$value -- ${value.getCartList[index].length}');
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 18.0, vertical: 12),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            tileColor: Colors.grey[300],
                            leading: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              child: Image.asset(value.getCartList[index][2],
                                  height: 100,
                                  width: size.width / 7,
                                  fit: BoxFit.cover),
                            ),
                            title: Text(
                              value.getCartList[index][0],
                              style: TextStyle(fontSize: 18),
                            ),
                            subtitle: Text(
                              '\$ ' + value.getCartList[index][1],
                              style: TextStyle(fontSize: 16),
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                Provider.of<CartModelClass>(context,
                                        listen: false)
                                    .removeItemsFromCart(index);
                              },
                              icon: const Icon(Icons.cancel),
                            ),
                          ),
                        );
                      })),
                ),
                Container(
                    height: size.height / 7,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 14, 108, 99),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),
                            child: (value.getCartList.length >= 1)
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: <Widget>[
                                      Text(
                                        'Total Price',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '\$' + value.calculateTotalPrice(),
                                        style: TextStyle(
                                            fontSize: 22,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )
                                : Text(
                                    'No Items Selected.',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                          ),
                          (value.getCartList.length >= 1)
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: size.height / 12,
                                    width: size.width / 5,
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        shape: (RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: 2,
                                              color: Color.fromARGB(
                                                  255, 25, 201, 183)),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        )),
                                      ),
                                      onPressed: () {},
                                      child: Text('\$ Pay',
                                          style: TextStyle(
                                            fontSize: 18,
                                          )),
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: size.height / 12,
                                    width: size.width / 2.5,
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        shape: (RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: 2,
                                              color: Color.fromARGB(
                                                  255, 25, 201, 183)),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        )),
                                      ),
                                      onPressed: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: ((context) {
                                          return MyApp();
                                        })));
                                      },
                                      child: Text('Select Items >>',
                                          style: TextStyle(
                                            fontSize: 18,
                                          )),
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    )),
              ],
            );
          },
        ));
  }
}
