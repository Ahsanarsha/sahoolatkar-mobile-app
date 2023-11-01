import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:saholatkar/const/theme.dart';
import 'package:saholatkar/controller/AllData/allDataController.dart';
import 'package:saholatkar/controller/add_to_cart/AddToCartController.dart';
import 'package:saholatkar/view/ProductDetails/product_details_screen.dart';

import '../../../const/Api_constant/Api.dart';
import '../../../controller/Product/Product_controller.dart';
import '../../../model/product_model/Product_Model.dart';
import '../../ProductDetails/components/add_remove_button.dart';
import 'add_to_cart_button.dart';

class FeaturedCategories extends StatefulWidget {
  FeaturedCategories({Key? key}) : super(key: key);

  @override
  State<FeaturedCategories> createState() => _FeaturedCategoriesState();
}

class _FeaturedCategoriesState extends State<FeaturedCategories> {
  final Productcontroller = Get.put(Product_Controller());

  AddToCartController cartController = Get.find();

  List<ShopItemModel> items = [];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: GetBuilder<AllDataController>(
        init: AllDataController(),
        builder: (controller) =>    controller.isLoading3 || controller.allFeaturedProducts.data ==null ? SizedBox(
          width: MediaQuery.of(context).size.width / 1,
          height: 180,): ListView.builder(
            //itemCount: 1,
            itemCount: controller.allFeaturedProducts.data!.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              debugPrint("Length of Products are ${controller.allFeaturedProducts.data!.length.toString()}");
              var  productImage = controller.allFeaturedProducts.data![index].productImage.toString().replaceAll('\"]', '').replaceAll('[\"', '').replaceAll('\"', "");
              List<String> productImageList = productImage.split(',');
              controller.qty.add(1);
              //return Text(controller.allFeaturedProducts.data!.first.name.toString());
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductDetailsScreen(id: controller.allFeaturedProducts.data![index].id.toString(),)),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: SizedBox(
                    width: 180,
                    child: Card(
                      elevation: 5.0,
                      color: HexColor("F9F9F9"),
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Container(
                              height: MediaQuery.of(context).size.width / 3.5,
                              width: 120.0,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                image: DecorationImage(
                                  image: NetworkImage(

                                    ApiConstants.featuredProduct + productImageList[0].toString()),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 3),
                            child: Text(
                              "${controller.allFeaturedProducts.data![index].name}",
                              style: GoogleFonts.roboto(textStyle: heading8),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Rs ${controller.allFeaturedProducts.data![index].mrpPrice ?? controller.allFeaturedProducts.data![index].salePrice.toString()}",
                            style: GoogleFonts.roboto(
                              textStyle: productPrice.copyWith(
                                  color: loginButtonColor),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          controller.allFeaturedProducts.data![index].salePrice !=  controller.allFeaturedProducts.data![index].mrpPrice &&  controller.allFeaturedProducts.data![index].mrpPrice != null ? Text(
                            "Rs ${controller.allFeaturedProducts.data![index].salePrice.toString()}",
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: formTextColor,
                                  decoration: TextDecoration.lineThrough),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ):SizedBox(height: 15,),
                          Material(
                            borderRadius:
                            BorderRadius.circular(
                                14.0),
                            elevation: 0,
                            child: Container(
                              height: 30,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius
                                      .circular(5.0),
                                  border: Border.all(
                                      color:
                                      formTextColor,
                                      width: 1)),
                              child: Material(
                                color: Colors.transparent,
                                child: Padding(
                                  padding:
                                  const EdgeInsets
                                      .symmetric(
                                      horizontal:
                                      5.0),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .center,
                                      children: [
                                        // const SizedBox(width: 8),
                                        RemoveButton(
                                          onPressed: () {
                                            //final data=  product_controller.cartItems[index];
                                            if(controller.qty[index] >= 2){
                                              controller.decrementQuantity(index);
                                              controller.update();
                                            }
                                          },
                                        ),
                                        Padding(
                                            padding: const EdgeInsets
                                                .symmetric(
                                                horizontal:
                                                8),
                                            child: GetBuilder<AllDataController>(
                                              builder:
                                                  (controller) =>
                                                  Text(
                                                    "${controller.qty[index]}",
                                                    style: heading8
                                                      ..copyWith(
                                                        color:
                                                        HexColor("414141"),
                                                      ),
                                                  ),
                                            )),
                                        AddButton(
                                          onPressed: () {
                                            controller.incrementQuantity(index);
                                          },
                                        ),
                                        // const SizedBox(width: 8),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15),
                            child: AddToCartButton(
                              textValue: "Add to Cart",
                              textColor: Colors.black,
                              borderColor: Colors.black,
                              iconColor: loginButtonColor,
                              iconPath:
                                  "assets/images/home_screen/shopping_cart.png",
                              buttonHight: 30.0,
                              buttonColor: categoryCellColor,
                              onPressed: () async {

                                {
                                  {
                                    final model = ShopItemModel(
                                      name: controller.allFeaturedProducts.data![index].name.toString(),
                                      price: double.parse(controller.allFeaturedProducts.data![index].salePrice.toString()) ,
                                      fav: true,
                                      total: double.parse(controller.allFeaturedProducts.data![index].salePrice.toString()) ,
                                      image: ApiConstants.featuredProduct + productImageList[0].toString(),
                                      qta: controller.qty[index],
                                      total_qta: controller.qty[index] ,
                                      id: controller.allFeaturedProducts.data![index].id as int,
                                    );
                                    bool status = await AddToCartController().addToCart(model);
                                    if(status){
                                      cartController.getCart();
                                      setState((){});
                                    }
                                  }
                                }

                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
