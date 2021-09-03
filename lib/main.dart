import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 38,
                margin: EdgeInsets.only(left: 20, top: 32, right: 20, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.network('https://flutter4fun.com/wp-content/uploads/2021/09/menu.png'),
                    Text('Besom.', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800)),
                    Image.network('https://flutter4fun.com/wp-content/uploads/2021/09/bag.png')
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: ListView.builder(
                    padding: EdgeInsets.all(20),
                    itemBuilder: (context, index) {
                      return JuiceWidget(juiceList[index]);
                    },
                    itemCount: juiceList.length,
                  ),
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
              child: Container(
                color: Colors.white.withOpacity(0.2),
                height: 64,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 18.0, sigmaY: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.network('https://flutter4fun.com/wp-content/uploads/2021/09/Home.png'),
                      Image.network('https://flutter4fun.com/wp-content/uploads/2021/09/Search.png'),
                      Image.network('https://flutter4fun.com/wp-content/uploads/2021/09/Heart.png'),
                      Image.network('https://flutter4fun.com/wp-content/uploads/2021/09/account.png'),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color textColor;

  MyButton({
    Key? key,
    required this.text,
    this.bgColor = Colors.white,
    this.textColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w700,
          fontSize: 12,
        ),
      ),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
        primary: bgColor,
      ),
    );
  }
}

final juiceList = [
  JuiceEntity(
    name: 'Besom Yellow Juice',
    image: 'https://flutter4fun.com/wp-content/uploads/2021/09/juice1.png',
    price: '19.99',
    color: Color(0xFFF3BE39),
  ),
  JuiceEntity(
    name: 'Besom Orange Juice',
    image: 'https://flutter4fun.com/wp-content/uploads/2021/09/juice2.png',
    price: '25.99',
    color: Color(0xFFDC691F),
  ),
];

class JuiceEntity {
  final String name;
  final String image;
  final String price;
  final Color color;

  JuiceEntity({
    required this.name,
    required this.image,
    required this.price,
    required this.color,
  });
}

class JuiceWidget extends StatelessWidget {
  final JuiceEntity juice;

  const JuiceWidget(this.juice);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );
    return AspectRatio(
      aspectRatio: 1.25,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final topPadding = constraints.maxHeight * 0.2;
          final leftPadding = constraints.maxWidth * 0.1;
          final imageWidth = constraints.maxWidth * 0.35;
          return Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: topPadding),
                decoration: BoxDecoration(color: juice.color, borderRadius: BorderRadius.circular(24)),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            juice.name,
                            style: textStyle.copyWith(fontSize: 20),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '\$',
                                  style: textStyle.copyWith(fontSize: 16),
                                ),
                                TextSpan(
                                  text: juice.price,
                                  style: textStyle.copyWith(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 32,
                            width: 80,
                            child: MyButton(
                              text: 'Buy Now',
                              textColor: juice.color,
                            ),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.only(
                        top: topPadding,
                        left: leftPadding,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: imageWidth,
                    child: Image.network(juice.image),
                  )
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
