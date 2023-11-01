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

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  SearchController controller = Get.put(SearchController());
  final Productcontroller = Get.put(Product_Controller());
  AddToCartController cartController = Get.find();
  FocusNode searchNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: SizedBox(
            height: 40,
            child: TextFormField(
              onChanged: (value){
                if(value.isNotEmpty){
                  controller.getSearchDetails(value);
                }
              },
              controller: searchController,
              focusNode: searchNode,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                hintText: "Search Product",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: GetBuilder<SearchController>(
        init: SearchController(),
        builder: (controller) =>    controller.isLoading ? const CircularProgressIndicator():
        controller.searchModelResponse.data == null ? const Center(child: Text('Search Products'),):
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: GridView.builder(
              gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing:5.0,
                childAspectRatio: (55 / 88),
              ),
              itemCount: controller.searchModelResponse.data!.length,
              itemBuilder: (BuildContext context, int index) {
                var  productImage = controller.searchModelResponse.data![index].productImage.toString().replaceAll('\"]', '').replaceAll('[\"', '').replaceAll('\"', "");
                List<String> productImageList = productImage.split(',');
                controller.qty.add(1);
                //return Text(controller.searchModelResponse.data!.first.name.toString());
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDetailsScreen(id: controller.searchModelResponse.data![index].id.toString(),)),
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

                              "${controller.searchModelResponse.data![index].name}",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.roboto(textStyle: heading8),
                              maxLines: 1,

                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Rs ${controller.searchModelResponse.data![index].salePrice.toString()}",
                            style: GoogleFonts.roboto(
                              textStyle: productPrice.copyWith(
                                  color: loginButtonColor),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Rs ${controller.searchModelResponse.data![index].salePrice.toString()}",
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: formTextColor,
                                  decoration: TextDecoration.lineThrough),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
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
                                  {
                                    final model = ShopItemModel(
                                      name: controller.searchModelResponse.data![index].name.toString(),
                                      price: double.parse(controller.searchModelResponse.data![index].salePrice.toString()) ,
                                      fav: true,
                                      total: double.parse(controller.searchModelResponse.data![index].salePrice.toString()) ,
                                      image: ApiConstants.featuredProduct + productImageList[0].toString(),
                                      qta: controller.qty[index],
                                      total_qta: controller.qty[index] ,
                                      id: controller.searchModelResponse.data![index].id as int,
                                    );

                                    // Check if not null then add to cart else not
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
                );
              }),
        ),
      ),
    );
  }
}
