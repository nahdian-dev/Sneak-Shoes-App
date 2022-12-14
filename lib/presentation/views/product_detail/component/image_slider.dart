import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneak_shoes_app/presentation/resources/colors_manager.dart';
import 'package:sneak_shoes_app/providers/products.dart';

class ImageSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Products _product = Provider.of<Products>(context);
    var productId = ModalRoute.of(context).settings.arguments;

    List<String> _imagesList = _product.getById(productId).images;

    _product.imagesSlider = _imagesList;

    return Consumer<Products>(
      builder: (context, value, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            // IMAGES
            CarouselSlider(
              items: _product.imageSlider,
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  _product.selectedImage = index;
                },
              ),
            ),
            SizedBox(height: 10),

            // DOT INDICATOR
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _imagesList.map((url) {
                int index = _imagesList.indexOf(url);

                return Container(
                    width: 8.0,
                    height: 8.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (_product.selectedImage == index)
                          ? ColorManager.dark
                          : Colors.grey,
                    ));
              }).toList(),
            ),
            SizedBox(height: 25),
          ],
        );
      },
    );
  }
}
