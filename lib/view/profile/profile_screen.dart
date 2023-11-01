import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:saholatkar/const/theme.dart';
import 'package:saholatkar/controller/RequestForm/request_form_controller.dart';
import 'package:saholatkar/controller/UserProfile/user_profile.dart';
import 'package:saholatkar/helper/prefs.dart';
import 'package:saholatkar/view/AccountLevel/account_level_screen.dart';
import 'package:saholatkar/view/Authentication/login_screen.dart';
import 'package:saholatkar/view/BecomeSaholatkarMerchant/become_saholatkar_merchant.dart';
import 'package:saholatkar/view/HelpAndSupport/help_and_support_screen.dart';
import 'package:saholatkar/view/RequestForm/components/stepper_form.dart';
import 'package:saholatkar/view/ShariaCompliance/sharia_compliance_screen.dart';
import 'package:saholatkar/view/StoreLocator/store_locator.dart';
import 'package:saholatkar/view/UserProfile/user_profile_screen.dart';
import 'package:saholatkar/view/Wishlist/wishlist_screen.dart';
import 'package:saholatkar/view/notifications/notifications_screen.dart';
import 'package:saholatkar/view/profile/components/EMI_calculator.dart';
import 'package:saholatkar/view/profile/components/FAQ_screen.dart';
import 'package:saholatkar/view/profile/components/Transaction.dart';
import 'package:saholatkar/view/profile/components/TwoFactorAuthentication/two_factor_authentication.dart';
import 'package:saholatkar/view/profile/components/credit_scoring.dart';
import 'package:saholatkar/view/profile/components/list_tile_cell.dart';
import 'package:saholatkar/view/profile/components/orders_history.dart';
import 'package:saholatkar/view/suggest_new_product/suggest_new_product_screen.dart';
import 'package:saholatkar/view/wallet/wallet_screen.dart';
import 'package:saholatkar/widgets/back_navigator_without_text.dart';
import 'package:saholatkar/widgets/custome_button_without_bold.dart';
import 'package:saholatkar/widgets/grey_divider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../const/Api_constant/Api.dart';
import '../../helper/BlocUserProfile.dart';
import '../GoalAndRewards/goal_rewards.dart';

class ProfileScreen extends StatefulWidget {
   ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserProfileController controller = Get.put(UserProfileController());

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = ElevatedButton(
      style: ElevatedButton.styleFrom(
          onPrimary: Colors.black87,
          primary: Colors.white,
          shape: RoundedRectangleBorder(
              side: BorderSide(width: 1.0, color: loginButtonColor),
              borderRadius: BorderRadius.circular(10.0))),
      child: const Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = ElevatedButton(
      style: ElevatedButton.styleFrom(
        onPrimary: Colors.white,
        primary: loginButtonColor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
      child: const Text("SignOut"),
      onPressed: () async{
        await Prefs().remove('userData');
        await Prefs().remove('userId');
        await Prefs.setString("userToken", '').then((value){

          var tokenIsAfterLogOut = Prefs.getString("userToken");
          debugPrint("Tokken after loggin out: $tokenIsAfterLogOut");
          Get.offAll(() => const LoginScreen());
        });

      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      actionsPadding: const EdgeInsets.symmetric(horizontal: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      actionsAlignment: MainAxisAlignment.center,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
              child: Text(
                "SignOut",
                style: TextStyle(color: loginButtonColor,fontWeight: FontWeight.bold,fontSize: 20),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10,top: 5),
            child: Divider(
              thickness: 1.0,
              color: formTextColor.withOpacity(0.40),
            ),
          ),
          const Text("Are You Sure You Want to Logout?"),

          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            cancelButton,
            SizedBox(width: 10,),
            continueButton,
          ],)

        ],
      ),

    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: const Text('Profile',style: TextStyle(color: Colors.black),),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello!",
                    style: GoogleFonts.roboto(textStyle: heading8).copyWith(
                      color: HexColor("414141"),
                      fontSize: 12,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      blocUserProfile.viewModelUser.data![0].name.toString(),
                      style: GoogleFonts.roboto(textStyle: productTitle)
                          .copyWith(color: HexColor("414141")),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            const GreyDivider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Card(
                  elevation: 5,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      ListTileCell(
                          iconLink:
                              "assets/svg_icons/profile/account_levels.svg",
                          title: "Account Levels",
                          isLastTile: false,
                          ontapFunction: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                       AccountLevelScreen()),
                            );
                          }),
                      ListTileCell(
                          iconLink: "assets/svg_icons/profile/orders.svg",
                          title: "Orders History",
                          isLastTile: false,
                          ontapFunction: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const OrdersHistory()),
                            );
                          }),
                      ListTileCell(
                          iconLink: "assets/svg_icons/profile/wallet.svg",
                          title: "Wallet",
                          isLastTile: false,
                          ontapFunction: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const WalletScreen()),
                            );
                          }),
                      // ListTileCell(
                      //     iconLink: "assets/svg_icons/profile/Location.svg",
                      //     title: "Address",
                      //     isLastTile: false,
                      //     ontapFunction: () {}),
                      // ListTileCell(
                      //     iconLink:
                      //         "assets/svg_icons/profile/transaction_history.svg",
                      //     title: "Transaction History",
                      //     isLastTile: false,
                      //     ontapFunction: () {
                      //       Get.to(()=>const TransactionHistory());
                      //     }),
                      ListTileCell(
                          iconLink:
                              "assets/svg_icons/profile/installment_terms.svg",
                          title: "Request Form",
                          isLastTile: false,
                          ontapFunction: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GetBuilder<
                                          RequestFormStepperController>(
                                      init: RequestFormStepperController(),
                                      builder:
                                          (requestFormStepperController) =>
                                               FormStepper()),
                                ));
                          }),
                      // ListTileCell(
                      //     iconLink:
                      //         "assets/svg_icons/profile/account_setting.svg",
                      //     title: "Account Settings",
                      //     isLastTile: false,
                      //     ontapFunction: () {
                      //       Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) =>
                      //                 GetBuilder<UserProfileController>(
                      //                     init: UserProfileController(),
                      //                     builder: (userController) =>
                      //                         const UserProfileScreen())),
                      //       );
                      //     }),
                      ListTileCell(
                          iconLink:
                              "assets/svg_icons/profile/two_factor_auth.svg",
                          title: "Two-Factor Authentication",
                          isLastTile: false,
                          ontapFunction: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const TwoFactorAuthenticationScreen(),
                                ));
                          }),
                      ListTileCell(
                          iconLink: "assets/svg_icons/profile/Location.svg",
                          title: "Store Locator",
                          isLastTile: false,
                          ontapFunction: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const StoreLocator(),
                                ));
                          }),
                      ListTileCell(
                          iconLink: "assets/svg_icons/profile/rewards.svg",
                          title: "Goals & Rewards",
                          isLastTile: false,
                          ontapFunction: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                builder: (context) =>
                            const GoalRewardsScreen()));
                          }),
                      ListTileCell(
                          iconLink: "assets/svg_icons/product_details/like.svg",
                          title: "Wishlist",
                          isLastTile: false,
                          ontapFunction: () {
                            Get.to(()=>const WishlistScreen());
                          }),
                      ListTileCell(
                          iconLink: "assets/svg_icons/profile/wallet.svg",
                          title: "Become a SahoolatKar Merchant",
                          isLastTile: false,
                          ontapFunction: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const BecomeSaholatKarMerchantScreen()),
                            );
                          }),
                      ListTileCell(
                          iconLink:
                              "assets/svg_icons/profile/credit_scoring.svg",
                          title: "Credit Scoring",
                          isLastTile: true,
                          ontapFunction: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CreditScroringScreen()),
                            );
                          }),
                    ],
                  )),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Card(
                  elevation: 5,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      // ListTileCell(
                      //     iconLink:
                      //         "assets/svg_icons/profile/notification.svg",
                      //     title: "Notifications",
                      //     isLastTile: false,
                      //     ontapFunction: () {
                      //       Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) =>
                      //                 const NotificationScreen()),
                      //       );
                      //     }),
                      ListTileCell(
                          iconLink:
                              "assets/svg_icons/profile/suggest_new_product.svg",
                          title: "Suggest New Products",
                          isLastTile: true,
                          ontapFunction: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SuggestNewProductScreen()),
                            );
                          }),
                    ],
                  )),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Card(
                  elevation: 5,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      ListTileCell(
                          iconLink: "assets/svg_icons/profile/help.svg",
                          title: "Help & Customer Support",
                          isLastTile: false,
                          ontapFunction: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const HelpAndSupportScreen()),
                            );
                          }),
                      ListTileCell(
                          iconLink:
                              "assets/svg_icons/profile/installment_terms.svg",
                          title: "Installment Terms",
                          isLastTile: false,
                          ontapFunction: ()async {
                            String url = '${ApiConstants.BASE_URL}installment-terms';
                            try{
                              await launchUrl(Uri.parse(url));
                            }catch(e){
                              Get.snackbar('Error','Can not launch installment terms');
                            }
                          }),
                      // ListTileCell(
                      //     iconLink: "assets/svg_icons/profile/settings.svg",
                      //     title: "Settings",
                      //     isLastTile: false,
                      //     ontapFunction: () {}),
                      ListTileCell(
                          iconLink:
                              "assets/svg_icons/profile/emi_calculator.svg",
                          title: "EMI Calculator",
                          isLastTile: false,
                          ontapFunction: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                       EMICalculator()),
                            );
                          }),
                      ListTileCell(
                          iconLink: "assets/svg_icons/profile/sharia.svg",
                          title: "Sharia Compliance",
                          isLastTile: false,
                          ontapFunction: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ShariaCompliance()),
                            );
                          }),
                      ListTileCell(
                          iconLink: "assets/svg_icons/profile/faq.svg",
                          title: "FAQs",
                          isLastTile: true,
                          ontapFunction: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const FAQsScreen()),
                            );
                          }),
                    ],
                  )),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      showAlertDialog(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: loginButtonColor,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: SvgPicture.asset(
                              "assets/svg_icons/profile/signout.svg",
                              width: 17.91,
                              height: 17.91,
                              color: Colors.white,
                              semanticsLabel: ''),
                        ),
                      ],
                    ),
                  ),


                  const SizedBox(height: 25,),
                  Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                    IconButton(
                        icon:  FaIcon(FontAwesomeIcons.twitter,color: loginButtonColor),
                        onPressed: () {
                         String url = 'https://twitter.com/sahoolatkar';
                          launchUrl(Uri.parse(url));
                        }
                    ),
                    IconButton(
                        icon:  FaIcon(FontAwesomeIcons.facebook,color: loginButtonColor),
                        onPressed: () {
                          String url = 'https://www.facebook.com/Sahoolatkar';
                          launchUrl(Uri.parse(url));
                        }
                    ), IconButton(
                        icon:  FaIcon(FontAwesomeIcons.whatsapp,color: loginButtonColor),
                        onPressed: () async{
                          String url = '';
                          String phone = '+923332275275';
                          String message = 'Hi';
                          if (Platform.isIOS) {
                            url = "https://wa.me/$phone?text=${Uri.encodeFull(message)}";
                          } else {
                            url = "https://wa.me/$phone?text=${Uri.encodeFull(message)}";
                          }
                          if (await canLaunchUrl(Uri.parse(url))) {
                          launchUrl(Uri.parse(url));
                          } else {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:  Text('Can not open Whatsapp')));
                          }
                        }
                    ),
                    IconButton(
                        icon:  FaIcon(FontAwesomeIcons.instagram,color: loginButtonColor),
                        onPressed: () {
                          String url = 'https://www.instagram.com/sahoolatkar_official/';
                          launchUrl(Uri.parse(url));
                        }
                    ),
                    IconButton(
                        icon:  FaIcon(FontAwesomeIcons.youtube,color: loginButtonColor),
                        onPressed: () {
                          String url = 'https://www.youtube.com/BossSahoolatkar';
                          launchUrl(Uri.parse(url));
                        }
                    )



                  ],),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      "App Version 8.2.0",
                      style: GoogleFonts.roboto()
                          .copyWith(color: HexColor("414141"), fontSize: 9),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical:5),
                    child: CustomButtonWithoutBold(
                      textColor: Colors.white,
                      textValue: "Call to Customer Support",
                      buttonColor: HexColor("1BCB5D"),
                      onPressed: () {
                        String? number =  '+923332275275';
                        final url = "tel:$number";
                        launchUrl(Uri.parse(url));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
