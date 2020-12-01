import 'package:flutter/material.dart';
import 'package:sneak_shoes_app/size_config.dart';

import '../../../immutable.dart';

class Filters extends StatefulWidget {
  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  RangeValues _currentRange = RangeValues(10, 300);
  int _selectedGender = 0;
  int _selectedBrand = 0;
  int _selectedColor = 0;

  List gender = ["Men", "Women"];

  List brandLogo = [
/*     "assets/brand_logo/adidas.png",
 */
    "assets/brand_logo/new_balance.png",
    /* "assets/brand_logo/nike.png",
    "assets/brand_logo/reebook.png", */
    "assets/brand_logo/puma.png",
    "assets/brand_logo/umbro.png"
  ];

  List<Color> brandColor = [
    Colors.blueAccent,
    Colors.cyanAccent,
    Colors.deepPurpleAccent,
    Colors.lightBlue,
    Colors.black38,
    Colors.tealAccent,
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Container(
        height: (SizeConfig.orientation == Orientation.portrait)
            ? SizeConfig.defaultSize * 50
            : SizeConfig.defaultSize * 30,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),

                  //filters text
                  Text(
                    "Filters",
                    style: TextStyle(
                      fontFamily: "Averta",
                      fontSize: 50,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),

                  //gender
                  Column(
                    children: <Widget>[
                      Text(
                        "Gender",
                        style: TextStyle(
                          fontFamily: "Averta",
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50.0, top: 10.0),
                        child: SizedBox(
                          height: 60,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: gender.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedGender = index;
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(
                                    top: 10.0,
                                    right: 5.0,
                                  ),
                                  width: 130,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: (_selectedGender == index)
                                          ? blackColor
                                          : secondaryColor,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.transparent,
                                  ),
                                  child: Center(
                                    child: Text(
                                      gender[index],
                                      style: TextStyle(
                                        color: (_selectedGender == index)
                                            ? blackColor
                                            : secondaryColor,
                                        fontFamily: "Averta",
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  //price
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "Price",
                          style: TextStyle(
                            fontFamily: "Averta",
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      RangeSlider(
                        activeColor: blackColor,
                        divisions: 5,
                        min: 0,
                        max: 500,
                        values: _currentRange,
                        labels: RangeLabels(
                          _currentRange.start.round().toString(),
                          _currentRange.end.round().toString(),
                        ),
                        onChanged: (RangeValues rangeValues) {
                          setState(() {
                            _currentRange = rangeValues;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  //brand
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "Brand",
                          style: TextStyle(
                            fontFamily: "Averta",
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 60.0,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          primary: false,
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemCount: brandLogo.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedBrand = index;
                                });
                              },
                              child: Container(
                                width: 60.0,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: (index != _selectedBrand)
                                      ? secondaryColor
                                      : blackColor,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Image.asset(
                                    brandLogo[index],
                                    fit: BoxFit.contain,
                                    color: (index == _selectedBrand)
                                        ? secondaryColor
                                        : blackColor,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  //color
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Color",
                          style: TextStyle(
                            fontFamily: "Averta",
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: brandColor.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedColor = index;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: ClipOval(
                                  child: Container(
                                    width: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: (_selectedColor == index)
                                            ? blackColor
                                            : Colors.transparent,
                                        width: 3.0,
                                      ),
                                      borderRadius: BorderRadius.circular(50.0),
                                      color: brandColor[index],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
