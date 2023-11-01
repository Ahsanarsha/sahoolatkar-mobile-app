import 'package:badges/badges.dart'as badges;
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:saholatkar/const/theme.dart';
import 'package:saholatkar/controller/Promotions/PromotionsController.dart';
import 'package:saholatkar/view/Promotions/components/promotion_by_brands.dart';

import '../../controller/Product/Product_controller.dart';
import '../../controller/add_to_cart/AddToCartController.dart';
import '../Cart/cart_screen.dart';
import 'components/build_promotions.dart';
import 'filter/filter_widget.dart';

class PromotionScreen extends StatefulWidget {
  const PromotionScreen({Key? key}) : super(key: key);

  @override
  State<PromotionScreen> createState() => _PromotionScreenState();
}

class _PromotionScreenState extends State<PromotionScreen> {
  bool isopen = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: GetBuilder<PromotionController>(
          init: PromotionController(),
          id: 'PromotionScreen',
          builder: (controller) =>
              WillPopScope(
                    onWillPop: ()async{

                      setState(() {
                        if(controller.isopen){

                          controller.isopen = false;
                        }
                      });
                      return controller.isopen;
                    },
                child: DefaultTabController(
                length: controller.allBrands.data == null ? 1 : controller.allBrands.data!.length + 1,
                child: Scaffold(
                  body: SafeArea(
                    child: Stack(
                      children: [
                        Scaffold(
                          floatingActionButton: FloatingActionButton(
                            backgroundColor: loginButtonColor,
                            child: _shoppingCartBadge(),
                            onPressed: () {
                              Get.to(() => CartScreen());
                            },
                          ),
                          appBar: AppBar(
                            iconTheme: const IconThemeData(color: Colors.black),
                            bottom: TabBar(
                              isScrollable: true,
                              unselectedLabelColor: formTextColor,
                              labelColor: Colors.black,
                              tabs:
                               [
                                const Tab(
                                  text: "All",
                                ),
                                 if(controller.allBrands.data != null)
                                for(var items in controller.allBrands.data!)
                                  Tab(
                                    text: items.title,
                                  ),
                              ],
                            ),
                            title: const Text(
                              "Promotions",
                              style: TextStyle(color: Colors.black),
                            ),
                            actions: [
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (controller.isopen == true) {
                                        controller.isopen = false;
                                      } else {
                                        controller.isopen = true;
                                      }
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: controller.isopen == true
                                        ? const Icon(Icons.clear)
                                        : SvgPicture.asset(
                                        "assets/svg_icons/vector_filter.svg",
                                        width: 17.91,
                                        height: 17.91,
                                        // color: Colors.black,
                                        semanticsLabel: 'filter'),
                                  ))
                            ],
                            backgroundColor: Colors.white,
                          ),
                          body:  TabBarView(
                            children: [
                              const BuildPromotions(),
                              if(controller.allBrands.data != null)
                              for(var i = 0; i < controller.allBrands.data!.length; i++)
                                PromotionsByBrands(brandName: controller.allBrands.data![i].title.toString()),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 60),
                          child: Align(
                              alignment: Alignment.topRight, child: controller.isopen ? MyFilter(isopen: controller.isopen) : SizedBox(),
                        ),)
                      ],
                    ),
                  ),
                )),
              ),
        ),
    );
  }
  Widget _shoppingCartBadge() {
    return GetBuilder<AddToCartController>(builder: (c) {
      return badges.Badge(
        position: BadgePosition.topEnd(top: 0, end: 3),
        animationDuration: Duration(milliseconds: 300),
        animationType: BadgeAnimationType.slide,
        badgeContent: Text(
         c.cartItem.toString(),
          style: const TextStyle(color: Colors.white),
        ),
        child: IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Get.to(() => CartScreen());
            }),
      );
    });
  }
  // Widget filter(isopen) {
  //   return isopen
  //       ? GetBuilder<PromotionController>(
  //         init: PromotionController(),
  //         builder: (controller)=> Container(
  //             width: MediaQuery.of(context).size.width / 1.4,
  //             height: MediaQuery.of(context).size.height / 1,
  //             decoration: BoxDecoration(
  //               color: Colors.white,
  //               borderRadius: const BorderRadius.only(
  //                 topLeft: Radius.circular(20.0),
  //               ),
  //               boxShadow: [
  //                 BoxShadow(
  //                   color: Colors.grey.withOpacity(0.5), //color of shadow
  //                   spreadRadius: 5, //spread radius
  //                   blurRadius: 7, // blur radius
  //                   offset: const Offset(0, 2), // changes position of shadow
  //                   //first paramerter of offset is left-right
  //                   //second parameter is top to down
  //                 )
  //               ],
  //             ),
  //             child: SingleChildScrollView(
  //                 child: Column(
  //               children: [
  //                 Container(
  //                   alignment: Alignment.topLeft,
  //                   padding:
  //                       const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
  //                   child: Text(
  //                     "Price",
  //                     style: GoogleFonts.roboto(textStyle: productTitle)
  //                         .copyWith(color: HexColor("414141")),
  //                     maxLines: 1,
  //                     overflow: TextOverflow.ellipsis,
  //                   ),
  //                 ),
  //                 Center(
  //                   child: SizedBox(
  //                     child: SfRangeSlider(
  //                       activeColor: Colors.red,
  //                       inactiveColor: Colors.red[100],
  //                       min: _min,
  //                       max: _max,
  //                       values: _values,
  //                       interval: 5000,
  //                       showLabels: true,
  //                       onChangeEnd: (SfRangeValues value)async{
  //                        await controller.getPromotionsByPrice(value.start, value.end);
  //                        setState(() {
  //                          isopen = false;
  //                        });
  //                       },
  //                       onChanged: (SfRangeValues value) {
  //                         setState(() {
  //                           _values = value;
  //                         });
  //                       },
  //                     ),
  //                   ),
  //                 ),
  //                 const Padding(
  //                   padding: EdgeInsets.all(10),
  //                   child: Divider(),
  //                 ),
  //                 Container(
  //                   alignment: Alignment.topLeft,
  //                   padding: const EdgeInsets.all(10),
  //                   child: Text(
  //                     "Color",
  //                     style: GoogleFonts.roboto(textStyle: productTitle)
  //                         .copyWith(color: HexColor("414141")),
  //                     maxLines: 1,
  //                     overflow: TextOverflow.ellipsis,
  //                   ),
  //                 ),
  //                 Container(
  //                   height: 70,
  //                   child: ListView.builder(
  //                     itemCount: list_of_color.length,
  //                     shrinkWrap: true,
  //                     scrollDirection: Axis.horizontal,
  //                     itemBuilder: (BuildContext context, int index) {
  //                       final color = list_of_color[index].Colorcode;
  //
  //                       return Column(
  //                         children: [
  //                           Padding(
  //                             padding: const EdgeInsets.all(2),
  //                             child: Container(
  //                                 height: 35,
  //                                 width: MediaQuery.of(context).size.width / 11,
  //                                 decoration: BoxDecoration(
  //                                     color: Color(color),
  //                                     borderRadius: const BorderRadius.all(
  //                                         Radius.circular(100)))),
  //                           )
  //                         ],
  //                       );
  //                     },
  //                   ),
  //                 ),
  //                 const Padding(
  //                   padding: EdgeInsets.all(10),
  //                   child: Divider(),
  //                 ),
  //                 Container(
  //                   alignment: Alignment.topLeft,
  //                   padding: const EdgeInsets.all(10),
  //                   child: Text(
  //                     "Size",
  //                     style: GoogleFonts.roboto(textStyle: productTitle)
  //                         .copyWith(color: HexColor("414141")),
  //                     maxLines: 1,
  //                     overflow: TextOverflow.ellipsis,
  //                   ),
  //                 ),
  //                 Padding(
  //                   padding:
  //                       const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       Column(
  //                         children: [
  //                           Radio(
  //                               fillColor: MaterialStateColor.resolveWith(
  //                                   (states) => loginButtonColor),
  //                               value: 0,
  //                               groupValue: _groupValue,
  //                               onChanged: (newValue) {
  //                                 setState(() => _groupValue = newValue as int);
  //                               }),
  //                           const Text('Small')
  //                         ],
  //                       ),
  //                       Column(
  //                         children: [
  //                           Radio(
  //                               fillColor: MaterialStateColor.resolveWith(
  //                                   (states) => loginButtonColor),
  //                               value: 1,
  //                               groupValue: _groupValue,
  //                               onChanged: (newValue) {
  //                                 setState(() => _groupValue = newValue as int);
  //                               }),
  //                           const Text('Medium')
  //                         ],
  //                       ),
  //                       Column(
  //                         children: [
  //                           Radio(
  //                               fillColor: MaterialStateColor.resolveWith(
  //                                   (states) => loginButtonColor),
  //                               value: 2,
  //                               groupValue: _groupValue,
  //                               onChanged: (newValue) {
  //                                 setState(() => _groupValue = newValue as int);
  //                               }),
  //                           const Text('Large')
  //                         ],
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //                 InkWell(
  //                   onTap: (){
  //                     controller.getAllPromotions();
  //                   },
  //                   child: Container(
  //                     margin: EdgeInsets.only(top: 25),
  //                     width: 120,
  //                     height: 30,
  //                     decoration: BoxDecoration(
  //                       color: loginButtonColor,
  //                     ),
  //                     child: const Center(child: Text('Clear',style: TextStyle(color: Colors.white),)),
  //                   ),
  //                 )
  //
  //               ],
  //             ))),
  //       )
  //       : Container();
  // }
}

