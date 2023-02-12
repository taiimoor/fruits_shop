// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fruits_shop/models/cart_model_class.dart';

class FruitCard extends StatelessWidget {
  String fruitName;
  String friutPrice;
  String fruitImage;
  void Function()? onTapFunc;

  FruitCard({
    Key? key,
    required this.fruitName,
    required this.friutPrice,
    required this.fruitImage,
    this.onTapFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: size.height / 6,
        width: size.width,
        decoration: const BoxDecoration(
          color: Color.fromARGB(25, 4, 0, 255),
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(22)),
                child: Image(
                    fit: BoxFit.cover,
                    height: size.height / 6 / 1,
                    width: size.width / 4,
                    image: AssetImage(fruitImage)),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      fruitName,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: size.height / 7 / 2,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          shape: (const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          )),
                          backgroundColor: Colors.green,
                          shadowColor: Colors.green[300],
                          elevation: 6,
                        ),
                        onPressed: onTapFunc,
                        child: Text('\$ $friutPrice',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500)),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
