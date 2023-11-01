import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:saholatkar/controller/AllData/allDataController.dart';
import 'package:saholatkar/view/ProductDetails/product_details_screen.dart';

import '../../const/Api_constant/Api.dart';
import '../../const/theme.dart';
import '../../controller/Promotions/PromotionsController.dart';
import '../../controller/add_to_cart/AddToCartController.dart';
import '../../model/product_model/Product_Model.dart';
import '../../utility/app_constants.dart';
import '../Home Screen/components/add_to_cart_button.dart';
import 'components/add_remove_button.dart';

class HotProductData extends StatefulWidget {
  String hotCat = '';
   HotProductData({Key? key,required this.hotCat}) : super(key: key);

  @override
  State<HotProductData> createState() => _HotProductDataState();
}

class _HotProductDataState extends State<HotProductData> {
  final controller = Get.find<AllDataController>();
  AddToCartController cartController = Get.find();


  initializer(){
    Future.delayed(const Duration(seconds: 2), () {

      setState(() {
      });

    });
  }
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.hotCatList = [];
      controller.hotCatList!.clear();
      controller.page = 1;
      controller.hasNextPage = true;
      controller.scrollController2.addListener((){
        if(controller.scrollController2.position.pixels==controller.scrollController2.position.maxScrollExtent){
          controller.getHotProductsData(widget.hotCat);
        }
      });
      controller.getHotProductsData(widget.hotCat);
      initializer();
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllDataController>(
      init: AllDataController(),
      id: 'hot',
      builder: (controller){
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            title: Text(widget.hotCat),
          ),
          body: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: controller.hotCatList == null ? const Center(child: CircularProgressIndicator()): GridView.builder(
              gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing:5.0,
                childAspectRatio: (55 / 88),
              ),
              controller: controller.scrollController2,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(15),
              scrollDirection: Axis.vertical,
              itemCount: controller.hotCatList!.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                var  productImage = controller.hotCatList![index].productImage.toString().replaceAll('"]', '').replaceAll('["', '').replaceAll('\"', "");
                List<String> productImageList = productImage.split(',');
                controller.qty.add(1);
                return   SizedBox(
                  width: 180,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductDetailsScreen(id: controller.hotCatList![index].id.toString(),)),
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
                              // const SizedBox(height: 20),
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
                                controller.hotCatList![index].name.toString(),
                                textAlign: TextAlign.center,
                                style: GoogleFonts.roboto(textStyle: heading8),
                                maxLines: 1,
                                // overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Rs ${controller.hotCatList![index].mrpPrice ?? controller.hotCatList![index].salePrice}",
                                style: GoogleFonts.roboto(
                                  textStyle:
                                  productPrice.copyWith(color: loginButtonColor),
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 8),
                              controller.hotCatList![index].salePrice !=  controller.hotCatList![index].mrpPrice &&  controller.hotCatList![index].mrpPrice != null ?Text(
                                "Rs ${controller.hotCatList![index].salePrice}",
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      color: formTextColor,
                                      decoration: TextDecoration.lineThrough),
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ): SizedBox(height: 15,),
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
                                        name: controller.hotCatList![index].name.toString(),
                                        price: double.parse(controller.hotCatList![index].salePrice.toString()) ,
                                        fav: true,
                                        total: double.parse(controller.hotCatList![index].salePrice.toString()) ,
                                        image: ApiConstants.featuredProduct + productImageList[0].toString(),
                                        qta: 1,
                                        total_qta: 1,
                                        id: controller.hotCatList![index].id as int,
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
          ),
        );
      },
    );
  }
}
