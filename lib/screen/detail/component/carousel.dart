import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sneak_shoes_app/models/products.dart';

class Carousel extends StatefulWidget {
  const Carousel({
    Key key,
    this.dataContent,
  }) : super(key: key);

  final DataContent dataContent;

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _current = 0;
  List imgList, imageSliders;

  @override
  void initState() {
    super.initState();

    imgList = [
      widget.dataContent.img,
      widget.dataContent.img2,
      widget.dataContent.img3,
    ];

    imageSliders = imgList
        .map((item) => Image.asset(
              item,
              height: 400,
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        CarouselSlider(
          items: imageSliders,
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 2.0,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.map(
            (url) {
              int index = imgList.indexOf(url);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape:
                      _current == index ? BoxShape.circle : BoxShape.rectangle,
                  color: _current == index
                      ? Color.fromRGBO(0, 0, 0, 0.9)
                      : Color.fromRGBO(0, 0, 0, 0.4),
                ),
              );
            },
          ).toList(),
        ),
        SizedBox(height: 25),
      ],
    );
  }
}
