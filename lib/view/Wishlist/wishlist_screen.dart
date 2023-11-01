import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../const/Api_constant/Api.dart';
import '../../const/theme.dart';
import '../../controller/Product/Product_controller.dart';
import '../../controller/SearchController/search_controller.dart';
import '../../controller/add_to_cart/AddToCartController.dart';
import '../../model/product_model/Product_Model.dart';
import '../Home Screen/components/add_to_cart_button.dart';
import '../ProductDetails/components/add_remove_button.dart';
import '../ProductDetails/product_details_screen.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  SearchController controller = Get.put(SearchController());
  AddToCartController cartController = Get.find();
  final productController = Get.put(Product_Controller());
  @override
  void initState() {
    controller.qty.clear();
    controller.getFavProducts();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('Wishlist')

      ),
      body: GetBuilder<SearchController>(
        init: SearchController(),
        builder: (controller) =>    controller.favProducts.favourite == null? const Center(child: CircularProgressIndicator()):

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: GridView.builder(
              gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing:5.0,
                childAspectRatio: (55 / 88),
              ),
              itemCount: controller.favProducts.favourite!.length,
              itemBuilder: (BuildContext context, int index) {
                var  productImage = controller.favProducts.favourite![index].products![0].productImage.toString().replaceAll('\"]', '').replaceAll('[\"', '').replaceAll('\"', "");
                List<String> productImageList = productImage.split(',');
                controller.qty.add(1);
                //return Text(controller.searchModelResponse.data!.first.name.toString());
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDetailsScreen(id: controller.favProducts.favourite![index].products![0].id.toString(),)),
                    );
                  },
                  child: SizedBox(
                    width: 180,
                    child: Card(
                      elevation: 5.0,
                      color: HexColor("F9F9F9"),
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        children: [
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


                          const SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 3),
                            child: Text(

                              "${controller.favProducts.favourite![index].products![0].name}",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.roboto(textStyle: heading8),
                              maxLines: 1,

                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Rs ${controller.favProducts.favourite![index].products![0].mrpPrice ?? controller.favProducts.favourite![index].products![0].salePrice }",
                            style: GoogleFonts.roboto(
                              textStyle: productPrice.copyWith(
                                  color: loginButtonColor),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          controller.favProducts.favourite![index].products![0].salePrice != controller.favProducts.favourite![index].products![0].mrpPrice &&  controller.favProducts.favourite![index].products![0].mrpPrice != null ? Text(
                            "Rs ${controller.favProducts.favourite![index].products![0].salePrice.toString()}",
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
                                            child: GetBuilder<SearchController>(
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
                            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
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
                                      name: controller.favProducts.favourite![index].products![0].name.toString(),
                                      price: double.parse(controller.favProducts.favourite![index].products![0].salePrice.toString()) ,
                                      fav: true,
                                      total: double.parse(controller.favProducts.favourite![index].products![0].salePrice.toString()) ,
                                      image: ApiConstants.featuredProduct + productImageList[0].toString(),
                                      qta: controller.qty[index],
                                      total_qta: controller.qty[index] ,
                                      id: controller.favProducts.favourite![index].products![0].id as int,
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
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
