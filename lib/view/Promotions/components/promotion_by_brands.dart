// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:saholatkar/utility/app_constants.dart';
import 'package:saholatkar/view/ProductDetails/components/add_remove_button.dart';

import '../../../const/Api_constant/Api.dart';
import '../../../const/theme.dart';
import '../../../controller/Product/Product_controller.dart';
import '../../../controller/Promotions/PromotionsController.dart';
import '../../../controller/add_to_cart/AddToCartController.dart';
import '../../../model/product_model/Product_Model.dart';
import '../../Cart/cart_screen.dart';
import '../../Home Screen/components/add_to_cart_button.dart';
import '../../ProductDetails/product_details_screen.dart';

class PromotionsByBrands extends StatefulWidget {
  String brandName = '';
   PromotionsByBrands({Key? key,required this.brandName}) : super(key: key);

  @override
  State<PromotionsByBrands> createState() => _PromotionsByBrandsState();
}

class _PromotionsByBrandsState extends State<PromotionsByBrands> {
  PromotionController controller = Get.find();
  AddToCartController cartController = Get.find();
  final Productcontroller = Get.put(Product_Controller());
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      AppConstants.filterBrand = widget.brandName;
      controller.getPromotionsByBrand(widget.brandName);    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<PromotionController>(
      init: PromotionController(),
      id: 'brandPromo',
      builder: (controller){
        return SizedBox(
          width: double.infinity,
          height: 300,
          child: controller.allPromotion.data == null || controller.isFilterLoading ? const Center(child: CircularProgressIndicator()): GridView.builder(
            gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing:5.0,
              childAspectRatio: (55 / 88),
            ),
            padding: const EdgeInsets.all(15),
            scrollDirection: Axis.vertical,
            itemCount: controller.allPromotion.data!.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              var  productImage = controller.allPromotion.data![index].productImage.toString().replaceAll('\"]', '').replaceAll('[\"', '').replaceAll('\"', "");
              List<String> productImageList = productImage.split(',');

              controller.qty.add(1);
              return   SizedBox(
                width: 180,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDetailsScreen(id: controller.allPromotion.data![index].id.toString() ,)),
                    );
                  },
                  child: Card(
                    elevation: 5.0,
                    color: HexColor("F9F9F9"),
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            //const SizedBox(height: 20),
                            CachedNetworkImage(
                              width: 120,
                              height: 120,
                              imageUrl: ApiConstants.categoriesProducts + productImageList[0].toString(),
                              progressIndicatorBuilder: (context, url, downloadProgress) =>
                                  Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                              errorWidget: (context, url, error) =>  const SizedBox(
                                  width: 120,
                                  height: 180,
                                  child: Center(child: Text('Image not found!'))),

                            ),
                            Text(
                              controller.allPromotion.data![index].name.toString(),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.roboto(textStyle: heading8),
                              maxLines: 1,
                              // overflow: TextOverflow.clip,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Rs ${controller.allPromotion.data![index].mrpPrice??controller.allPromotion.data![index].salePrice}",
                              style: GoogleFonts.roboto(
                                textStyle:
                                productPrice.copyWith(color: loginButtonColor),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 8),
                            controller.allPromotion.data![index].salePrice!=  controller.allPromotion.data![index].mrpPrice &&  controller.allPromotion.data![index].mrpPrice != null ? Text(
                              "Rs ${controller.allPromotion.data![index].salePrice}",
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    color: formTextColor,
                                    decoration: TextDecoration.lineThrough),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ):SizedBox(height: 15,),
                            const SizedBox(height: 8),
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
                                                //controller.update();
                                              }
                                            },
                                          ),
                                          Padding(
                                              padding: const EdgeInsets
                                                  .symmetric(
                                                  horizontal:
                                                  8),
                                              child: GetBuilder<PromotionController>(
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
                              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 2),
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
                                      final model = ShopItemModel(
                                        name: controller.allPromotion.data![index].name.toString(),
                                        price: double.parse(controller.allPromotion.data![index].salePrice.toString()) ,
                                        fav: true,
                                        total: double.parse(controller.allPromotion.data![index].salePrice.toString()) ,
                                        image: ApiConstants.featuredProduct + productImageList[0].toString(),
                                        qta: 1,
                                        total_qta: 1,
                                        id: controller.allPromotion.data![index].id as int,
                                      );
                                      bool status = await AddToCartController().addToCart(model);
                                      if(status){
                                        cartController.getCart();
                                        setState((){});
                                      }
                                    }
                                },
                              ),
                            )
                          ],
                        ),
                        Positioned(
                          right: 5,
                          top: 10,
                          child: Container(
                            decoration: BoxDecoration(
                              color: loginButtonColor,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: const Padding(
                              padding:
                              EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                              child: Text("-10%"),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );

            },),
        );
      },
    );
  }
}
