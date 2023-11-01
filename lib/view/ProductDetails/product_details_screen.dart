import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:saholatkar/const/theme.dart';
import 'package:saholatkar/const/Api_constant/Api.dart';
import 'package:saholatkar/controller/Product/Product_controller.dart';
import 'package:saholatkar/services/base_client.dart';
import 'package:saholatkar/view/Cart/direct_buy.dart';
import 'package:saholatkar/view/ProductDetails/components/add_remove_button.dart';
import 'package:saholatkar/view/ProductDetails/components/add_remove_cell.dart';
import 'package:saholatkar/view/ProductDetails/components/build_product_images.dart';
import 'package:saholatkar/view/ProductDetails/components/custom_button.dart';
import 'package:saholatkar/view/ProductDetails/components/product_ratings.dart';
import 'package:saholatkar/view/ProductDetails/components/whatsapp_button.dart';
import 'package:saholatkar/view/ProductDetails/components/write_review.dart';
import 'package:saholatkar/view/profile/components/EMI_calculator.dart';
import 'package:saholatkar/widgets/back_navigator_without_text.dart';
import 'package:saholatkar/widgets/grey_divider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/Product/product_details_controller.dart';
import '../../controller/RequestForm/request_form_controller.dart';
import '../../controller/add_to_cart/AddToCartController.dart';
import '../../model/product_model/Product_Model.dart';
import '../../widgets/custome_button_without_bold.dart';
import '../Home Screen/components/add_to_cart_button.dart';
import '../RequestForm/components/stepper_form.dart';

class ProductDetailsScreen extends StatefulWidget {
  String id = '-1';
  ProductDetailsScreen({Key? key,required this.id}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final product_controller = Get.put(Product_Controller());
  late ProductDetailsController controller;
  int descriptionIndex = 0;
  int productPhotoIndex = 0;

  Map<int, bool> buttons = {
    0: true,
    1: false,
    2: false,
    3: false,
  };
  String  selectedPlan = '';
  String selectedAdvance = '';
  String selectedMonth = '';
  String selectedInstallment = '';

  List<String> imageList = [];
  List<String> buttonList =[];
  List<String> monthlyList =[];
  List<String> advanceList =[];
  final Productcontroller = Get.put(Product_Controller());

  List<String> descriptionButtonTitle = [
    "Description",
    "Additional Info",
    "Reviews",
    "Installment Terms"
  ];
  bool validateStructure(String value){
    String  pattern = r'^[A-Za-z_.://]+$';
    RegExp regExp =  RegExp(pattern);
    return regExp.hasMatch(value);
  }

  @override
  void initState() {
    print(!(widget.id.contains('.')));
    // dynamic a = int.parse(widget.id);
    // print(a is int ? a/10 :"Not an int");

    try{
      controller = Get.find();
    }catch(E){
      controller = Get.put(ProductDetailsController());
    }
    if(!validateStructure(widget.id) && !(widget.id.contains('.'))) {
      buttonList.clear();
      monthlyList.clear();
      advanceList.clear();
      controller.getProductDetails(widget.id).then((value) {
        var productImage = ApiConstants.categoriesProducts +
            controller.productDetailsResponse.data![0].productImage
                .toString()
                .replaceAll('\"]', '')
                .replaceAll('[\"', '')
                .replaceAll('\"', "");
        imageList = productImage.split(',');
      });

      controller.getInstallmentPlans(widget.id).then((value) {
        controller.installmentResponse.data!.result!
            .sort((b, a) => b.duration!.compareTo(a.duration!));

        for (var items in controller.installmentResponse.data!.result!) {
          buttonList.add('${items.duration} Months');
          monthlyList.add('${items.monthlyinstallment}');
          advanceList.add('${items.advance}');
        }
      });
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return !validateStructure(widget.id) && !(widget.id.contains('.')) ? GetBuilder<ProductDetailsController>(
      init: ProductDetailsController(),
      builder:(_)=> Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const BackNavigatorWithoutText()),
          // iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: const Text(
            "Details",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: controller.isLoading || controller.productDetailsResponse.data == null ?
        const Center(child: CircularProgressIndicator(),):
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                margin: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    SizedBox(
                      height: 170.0,
                      width: 170.0,
                      child:  CachedNetworkImage(
                        width: 120,
                        height: 120,
                        imageUrl: imageList.isEmpty ? '':imageList[0].toString(),
                        progressIndicatorBuilder: (context, url, downloadProgress) =>
                            Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                        errorWidget: (context, url, error) =>  const SizedBox(
                            width: 120,
                            height: 180,
                            child: Center(child: Text('Image not found!'))),
                      ),
                    ),
                    const SizedBox(height: 8),
                    BuildProductImages(
                      imageList: imageList,
                      onCountSelected: (int index) {
                        setState(() {
                          productPhotoIndex = index;
                        });
                      },
                    ),
                  ],
                ),
              ),
              // const SizedBox(height: 3),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.productDetailsResponse.data![0].name.toString(),
                      style: GoogleFonts.roboto(textStyle: productTitle)
                          .copyWith(color: HexColor("414141")),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "SKU: ${controller.productDetailsResponse.data![0].code}",
                      style: GoogleFonts.roboto(textStyle: heading8)
                          .copyWith(color: formTextColor, fontSize: 11),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Expanded(flex: 1, child: AbsorbPointer(child: ProductRatings())),
                        Expanded(
                            flex: 1,
                            child: Row(
                              children: [
                                Text(
                                  "0 Reviews",
                                  style: GoogleFonts.roboto(textStyle: heading8)
                                      .copyWith(
                                          color: formTextColor, fontSize: 11),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  " | ",
                                  style: GoogleFonts.roboto(textStyle: heading8)
                                      .copyWith(
                                          color: formTextColor, fontSize: 14),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const WriteReview()),
                                    );
                                  },
                                  child: Text(
                                    "Write a review",
                                    style:
                                        GoogleFonts.roboto(textStyle: heading8)
                                            .copyWith(
                                                color: formTextColor,
                                                fontSize: 12),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                    const SizedBox(height: 18),
                    Text(
                      "Rs ${controller.productDetailsResponse.data![0].salePrice} - Cash",
                      style: GoogleFonts.roboto(textStyle: heading3).copyWith(
                          color: loginButtonColor, fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const GreyDivider(),
                    const SizedBox(height: 8),
                    Text(
                      "Installment Options",
                      style: GoogleFonts.roboto(textStyle: productTitle)
                          .copyWith(color: HexColor("414141")),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 15),
                    // installmentButtons(),
                    Center(
                      child: GroupButton(
                        options: GroupButtonOptions(
                          selectedColor: loginButtonColor,
                          unselectedShadow: const [],
                          unselectedColor:
                              const Color.fromARGB(255, 244, 243, 240),
                          selectedBorderColor: Colors.transparent,
                          unselectedBorderColor: formTextColor,
                          borderRadius: BorderRadius.circular(5),
                          spacing: 10,
                          runSpacing: 10,
                          textAlign: TextAlign.center,
                          textPadding: EdgeInsets.zero,
                          alignment: Alignment.center,
                          elevation: 0,
                        ),
                        isRadio: true,
                        onSelected: (name, index, isSelected) {
                          // if (index == 0) {}
                          // if (index == 1) {}
                          // if (index == 2) {}
                          selectedMonth = name.toString();
                          selectedInstallment = monthlyList[index].toString();
                          selectedPlan = "Rs ${monthlyList[index]} / month for $name";
                          selectedAdvance ="Rs ${advanceList[index]}";
                          setState(() {});
                        },
                        buttons: buttonList,
                      ),
                    ),

                    const SizedBox(height: 15),
                    Text(
                    selectedPlan,
                      style: GoogleFonts.roboto(textStyle: heading8).copyWith(
                          color: loginButtonColor,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      selectedAdvance.isNotEmpty ? 'Advance Payment $selectedAdvance' : '',
                      style: GoogleFonts.roboto(textStyle: heading8).copyWith(
                          color: loginButtonColor,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    selectedAdvance ==''?const SizedBox():CustomButtonWithoutBold(
                      textColor: Colors.white,
                      textValue: "Apply for installment",
                      buttonColor: HexColor("1BCB5D"),
                      onPressed: ()  {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GetBuilder<
                                  RequestFormStepperController>(
                                  init: RequestFormStepperController(),
                                  builder:
                                      (requestFormStepperController) =>
                                   FormStepper(productId: widget.id,advance: selectedAdvance.toString(),duration: selectedMonth,monthlyInstallment: selectedPlan,)),
                            ));
                      },
                    ),
                    CustomButtonWithoutBold(
                      textColor: Colors.white,
                      textValue: "Calculate your EMI",
                      buttonColor: loginButtonColor,
                      onPressed: ()  {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  EMICalculator(amount: controller.productDetailsResponse.data![0].salePrice,productId: widget.id,)),
                        );

                      },
                    ),
                    const GreyDivider(),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => CartScreen()),
                              // );
                            },
                            child: Material(
                              borderRadius: BorderRadius.circular(14.0),
                              elevation: 0,
                              child: Container(
                                height: 40,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5.0),
                                    border: Border.all(
                                        color: formTextColor, width: 1)),
                                child: Material(
                                  color: Colors.transparent,
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        // const SizedBox(width: 8),
                                        RemoveButton(
                                          onPressed: () {
                                            //final data=  product_controller.cartItems[index];
                                            //product_controller.decrement(index);
                                            product_controller.decrementPro();
                                          },
                                        ),
                                        // GetBuilder<CounterController>(
                                        //   builder: (controller) => Text(
                                        //     "increment  ${controller.count}",
                                        //     style: TextStyle(fontSize: 18),
                                        //   ),
                                        // ),
                                        GetBuilder<
                                            Product_Controller>(
                                          init: Product_Controller(),
                                          builder: (controller) => Text(


                                            product_controller.detailProductCount.toString(),
                                            style: heading8
                                              ..copyWith(
                                                color:
                                                    HexColor("414141"),
                                              ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        AddButton(
                                          onPressed: () {
                                            //final data= product_controller.cartItems[index];
                                            //  index==product_controller.increment(index);
                                            // product_controller.cartItems[index].qta++;
                                            //print('data ${index}');
                                            //product_controller.increment(index);
                                            product_controller.incrementPro();
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


                        controller.productDetailsResponse.data![0].wishlist! ? InkWell(
                          onTap: ()async{
                            await controller.removeFavourite(controller.productDetailsResponse.data![0].id);
                            controller.getProductDetails(widget.id);

                          },
                          child: const SizedBox(
                            height: 40,
                            width: 100,
                            child: CustomButton2(
                                iconLink:
                                "assets/images/heart.png"),
                          ),
                        ) :InkWell(
                          onTap: ()async{
                            await controller.setFavourite(controller.productDetailsResponse.data![0].id);
                            controller.getProductDetails(widget.id);
                          },
                          child: const SizedBox(
                            height: 40,
                            width: 100,
                            child: CustomButton(
                                iconLink:
                                    "assets/svg_icons/product_details/like.svg"),
                          ),
                        ),

                        SizedBox(
                          height: 40,
                          width: 100,
                          child: InkWell(
                            onTap: ()async{
                              String text = 'Hey Checkout this product I found on SahoolatKar \n${controller.productDetailsResponse.data![0].name}\nPrice:${controller.productDetailsResponse.data![0].salePrice}\n\n${ApiConstants.categoriesProducts +controller.productDetailsResponse.data![0].brandImage.toString()}';

                              await FlutterShare.share(
                                title: 'SahoolatKat',
                                text: text,

                              );
                            },
                            child: const CustomButton(
                                iconLink:
                                "assets/svg_icons/product_details/share.svg"),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    CustomButtonWithoutBold2(
                      textColor: Colors.white,
                      textValue: "Buy Now",
                      buttonColor: Colors.green,
                      onPressed: ()  {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DirectBuyScreen(
                                                id: widget.id,
                                                qty: product_controller
                                                    .detailProductCount == 0 ? '1':product_controller
                                                    .detailProductCount
                                                    .toString(),
                                                name: controller
                                                    .productDetailsResponse
                                                    .data![0]
                                                    .name
                                                    .toString(),
                                salePrice: controller.productDetailsResponse.data![0].salePrice.toString(),
                                code: controller.productDetailsResponse.data![0].code.toString(),
                                image: imageList[0],
                                              )),
                                    );

                      },
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
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
                          // final d = data[index]['id'] as int;
                          // print(d);
                          // var individualQunatity =
                          //     Productcontroller.checkIndivualQuantity(
                          //         data[index]['id'] as int);

                          // if (individualQunatity != 0) {
                          //   Get.to(() => CartScreen());
                          // } else
                          {
                            // if (Productcontroller.cartItems.isEmpty ||
                            //     individualQunatity == 0)
                            {
                              // print(d);
                              final model = ShopItemModel(
                                name: controller.productDetailsResponse.data![0].name.toString(),
                                price: double.parse(controller.productDetailsResponse.data![0].salePrice.toString()) ,
                                fav: true,
                                total: double.parse(controller.productDetailsResponse.data![0].salePrice.toString()) ,
                                image: ApiConstants.featuredProduct + imageList[0].toString(),
                                qta: product_controller.detailProductCount,
                                total_qta:product_controller.detailProductCount,
                                id: controller.productDetailsResponse.data![0].id as int,
                              );
                              bool status = await AddToCartController().addToCart(model);
                              if(status){
                              }
                            }

                          }
                        },
                      ),
                    ),

                    const SizedBox(height: 8),
                    InkWell(
                      onTap: ()async{
                        String url = '';
                        String phone = '+923332275275';
                        String message = 'I am interested to purchase ${controller.productDetailsResponse.data![0].name} having price of ${controller.productDetailsResponse.data![0].salePrice} \n ${ApiConstants.categoriesProducts +controller.productDetailsResponse.data![0].brandImage.toString()}';
                        if (Platform.isIOS) {
                          url = "https://wa.me/$phone?text=${Uri.encodeFull(message)}";
                        } else {
                          url = "whatsapp://send?phone=$phone&text=${Uri.encodeFull(message)}";
                        }
                        if (await canLaunchUrl(Uri.parse(url))) {
                          launchUrl(Uri.parse(url));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:  Text('Can not open Whatsapp')));
                        }
                      },
                      child: WhatsappButton(
                        textValue: "ORDER VIA WHATSAPP",
                        textColor: Colors.black,
                        buttonColor: HexColor("1BCB5D"),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // descriptionButton(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: buttons.length,
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            descriptionIndex = index;
                                            buttons[index] = true;
                                          });
                                          buttons.forEach((k, v) {
                                            if (index != k) {
                                              buttons[k] = false;
                                            }
                                          });
                                        },
                                        child: descriptionButton(
                                            descriptionButtonTitle[index],
                                            index))),
                          ),
                          descriptionView(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ) : Scaffold(body: Center(child: Text('Invalid QR'),),);
  }

  Widget descriptionView() => Padding(
        padding: const EdgeInsets.only(top: 5),
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: Column(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height / 5,
                  minWidth: MediaQuery.of(context).size.width / 2,
                  maxWidth: MediaQuery.of(context).size.width / 2,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        //                   <--- left side
                        color: formTextColor,
                        width: 1.5,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child:  descriptionIndex == 3 ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: ()async{
                          String url = '${ApiConstants.BASE_URL}installment-terms';
                          try{
                            await launchUrl(Uri.parse(url));
                          }catch(e){
                            Get.snackbar('Error','Can not launch installment terms');
                          }
                        },
                        child: Text(
                          'Tap to view Installment Terms',
                          style: GoogleFonts.roboto(textStyle: heading8).copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: formTextColor),
                        ),
                      ),
                    ) : Text(
                      descriptionIndex == 0 ?
                      controller.productDetailsResponse.data![0].description.toString().replaceAll('<p>', '').replaceAll("</p>", '') :
                      descriptionIndex == 1 ? 'Product name:\n${controller.productDetailsResponse.data![0].name}\nSKU:\n${ controller.productDetailsResponse.data![0].code}\nBrand:\n${ controller.productDetailsResponse.data![0].category}' :
                      'reviews',
                      style: GoogleFonts.roboto(textStyle: heading8).copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: formTextColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget descriptionButton(String title, int index) => SizedBox(
      width: MediaQuery.of(context).size.width / 3,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        customeTextCell(title: title, index: index),
      ]));

  Widget customeTextCell({required String title, required int index}) =>
      Padding(
        padding: const EdgeInsets.only(left: 3, right: 3, bottom: 12, top: 3),
        child: Text(
          title,
          style: GoogleFonts.roboto(textStyle: heading8).copyWith(
              color: buttons[index] == true ? loginButtonColor : formTextColor,
              fontSize: 12),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      );

  Widget installmentButtons() => Row(
        children: [
          Expanded(
            flex: 2,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.white,
                primary: loginButtonColor,
              ),
              child: const Text("3 Months"),
              onPressed: () {},
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 2,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.white,
                primary: loginButtonColor,
              ),
              child: const Text("6 Months"),
              onPressed: () {},
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 2,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.white,
                primary: loginButtonColor,
              ),
              child: const Text("12 Months"),
              onPressed: () {},
            ),
          ),
        ],
      );
}
