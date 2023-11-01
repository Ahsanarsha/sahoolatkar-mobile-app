import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saholatkar/controller/ProfileMenu/AccountLevel/account_level_controller.dart';
import 'package:saholatkar/controller/ProfileMenu/AccountLevel/bank_controller.dart';
import 'package:saholatkar/controller/ProfileMenu/AccountLevel/education_controller.dart';
import 'package:saholatkar/controller/ProfileMenu/AccountLevel/personal_controller.dart';
import 'package:saholatkar/const/theme.dart';
import 'package:saholatkar/view/Bank/bank_screen.dart';
import 'package:saholatkar/view/DrivingLicense/driving_license.dart';
import 'package:saholatkar/view/Education/education_screen.dart';
import 'package:saholatkar/view/LivePhoto/live_photo.dart';
import 'package:saholatkar/view/Personal/personal_screen.dart';
import 'package:saholatkar/view/UtilityBills/utility_bills_screen.dart';
import 'package:saholatkar/view/profile/components/list_tile_cell.dart';
import 'package:saholatkar/widgets/back_navigator_without_text.dart';

class AccountLevelScreen extends StatelessWidget {
   AccountLevelScreen({Key? key}) : super(key: key);
AccountLevelController controller = Get.put(AccountLevelController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountLevelController>(
      init: AccountLevelController(),
      builder: (accountLevelController) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const BackNavigatorWithoutText()),
          backgroundColor: Colors.white,
          title: const Text(
            "Account Level",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 12, right: 12, top: 30, bottom: 10),
                child:  !accountLevelController.isVerified ?  Row(
                  children: [
                    SvgPicture.asset(
                        "assets/svg_icons/account_level/not_verified_account.svg",
                        width: 17.91,
                        height: 17.91,
                        semanticsLabel: 'more'),
                    const SizedBox(width: 5),
                   Text(
                           'Not Verified',
                      style: GoogleFonts.roboto(textStyle: productTitle)
                          .copyWith(color: loginButtonColor),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ) :
                Row(
                  children: [
                    SvgPicture.asset(
                        "assets/svg_icons/account_level/verified_account.svg",
                        width: 17.91,
                        height: 17.91,
                        semanticsLabel: 'more'),
                    const SizedBox(width: 5),
                    Text(
                      'Verified',
                      style: GoogleFonts.roboto(textStyle: productTitle)
                          .copyWith(color: Colors.green),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
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
                        //         "assets/svg_icons/account_level/apointment.svg",
                        //     title: "Appointment",
                        //     isLastTile: false,
                        //     ontapFunction: () {
                        //       Navigator.push(
                        //           context,
                        //           MaterialPageRoute(
                        //               builder: (context) => GetBuilder<
                        //                       AppointmentController>(
                        //                   init: AppointmentController(),
                        //                   builder: (appointmentController) =>
                        //                       AppointmentScreen(
                        //                           appointment:
                        //                               accountLevelController
                        //                                   .accountLevelData
                        //                                   .appointment!))));
                        //     }),
                        ListTileCell(
                            iconLink:
                                "assets/svg_icons/account_level/personal.svg",
                            title: "Personal",
                            isLastTile: false,
                            ontapFunction: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          GetBuilder<PersonalController>(
                                              init: PersonalController(),
                                              builder: (personalController) =>
                                                  PersonalScreen(
                                                      personal:
                                                          accountLevelController
                                                              .accountLevelData
                                                              .personal!)))).then((value) => accountLevelController.getAccountLevelData());
                            }),
                        ListTileCell(
                            iconLink:
                                "assets/svg_icons/account_level/education.svg",
                            title: "Education",
                            isLastTile: false,
                            ontapFunction: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          GetBuilder<EducationController>(
                                              init: EducationController(),
                                              builder: (educationController) =>
                                                  EducationScreen(
                                                      education:
                                                          accountLevelController
                                                              .accountLevelData
                                                              .education!)))).then((value) => accountLevelController.getAccountLevelData());
                            }),
                        ListTileCell(
                            iconLink: "assets/svg_icons/account_level/bank.svg",
                            title: "Bank",
                            isLastTile: false,
                            ontapFunction: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          GetBuilder<BankController>(
                                              init: BankController(),
                                              builder: (bankController) =>
                                                  BankScreen(
                                                      bank:
                                                          accountLevelController
                                                              .accountLevelData
                                                              .bank!)))).then((value) => accountLevelController.getAccountLevelData());
                            }),
                        ListTileCell(
                            iconLink:
                                "assets/svg_icons/account_level/utility_bills.svg",
                            title: "Utility Bill",
                            isLastTile: false,
                            ontapFunction: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UtilityBillsScreen(
                                          utilitybill: accountLevelController
                                              .accountLevelData.utilitybill!))).then((value) => accountLevelController.getAccountLevelData());
                            }),
                        ListTileCell(
                            iconLink:
                                "assets/svg_icons/account_level/driving_license.svg",
                            title: "Driving License",
                            isLastTile: false,
                            ontapFunction: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DrivingLicenseScreen(
                                              drivingLicense:
                                                  accountLevelController
                                                      .accountLevelData
                                                      .drivingLicense!))).then((value) => accountLevelController.getAccountLevelData());;
                            }),
                        ListTileCell(
                            iconLink:
                                "assets/svg_icons/account_level/not_verified_photo.svg",
                            title: "Live Photo",
                            isLastTile: true,
                            ontapFunction: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LivePhotoScreen(
                                          livePhoto: accountLevelController
                                              .accountLevelData.livePhoto!))).then((value) => accountLevelController.getAccountLevelData());
                            }),

                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
