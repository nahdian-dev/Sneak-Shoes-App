import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImagesSlider extends StatefulWidget {
  @override
  _ImagesSliderState createState() => _ImagesSliderState();
}

class _ImagesSliderState extends State<ImagesSlider> {
  int _current = 0;
  List imgList, imageSliders;

  @override
  void initState() {
    super.initState();

    imgList = [
      'assets/shoes_img/nike_air_max_270/1.png',
      'assets/shoes_img/nike_air_max_270/2.png',
      'assets/shoes_img/nike_air_max_270/3.png',
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
          children: imgList.map((url) {
            int index = imgList.indexOf(url);
            return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                      ? Color.fromRGBO(0, 0, 0, 0.9)
                      : Color.fromRGBO(0, 0, 0, 0.4),
                ));
          }).toList(),
        ),
        SizedBox(height: 25),
      ],
    );
  }
}
