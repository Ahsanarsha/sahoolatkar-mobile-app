import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scroll_indicator/scroll_indicator.dart';

import '../../../const/Api_constant/Api.dart';
import '../../../const/theme.dart';
import '../../../controller/AllData/allDataController.dart';
import '../../ProductDetails/brand_product/brand_cat_product_screen.dart';

class BuildCategories extends StatefulWidget {
  const BuildCategories({Key? key}) : super(key: key);

  @override
  State<BuildCategories> createState() => _BuildCategoriesState();
}

class _BuildCategoriesState extends State<BuildCategories> {
  ScrollController scrollController = ScrollController();
  bool atEnd = false;

  @override
  void initState() {
    scrollController.addListener(() {
      if(scrollController.offset==scrollController.position.maxScrollExtent){
        atEnd = true;
        setState(() {});
      }else{
        atEnd = false;
        setState(() {});
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllDataController>(
        init: AllDataController(),
    builder: (controller) {

     return controller.isLoading2 || controller.allCategories.data == null? SizedBox(
       width: MediaQuery.of(context).size.width / 1,
       height: 180,) :SizedBox(
        width: MediaQuery.of(context).size.width / 1,
        height: 190,
        child: controller.isLoading2
            ? const Center(
          child: CircularProgressIndicator(),
        )
            : Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1,
                      height: 180,
                      child: GridView.builder(
          padding: const EdgeInsets.all(8),
          scrollDirection: Axis.horizontal,
          controller: scrollController,
          shrinkWrap: true,
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 7,
                      childAspectRatio: 1 / 1.35,
          ),
          itemCount: controller.allCategories.data!.length,
          itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: (){
                          Get.to(()=>BrandCatScreen(cat: controller.allCategories.data![index].name.toString(),));
                        },
                        child: Container(
                          // height: 58,
                          // width: 88,
                          // padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                          // margin: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: const BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10)), //here
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 6.0,
                              ),
                            ],
                          ),
                          child: Center(
                              child: Column(
                                children: [
                                  const SizedBox(height: 5,),
                                  CachedNetworkImage(
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.contain,
                                    imageUrl: ApiConstants.productCategories.toString()+controller.allCategories.data![index].photo.toString(),
                                    progressIndicatorBuilder:
                                        (context, url, downloadProgress) => Center(
                                        child: CircularProgressIndicator(
                                            value: downloadProgress.progress)),
                                    errorWidget: (context, url, error) =>
                                    const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: Center(child: Text("No Image",style: TextStyle(fontSize: 8),)),
                                    ),
                                  ),
                                  const SizedBox(height: 5,),
                                  Text(controller.allCategories.data![index].name!,style: const TextStyle(fontSize: 9),textAlign: TextAlign.center,)
                                ],
                              )),
                        ),
                      );
          },
        ),
                    ),
                    atEnd ? Positioned(
                      right: 0,
                      top: 80,
                      child: Material(
                        elevation: 2,
                        borderRadius: BorderRadius.circular(360),
                        child: Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: InkWell(
                                onTap: (){
                                  // scrollController.position.
                                  scrollController.jumpTo(0);
                                  setState(() {});
                                },
                                child: Icon(Icons.arrow_back_ios_new,color: loginButtonColor,)),
                          ),
                        ),
                      ),
                    ) : const SizedBox()
                  ],
                ),
                ScrollIndicator(
                  scrollController: scrollController,
                  width: 50,
                  height: 8,
                  indicatorWidth: 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300]),
                  indicatorDecoration: BoxDecoration(
                      color: loginButtonColor,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ],
            ),
      );
     
    });
  }
}
