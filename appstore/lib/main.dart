import 'package:appstore/data/product.dart';
import 'package:appstore/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    double highScreen = MediaQuery.of(context).size.height;

    return MaterialApp(
      title: "Electrical Store",
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 33, 158, 188),
        ),
      ),
      localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale("ar"), Locale("en")],
      locale: Locale("ar"),
      home: Scaffold(
        appBar: AppBar(title: Text("الشاشة الرئيسية")),
        backgroundColor: Colors.blue,
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: double.infinity,
                  height: highScreen * 0.78,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 236, 236, 236),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return BoxST(
                    id: products[index].id,
                    image: products[index].image,
                    title: products[index].title,
                    suptitle: products[index].subTitle,
                    price: products[index].price,
                    description: products[index].description,
                  );
                },
                itemCount: products.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BoxST extends StatelessWidget {
  const BoxST({
    super.key,
    required this.image,
    required this.title,
    required this.suptitle,
    required this.price,
    required this.id,
    required this.description,
  });
  final String image;
  final String title;
  final String suptitle;
  final int price;
  final int id;
  final String description;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Details(
              id: id,
              price: price,
              title: title,
              description: description,
            ),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            width: 320,
            height: 165,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.4),
                  offset: Offset(3, 3),
                  blurRadius: 8,
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 10,
                  left: 10,
                  child: SizedBox(
                    height: 120,
                    width: 150,

                    child: Image.asset(image, fit: BoxFit.contain),
                  ),
                ),
                Positioned(
                  top: 15,
                  right: 19,
                  child: SizedBox(
                    width: 140,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(fontSize: 19, color: Colors.black),
                        ),
                        Text(
                          suptitle,
                          style: TextStyle(
                            color: Colors.black.withValues(alpha: 0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ), 
          SizedBox(height: 7),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 35),
              Container(
                width: 100,
                height: 28,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 243, 205, 33),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 10.0,
                    top: 3,
                    bottom: 5,
                  ),
                  child: Text("السعر:  $price"),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
