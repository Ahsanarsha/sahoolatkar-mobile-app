import 'package:badges/badges.dart' as badges;
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saholatkar/const/theme.dart';
import 'package:saholatkar/controller/Product/Product_controller.dart';

import '../../controller/UserProfile/user_profile.dart';
import '../../controller/add_to_cart/AddToCartController.dart';
import '../BecomeSaholatkarMerchant/become_saholatkar_merchant.dart';
import '../Cart/cart_screen.dart';
import '../Search/search_screen.dart';
import '../Wishlist/wishlist_screen.dart';
import '../profile/profile_screen.dart';
import 'components/build_brands.dart';
import 'components/build_categories.dart';
import 'components/carousel_slider.dart';
import 'components/featured_products.dart';
import 'components/hot_categories.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final product_controller = Get.put(Product_Controller());
  final cartControl = Get.put(AddToCartController());
  List<String> bannerList = [
    "assets/images/home_screen/banner.png",
    "assets/images/home_screen/banner.png",
    "assets/images/home_screen/banner.png",
    "assets/images/home_screen/banner.png",
  ];

  Widget _shoppingCartBadge() {
    return GetBuilder<AddToCartController>(builder: (_) {
      return badges.Badge(
        position: BadgePosition.topEnd(top: 0, end: 3),
        animationDuration: const Duration(milliseconds: 300),
        animationType: BadgeAnimationType.slide,
        badgeContent: Text(
          cartControl.cartItem.toString(),
          style: const TextStyle(color: Colors.white),
        ),
        child: IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Get.to(() => CartScreen());
            }),
      );
    });
  }
  @override
  void initState() {
    UserProfileController().getUserProfile();
    cartControl.getCart();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: loginButtonColor,
        child: _shoppingCartBadge(),
        onPressed: () {
          Get.to(() => CartScreen());
        },
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(15.0),
          child: InkWell(
            onTap: (){
              // Get.to(()=>const WishlistScreen());
            },
            child: SvgPicture.asset("assets/svg_icons/home_screen/More.svg",
                width: 25.91, height: 19.91, semanticsLabel: 'more'),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: InkWell(
            onTap: (){
              Get.to(()=>const SearchScreen());
            },
            child: SizedBox(
              height: 40,
              child: TextFormField(
                enabled: false,
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
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 3),
                    Center(
                      child: InkWell(
                        onTap: (){
                          Get.to(()=>const BecomeSaholatKarMerchantScreen());
                        },
                        child: SizedBox(
                          child: Text(
                            "Become a Partner - Sell on Sahoolatkaar",
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                color: loginTextColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),

                    CarouselSliderScreen(),
                    const SizedBox(height: 8),
                    Material(
                      elevation: 2,
                      color: Colors.white,
                      borderRadius:const BorderRadius.all(Radius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: [
                          headerCell(title1: "Brands"),
                          const BuildBrands(),
                        ],),
                      ),
                    ),

                    const SizedBox(height: 8),
                    Material(
                      elevation: 2,
                      color: Colors.white,
                      borderRadius:const BorderRadius.all(Radius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: [
                          headerCell(title1: "Category"),
                          const BuildCategories(),
                        ],),
                      ),
                    ),

                    const SizedBox(height: 8),
                    Material(
                      elevation: 2,
                      color: Colors.white,
                      borderRadius:const BorderRadius.all(Radius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: [
                          headerCell(title1: "Featured Products"),
                          const SizedBox(height: 8),
                          FeaturedCategories(),
                        ],),
                      ),
                    ),

                    const SizedBox(height: 15),
                    Material(
                      elevation: 2,
                      color: Colors.white,
                      borderRadius:const BorderRadius.all(Radius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            headerCell(title1: "Hot Categories"),
                          const SizedBox(height: 8),
                          const HotCategories(),
                        ],),
                      ),
                    ),

                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
            // ),
          ),
        ),
      ),
    );
  }

  Widget headerCell({required String title1}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title1,
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            )),
      ],
    );
  }

  Widget singleHeaderCell({required String title1}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title1,
          style: GoogleFonts.roboto(
            textStyle: const TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
