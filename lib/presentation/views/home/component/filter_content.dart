import 'package:flutter/material.dart';
import 'package:sneak_shoes_app/presentation/resources/colors_manager.dart';

class FilterMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          //STRIP ON TOP
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            width: 50,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(20),
            ),
          ),

          //TITLE
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              "Filters",
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  .apply(fontSizeDelta: 10),
            ),
          ),

          //GENDER
          Column(
            children: <Widget>[
              Title(title: 'Gender'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'MAN',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'WOMEN',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),

          //PRICE
          Column(
            children: <Widget>[
              Title(title: 'Price'),
              RangeSlider(
                min: 0,
                max: 500,
                divisions: 5,
                values: RangeValues(40, 80),
                activeColor: ColorManager.dark,
                onChanged: (rangeValues) {},
              ),
            ],
          ),
          SizedBox(height: 20),

          //LIST BRANDS
          Column(
            children: <Widget>[
              Title(title: 'Brand'),
              SizedBox(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  primary: false,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 60.0,
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: ColorManager.dark,
                          width: 1.5,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          'assets/brand_logo/adidas.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 20),

          //List of Colors
          Column(
            children: <Widget>[
              Title(title: 'Colors'),
              SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        SizedBox(width: 20),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorManager.brown,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  final String title;

  const Title({
    Key key,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Text(title, style: Theme.of(context).textTheme.bodyText1),
    );
  }
}
