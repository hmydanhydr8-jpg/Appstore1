import 'package:appstore/data/product.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details({
    super.key,
    required this.id,
    required this.price,
    required this.title,
    required this.description,
  });
  final int id;
  final int price;
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    double highScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color.fromARGB(244, 255, 255, 255)),
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(244, 255, 255, 255),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                width: double.infinity,
                height: highScreen * 0.58,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 15,
                            spreadRadius: 2,
                            offset: Offset(0, 5),
                            color: Colors.black26,
                          ),
                        ],
                      ),
                      child: Image.asset(products[id].image),
                    ),
                    SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleST(Colors.grey),
                        SizedBox(width: 10),
                        CircleSmall(const Color.fromARGB(255, 47, 33, 243)),
                        SizedBox(width: 10),
                        CircleSmall(Colors.red),
                      ],
                    ),

                    SizedBox(height: 10),
                    Text(title, style: TextStyle(fontSize: 30)),
                    SizedBox(height: 15),
                    Container(
                      width: 120,
                      height: 38,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 243, 205, 33),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 13.0,
                          top: 8,
                          bottom: 5,
                        ),
                        child: Text(
                          "السعر:  $price",
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              description,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class CircleSmall extends StatelessWidget {
  const CircleSmall(this.color, {super.key});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(40),
      ),
    );
  }
}

class CircleST extends StatelessWidget {
  const CircleST(this.color, {super.key});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 23,
          height: 23,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: color, width: 2),
          ),
        ),
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      ],
    );
  }
}
