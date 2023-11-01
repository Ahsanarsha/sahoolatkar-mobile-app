
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:saholatkar/controller/AllData/allDataController.dart';

import '../../../const/Api_constant/Api.dart';
import '../../../const/theme.dart';
import '../../../controller/Product/Product_controller.dart';
import '../../../controller/add_to_cart/AddToCartController.dart';
import '../../../model/product_model/Product_Model.dart';
import '../../../widgets/back_navigator_without_text.dart';
import '../../Home Screen/components/add_to_cart_button.dart';
import '../components/add_remove_button.dart';
import '../product_details_screen.dart';

class BrandCatScreen extends StatefulWidget {
  String? brand,cat;
   BrandCatScreen({Key? key,this.brand,this.cat}) : super(key: key);

  @override
  State<BrandCatScreen> createState() => _BrandCatScreenState();
}

class _BrandCatScreenState extends State<BrandCatScreen> {
  final Productcontroller = Get.put(Product_Controller());
  final dataController = Get.put(AllDataController());
  AddToCartController cartController = Get.find();
  String token ='';
  @override
  void initState() {

    dataController.scrollController.addListener((){
      if(dataController.scrollController.position.pixels==dataController.scrollController.position.maxScrollExtent){
        if(widget.brand!=null){
          dataController.fetch(widget.brand.toString().toLowerCase());
        }else{
          dataController.fetchCat(widget.cat.toString().toLowerCase());
        }

      }
    });
    dataController.responseList = [];
    dataController.pageNumber = 1;
    dataController.hasNextPage= true;
    if(widget.brand!=null){
      dataController.getBrandProductsPaginated(widget.brand.toString().toLowerCase());
    }else{
      dataController.getCatProductsPaginated(widget.cat.toString().toLowerCase());
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const BackNavigatorWithoutText()),
        // iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title:  Text(
            widget.brand !=null?  widget.brand.toString() : widget.cat.toString(),
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body:  GetBuilder<AllDataController>(
        init: AllDataController(),
        builder: (controller) =>   controller.isLoading ? const CircularProgressIndicator():
        controller.responseList == null ? const Center(child: Text('Search Products'),):
        SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.88,
                child: GridView.builder(
                  shrinkWrap: true,
                    gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: (55 / 88),
                    ),
                    controller: controller.scrollController,
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.responseList!.length,
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    itemBuilder: (BuildContext context, int index) {
                      var  productImage = controller.responseList![index].productImage.toString().replaceAll('\"]', '').replaceAll('[\"', '').replaceAll('\"', "");
                      List<String> productImageList = productImage.split(',');
                      controller.qty.add(1);
                      //return Text(controller.searchModelResponse.data!.first.name.toString());
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductDetailsScreen(id: controller.responseList![index].id.toString(),)),
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

                                    "${controller.responseList![index].name}",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.roboto(textStyle: heading8),
                                    maxLines: 1,

                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "Rs ${controller.responseList![index].mrpPrice ?? controller.responseList![index].salePrice}",
                                  style: GoogleFonts.roboto(
                                    textStyle: productPrice.copyWith(
                                        color: loginButtonColor),
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 8),
                                controller.responseList![index].salePrice !=  controller.responseList![index].mrpPrice &&  controller.responseList![index].mrpPrice != null ? Text(
                                  "Rs ${controller.responseList![index].salePrice.toString()}",
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
                                          // print(d);
                                          final model = ShopItemModel(
                                            name: controller.responseList![index].name.toString(),
                                            price: double.parse(controller.responseList![index].salePrice.toString()) ,
                                            fav: true,
                                            total: double.parse(controller.responseList![index].salePrice.toString()) ,
                                            image: ApiConstants.featuredProduct + productImageList[0].toString(),
                                            qta: controller.qty[index],
                                            total_qta: controller.qty[index] ,
                                            id: controller.responseList![index].id as int,
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
              if (!dataController.hasNextPage)
                 Positioned(
                  top: !dataController.responseList!.isNotEmpty ? MediaQuery.of(context).size.height * 0.4 : MediaQuery.of(context).size.height * 0.86,left:  MediaQuery.of(context).size.width * 0.25,
                  child:const Text('No more products availabe!'),
                ),
              if (dataController.isLoadMoreRunning)
                 Center(
                  child: LinearProgressIndicator(color: loginButtonColor,),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
