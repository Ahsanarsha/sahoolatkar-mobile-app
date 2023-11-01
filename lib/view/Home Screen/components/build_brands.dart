import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saholatkar/const/Api_constant/Api.dart';
import 'package:saholatkar/const/theme.dart';
import 'package:saholatkar/view/ProductDetails/brand_product/brand_cat_product_screen.dart';
import 'package:scroll_indicator/scroll_indicator.dart';

import '../../../controller/AllData/allDataController.dart';

class BuildBrands extends StatefulWidget {
  const BuildBrands({Key? key}) : super(key: key);

  @override
  State<BuildBrands> createState() => _BuildBrandsState();
}

class _BuildBrandsState extends State<BuildBrands> {
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
          return controller.isLoading || controller.allBrands.data == null ? SizedBox(
            width: MediaQuery.of(context).size.width / 1,
            height: 180,):SizedBox(
            width: MediaQuery.of(context).size.width / 1,
            height: 190,
            child: controller.isLoading
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
                              controller: scrollController,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 15,
                                crossAxisSpacing: 7,
                                childAspectRatio: 1 / 1.35,
                              ),
                              itemCount: controller.allBrands.data!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: (){
                                    Get.to(()=>BrandCatScreen(brand: controller.allBrands.data![index].title.toString(),));
                                  },
                                  child: Container(
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
                                        CachedNetworkImage(
                                          width: 50,
                                          height: 50,
                                          imageUrl: ApiConstants.brandImages.toString()+ controller.allBrands.data![index].photo.toString(), //== null? '':controller.allBrands.data![index].photo.toString(),
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
                                        Text(controller.allBrands.data![index].title!,style: const TextStyle(fontSize: 9),textAlign: TextAlign.center,)
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
                              decoration: BoxDecoration(
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
