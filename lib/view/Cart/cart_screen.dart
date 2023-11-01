import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:saholatkar/const/theme.dart';
import 'package:saholatkar/controller/PlaceOrder/place_order_controller.dart';
import 'package:saholatkar/controller/Product/Product_controller.dart';
import 'package:saholatkar/helper/prefs.dart';
import 'package:saholatkar/model/PlaceOrderBody.dart';
import 'package:saholatkar/view/Cart/check_out.dart';
import 'package:saholatkar/view/Cart/components/total_amount_cell.dart';
import 'package:saholatkar/widgets/back_navigator_without_text.dart';
import 'package:saholatkar/widgets/custome_button_without_bold.dart';

import '../../const/Api_constant/Api.dart';
import '../../controller/add_to_cart/AddToCartController.dart';
import '../ProductDetails/components/add_remove_button.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  AddToCartController cartController = Get.find();

  final product_controller = Get.put(Product_Controller());

  final placeController = Get.put(PlaceOrderController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      cartController.getCart();
    });

    super.initState();
  }
  bool _isSnackbarActive = false;
  showSnack() {
    setState(() {
      _isSnackbarActive = true;
    });
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Item removed from cart successfully")))
        .closed
        .then((SnackBarClosedReason reason) {
      // snackbar is now closed.
      setState(() {
        _isSnackbarActive = false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const BackNavigatorWithoutText()),
        backgroundColor: Colors.white,
        title:  const Text(
          "Cart",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          GetBuilder<AddToCartController>(builder: (_) {
            return Padding(
                padding: const EdgeInsets.only(right: 20, top: 20),
                child: Text(
                  "${cartController.cartItem} items",
                  style: GoogleFonts.roboto(textStyle: heading8).copyWith(
                      color: HexColor("414141"),
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ));
          }),
          InkWell(
              onTap: ()async{
                if (cartController.cartItem != 0) {
                  await placeController.emptyCart().then((value){
                    cartController.getCart();
                 });
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(Icons.delete_outline,color: loginButtonColor,),
              ))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: GetBuilder<Product_Controller>(
                builder: (_) {
                  if (cartController.cartItem == 0) {
                    return const Center(
                      child: Text("No item found"),
                    );
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      var  productImage = cartController.getFromCartModel.cart![index].product!.productImage.toString().replaceAll('"]', '').replaceAll('["', '').replaceAll('\"', "");
                      List<String> productImageList = productImage.split(',');
                      print(ApiConstants.featuredProduct + productImageList[0]);
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Card(
                              elevation: 5,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 12, right: 12, top: 2, bottom: 10),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          child: Icon(
                                            Icons.clear,
                                            size: 25,
                                            color: formTextColor,
                                          ),
                                          onTap: ()async {
                                            await product_controller.removeFromAdmin(int.parse(cartController.getFromCartModel.cart![index].productId.toString()));
                                            await cartController.getCart();
                                            setState(() {});
                                            if (!_isSnackbarActive) {
                                              showSnack();
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,

                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: formTextColor
                                                    .withOpacity(0.15),
                                                width: 2),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10)),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 30),
                                            child: Center(
                                              child: Container(
                                                height: 90.0,
                                                width: 90.0,
                                                decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                ),
                                                child:   CachedNetworkImage(
                                                  width: 120,
                                                  height: 120,
                                                  imageUrl:  ApiConstants.featuredProduct + productImageList[0],
                                                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                                                      Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                                                  errorWidget: (context, url, error) =>   const SizedBox(
                                                      width: 120,
                                                      height: 180,
                                                      child: Center(child: Text('Image not found!'))),

                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 15),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width * 0.5,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    cartController.getFromCartModel.cart![index].product!.name!,
                                                    style: GoogleFonts.roboto(
                                                            textStyle:
                                                                productTitle)
                                                        .copyWith(
                                                            color: HexColor(
                                                                "414141")),
                                                    maxLines: 1,

                                                  ),
                                                  const SizedBox(height: 8),
                                                  Text(
                                                    "SKU: ${cartController.getFromCartModel.cart![index].product!.code}",
                                                    style: GoogleFonts.roboto(
                                                            textStyle: heading8)
                                                        .copyWith(
                                                            color: formTextColor,
                                                            fontSize: 12),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  const SizedBox(height: 8),
                                                  Text(
                                                    "${cartController.getFromCartModel.cart![index].product!.salePrice}- Cash",
                                                    style: GoogleFonts.roboto(
                                                            textStyle: heading8)
                                                        .copyWith(
                                                            color: HexColor(
                                                                "7C7C7C"),
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.bold),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  const SizedBox(height: 10),

                                                  const SizedBox(height: 20),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                GetBuilder<Product_Controller>(
                                                    builder: (controller) =>
                                                        Text(
                                                          "Rs ${double.parse(cartController.getFromCartModel.cart![index].product!.salePrice.toString()) * double.parse(cartController.getFromCartModel.cart![index].quantity.toString())}",
                                                          style: GoogleFonts.roboto(
                                                                  textStyle:
                                                                      productTitle)
                                                              .copyWith(
                                                                  color: HexColor(
                                                                      "414141")),
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        )),
                                                const SizedBox(width: 10),
                                                Material(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          14.0),
                                                  elevation: 0,
                                                  child: Container(
                                                    height: 30,
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
                                                                  cartController
                                                                      .decrement(
                                                                          index);
                                                                  setState(() {

                                                                  });
                                                                },
                                                              ),

                                                              Padding(
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      horizontal:
                                                                          8),
                                                                  child: GetBuilder<
                                                                      Product_Controller>(
                                                                    builder:
                                                                        (controller) =>
                                                                            Text(
                                                                      "${cartController.getFromCartModel.cart![index].quantity}",
                                                                      style: heading8
                                                                        ..copyWith(
                                                                          color:
                                                                              HexColor("414141"),
                                                                        ),
                                                                    ),
                                                                  )),
                                                              AddButton(
                                                                onPressed: () {
                                                                  //final data= product_controller.cartItems[index];
                                                                  //  index==product_controller.increment(index);
                                                                  // product_controller.cartItems[index].qta++;
                                                                  //print('data ${index}');
                                                                  cartController
                                                                      .increment(
                                                                          index);
                                                                  setState(() {

                                                                  });
                                                                },
                                                              ),
                                                              // const SizedBox(width: 8),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                    itemCount: cartController.getFromCartModel.cart!.length,
                  );
                },
              ),
            ),
          ),
          TotalAmountCell(),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: CustomButtonWithoutBold(
              textColor: Colors.white,
              textValue: "Proceed to checkout",
              buttonColor: HexColor("1BCB5D"),
              onPressed: ()  {
                if(cartController.getFromCartModel.cart!.isNotEmpty) {
                  Get.to(()=>const CheckOutScreen());
                }

              },
            ),
          ),
        ],
      ),
    );
  }
}
