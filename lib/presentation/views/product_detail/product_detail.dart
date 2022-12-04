import 'package:flutter/material.dart';
import 'package:sneak_shoes_app/presentation/resources/colors_manager.dart';

class ProductDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: ColorManager.primary,
              expandedHeight: 300,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                color: ColorManager.dark,
                iconSize: 22.0,
                onPressed: () {},
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.more_vert),
                  color: ColorManager.dark,
                  onPressed: () {},
                ),
              ],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              // flexibleSpace: FlexibleSpaceBar(
              //   background: Carousel(
              //     productController: productController,
              //     arguments: arguments,
              //   ),
              // ),
            ),
            // ContentProductDetail(
            //   productController: productController,
            //   arguments: arguments,
            // ),
          ],
        ),
      ),
      // bottomNavigationBar: Container(
      //   height: 120,
      //   child: ButtonCart(),
      // ),
    );
  }
}

// class ContentProductDetail extends StatelessWidget {
//   const ContentProductDetail({
//     Key key,
//     @required this.productController,
//     @required this.arguments,
//   }) : super(key: key);

//   final ProductController productController;
//   final arguments;

//   @override
//   Widget build(BuildContext context) {
//     return SliverList(
//       delegate: SliverChildListDelegate([
//         //logo
//         Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Image.asset(
//             productController.listProduct[arguments].logo,
//             height: (SizeConfig.orientation == Orientation.landscape) ? 50 : 80,
//           ),
//         ),

//         //description
//         Column(
//           children: <Widget>[
//             Text(
//               productController.listProduct[arguments].title,
//               style: getPrimaryFont(
//                 fontSize: 26,
//               ),
//             ),
//             SizedBox(height: 14),
//             Text(
//               "\$ ${productController.listProduct[arguments].price.toStringAsFixed(0)}",
//               style: getSecondaryFont(
//                 fontSize: 22,
//               ),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: 20,
//         ),

//         //size
//         BrandSize(),
//         SizedBox(
//           height: 20,
//         ),
//       ]),
//     );
//   }
// }
