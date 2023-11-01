import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:saholatkar/const/theme.dart';
import 'package:saholatkar/controller/AllData/allDataController.dart';

import '../../../const/Api_constant/Api.dart';
import '../../ProductDetails/hot_product_data.dart';
import 'add_to_cart_button.dart';

class HotCategories extends StatelessWidget {
  const HotCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllDataController>(
      init: AllDataController(),
      builder:(controller)=> SizedBox(
        height: 200,
        child: controller.hotCategoryModel.data == null ? const SizedBox()
            :ListView.builder(
            itemCount:  controller.hotCategoryModel.data!.length,
            scrollDirection: Axis.horizontal,
            padding:const EdgeInsets.only(bottom: 5),
            itemBuilder: (BuildContext context, int index) {

              return SizedBox(
                width: 180,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HotProductData(hotCat:  controller.hotCategoryModel.data![index].name.toString(),)),
                    );
                  },
                  child: Card(
                    elevation: 5.0,
                    color: HexColor("F9F9F9"),
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: CachedNetworkImage(
                              width: 120,
                              height: 120,
                              imageUrl: ApiConstants.hotCategories + controller.hotCategoryModel.data![index].photo.toString(),
                              progressIndicatorBuilder: (context, url, downloadProgress) =>
                                  Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                              errorWidget: (context, url, error) =>  const SizedBox(
                                  width: 120,
                                  height: 180,
                                  child: Center(child: Text('Image not found!'))),

                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  controller.hotCategoryModel.data![index].name.toString(),
                                  style: GoogleFonts.roboto(textStyle: heading8),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 20),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: AddToCartButton(
                                    textValue: "View",
                                    textColor: Colors.white,
                                    borderColor: loginButtonColor,
                                    iconColor: Colors.white,
                                    iconPath:
                                        "assets/images/home_screen/play.png",
                                    buttonHight: 30.0,
                                    buttonColor: loginButtonColor,
                                    onPressed: () {},
                                  ),
                                )
                              ],
                            ),
                          ),

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
