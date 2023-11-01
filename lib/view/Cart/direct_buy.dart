import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:saholatkar/const/Api_constant/Api.dart';
import 'package:saholatkar/controller/add_to_cart/AddToCartController.dart';
import 'package:saholatkar/helper/BlocUserProfile.dart';

import '../../const/theme.dart';
import '../../controller/PlaceOrder/place_order_controller.dart';
import '../../controller/Product/Product_controller.dart';
import '../../helper/prefs.dart';
import '../../model/PlaceOrderBody.dart';
import '../../widgets/back_navigator_without_text.dart';

class DirectBuyScreen extends StatefulWidget {
  String id ='-',qty='-1',name ='',salePrice ='',code='',image ='';
   DirectBuyScreen({Key? key,required this.id,required this.qty,required this.name,required this.salePrice,required this.code,required this.image}) : super(key: key);

  @override
  State<DirectBuyScreen> createState() => _DirectBuyScreenState();
}
enum SingingCharacter {cash, card }
class _DirectBuyScreenState extends State<DirectBuyScreen> {
  final _userProfileFormKey = GlobalKey<FormState>();
  AddToCartController controller = Get.find<AddToCartController>();
  final product_controller = Get.put(Product_Controller());
  final placeController = Get.put(PlaceOrderController());
  SingingCharacter? character = SingingCharacter.cash;
  @override
  void initState() {
    setVal();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

    });
    super.initState();
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
        title: const Text(
          "Check out",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: _userProfileFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    'Address',
                    style: GoogleFonts.roboto(
                        fontSize: 20,
                        textStyle: productTitle)
                        .copyWith(color: HexColor("414141"),),
                    maxLines: 1,
                  ),
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  controller: controller.addressController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Address is required';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),),
                    labelText: "Address One",
                    hintText: "",
                    labelStyle: TextStyle(color: formTextColor),),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: controller.addressOneController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),),
                    labelText: "Address Two",
                    hintText: "",
                    labelStyle: TextStyle(color: formTextColor),),
                ),
                const SizedBox(height: 15),
                Row(children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller.zipController,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Zip Code is required';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),),
                        labelText: "Zip Code",
                        hintText: "",
                        labelStyle: TextStyle(color: formTextColor),),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: TextFormField(
                      controller: controller.cityController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'City is required';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),),
                        labelText: "City",
                        hintText: "",
                        labelStyle: TextStyle(color: formTextColor),),
                    ),
                  ),
                ],),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    'Contact Info',
                    style: GoogleFonts.roboto(
                        fontSize: 20,
                        textStyle: productTitle)
                        .copyWith(color: HexColor("414141"),),
                    maxLines: 1,
                  ),
                ),
                const SizedBox(height: 20),
                Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(10),
                  child:  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(13.91),
                                child: SvgPicture.asset("assets/svg_icons/user.svg",
                                    color: loginButtonColor,
                                    width: 17.91,
                                    height: 17.91,
                                    semanticsLabel: 'email')),
                            Flexible(
                              child: TextFormField(
                                controller: controller.nameController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Full Name field required';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,

                                  labelText: "Full Name",
                                  hintText: "",
                                  labelStyle: TextStyle(color: formTextColor),),

                              ),
                            ),
                          ],
                        ),
                        const Divider(color: Colors.grey,height: 1),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(13.91),
                                child: SvgPicture.asset(
                                    "assets/svg_icons/phone.svg",
                                    color: loginButtonColor,
                                    width: 17.91,
                                    height: 17.91,
                                    semanticsLabel: '')),
                            Flexible(
                              child: TextFormField(
                                controller: controller.phoneController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Mobile Number field required';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Mobile Number",
                                  hintText: "",

                                  labelStyle: TextStyle(color: formTextColor),
                                ),

                              ),
                            ),
                          ],
                        ),
                        const Divider(color: Colors.grey,height: 1),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(13.91),
                                child: SvgPicture.asset(
                                    "assets/svg_icons/email.svg",
                                    color: loginButtonColor,
                                    width: 17.91,
                                    height: 17.91,
                                    semanticsLabel: '')),
                            Flexible(
                              child: TextFormField(
                                controller: controller.emailController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Email field required';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Email",
                                  hintText: "",
                                  labelStyle: TextStyle(color: formTextColor),
                                ),

                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    'Order Summary',
                    style: GoogleFonts.roboto(
                        fontSize: 20,
                        textStyle: productTitle)
                        .copyWith(color: HexColor("414141"),),
                    maxLines: 1,
                  ),
                ),
                const SizedBox(height: 20),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {

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
                                                imageUrl: ApiConstants.featuredProduct + widget.image,
                                                progressIndicatorBuilder: (context, url, downloadProgress) =>
                                                    Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                                                errorWidget: (context, url, error) =>  const SizedBox(
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
                                            width: MediaQuery.of(context).size.width * 0.45,
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                 widget.name!,
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
                                                  "SKU: ${widget.code}",
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
                                                  "${widget.salePrice} - Cash",
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
                                                // Text(
                                                //   "Rs 1,500 / month for 3 months",
                                                //   style: GoogleFonts.roboto(
                                                //           textStyle: heading8)
                                                //       .copyWith(
                                                //           color:
                                                //               loginButtonColor,
                                                //           fontSize: 13,
                                                //           fontWeight:
                                                //               FontWeight.bold),
                                                //   maxLines: 1,
                                                //   overflow:
                                                //       TextOverflow.ellipsis,
                                                // ),
                                                const SizedBox(height: 20),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.end,
                                            children: [
                                              GetBuilder<AddToCartController>(
                                                  builder: (controller) =>
                                                      Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                        children: [
                                                          Text(
                                                            "Quantity: ${widget.qty}",
                                                            style: GoogleFonts.roboto(
                                                                textStyle:
                                                                productTitle)
                                                              ..copyWith(
                                                                color:
                                                                HexColor("414141"),
                                                              ),
                                                          ),
                                                          const SizedBox(width: 5,),
                                                          Text(
                                                            "Rs. ${double.parse(widget.qty)*double.parse(widget.salePrice.toString())}",
                                                            style: GoogleFonts.roboto(
                                                                textStyle:
                                                                productTitle)
                                                                .copyWith(
                                                                color: HexColor(
                                                                    "414141")),
                                                            maxLines: 1,
                                                            overflow: TextOverflow
                                                                .ellipsis,
                                                          ),
                                                        ],
                                                      )),
                                              const SizedBox(width: 10),
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
                  itemCount: 1,
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    'Payment Summary',
                    style: GoogleFonts.roboto(
                        fontSize: 20,
                        textStyle: productTitle)
                        .copyWith(color: HexColor("414141"),),
                    maxLines: 1,
                  ),
                ),
                const SizedBox(height: 20),
                Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(10),
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sub Total',
                                  style: GoogleFonts.roboto(
                                      textStyle: productTitle)
                                      .copyWith(color: HexColor("414141"),),
                                  maxLines: 1,
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  'Delivery Charges',
                                  style: GoogleFonts.roboto(
                                      textStyle: productTitle)
                                      .copyWith(color: HexColor("414141"),),
                                  maxLines: 1,
                                ),
                              ],),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GetBuilder<AddToCartController>(builder: (c) {
                                  double _totals = 0;

                                    var tPrice = double.parse(widget.qty) * double.parse(widget.salePrice.toString());
                                    _totals = _totals + tPrice;

                                  product_controller.totalC = _totals;
                                  return Text(
                                    "Rs. $_totals",
                                    style: GoogleFonts.roboto(textStyle: productTitle)
                                        .copyWith(color: HexColor("414141"), fontSize: 19),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  );
                                }),
                                const SizedBox(height: 20),

                                Text(
                                  "Rs 500",
                                  style: GoogleFonts.roboto(textStyle: productTitle)
                                      .copyWith(color: HexColor("414141"), fontSize: 19),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],),
                          ],),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Divider(color: Colors.grey,height: 1),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Total',
                                  style: GoogleFonts.roboto(
                                      textStyle: productTitle)
                                      .copyWith(color: HexColor("414141"),),
                                  maxLines: 1,
                                ),
                              ],),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GetBuilder<AddToCartController>(builder: (_) {
                                  double _totals = 0;

                                    var tPrice = double.parse(widget.qty) * double.parse(widget.salePrice.toString());
                                    _totals = _totals + tPrice;

                                  product_controller.totalC = _totals;
                                  return Text(
                                    "Rs ${_totals + 500}",
                                    style: GoogleFonts.roboto(textStyle: productTitle)
                                        .copyWith(color: HexColor("414141"), fontSize: 19),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  );
                                }),

                              ],),
                          ],),
                      ),


                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    'Payment Method',
                    style: GoogleFonts.roboto(
                        fontSize: 20,
                        textStyle: productTitle)
                        .copyWith(color: HexColor("414141"),),
                    maxLines: 1,
                  ),
                ),
                const SizedBox(height: 20),
                Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(10),
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Row(
                          children: [
                            Radio(
                                activeColor: loginButtonColor,
                                value: SingingCharacter.cash, groupValue: character, onChanged: (v){}),
                            const Text('Cash on delivery'),

                          ],
                        ),
                        Row(
                          children: [

                            Radio(
                                activeColor: loginButtonColor,
                                value: SingingCharacter.card, groupValue: character, onChanged: (v){}),
                            const Text('Credit/Debit Card'),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: ()async{
                    if(_userProfileFormKey.currentState!.validate()){
                      showDialog(
                          barrierDismissible: false,
                          barrierColor: Colors.transparent,
                          context: context,
                          builder: (dialogContext) {
                            return Center(
                                child: SpinKitFadingCircle(
                                  color: loginButtonColor,
                                  size: 50,
                                ));
                          });

                      var body = PlaceOrderBody();
                      var info = DeliveryInfo(
                          city: controller.cityController.text,
                          address: controller.addressController.text,
                          addressOne: controller.addressOneController.text,
                          country: 'Pakistan',
                          email: controller.emailController.text,
                          state: controller.cityController.text,
                          contact: controller.phoneController.text,
                          fullName: controller.nameController.text,
                          zip: controller.zipController.text
                      );

                      List<ProductDetails> data = [];

                        data.add(ProductDetails(productId: widget.id.toString(),qty: widget.qty.toString()));


                      var orderInfo = OrderInfo(
                          productDetails: data,
                          total:(product_controller.totalC + 500).toString()
                      );
                      body =  PlaceOrderBody(
                          deliveryInfo: info,
                          userrId: blocUserProfile.viewModelUser.data![0].id.toString(),
                          orderInfo: orderInfo
                      );
                      print(jsonEncode(body));
                      await placeController.placeOrder(body).then((value)async {

                        controller.getCart();

                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.pop(context);
                      });
                    }
                  },
                  child: Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(10),
                    color: loginButtonColor,
                    child:  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child:SizedBox(
                        height: 50,
                        child: Center(child: Text('Check out',style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 15
                        ),),),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void setVal() {
    controller.nameController.text  = blocUserProfile.viewModelUser.data![0].name.toString();
    controller.emailController.text  = blocUserProfile.viewModelUser.data![0].email.toString();
    controller.phoneController.text  = blocUserProfile.viewModelUser.data![0].mobile.toString();
  }
}
