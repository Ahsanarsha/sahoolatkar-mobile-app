import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:saholatkar/const/theme.dart';
import 'package:saholatkar/controller/Trasnlation/translation_controller.dart';
import 'package:saholatkar/helper/BlocUserProfile.dart';
import 'package:saholatkar/model/DropDownsModel/number_of_shops.dart';
import 'package:saholatkar/model/DropDownsModel/shop_type.dart';
import 'package:saholatkar/utility/validate.dart';
import 'package:saholatkar/widgets/Dropdowns/Drop_Down_Shop.dart';
import 'package:saholatkar/widgets/back_navigator_without_text.dart';
import 'package:saholatkar/widgets/card_widget.dart';
import 'package:saholatkar/widgets/custom_big_header.dart';
import 'package:saholatkar/widgets/custome_button_without_bold.dart';
import 'package:saholatkar/widgets/grey_divider.dart';

import '../../controller/Merchant/become_merchant_controller.dart';
import '../../model/merchant/BecomeMerchantBody.dart';

class BecomeSaholatKarMerchantScreen extends StatefulWidget {
  const BecomeSaholatKarMerchantScreen({Key? key}) : super(key: key);

  @override
  State<BecomeSaholatKarMerchantScreen> createState() =>
      _BecomeSaholatKarMerchantScreenState();
}

class _BecomeSaholatKarMerchantScreenState
    extends State<BecomeSaholatKarMerchantScreen> {
  final _bankFormKey = GlobalKey<FormState>();
  MerchantController controller = Get.put(MerchantController());
  final cc =  Get.put(TranslationController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MerchantController>(
      builder:(_)=> WillPopScope(
        onWillPop: () async{
          await controller.clearFields();
          return true;
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            // elevation: 0.0,
            leading: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const BackNavigatorWithoutText()),
            backgroundColor: Colors.white,
            title: const Text(
              "Become SaholatKar Merchant",
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Form(
                key: _bankFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: CustomeBigHeader(
                          title: "Personal Information", color: loginButtonColor),
                    ),
                    const SizedBox(height: 25),
                    fieldTitle(title: "Full Name"),
                    const SizedBox(height: 10),
                    Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextFormField(
                        controller: controller.nameController,
                        onSaved: (value) {},
                        validator: (value) =>
                            validateField(value: value!, fieldName: "Full Name"),
                        decoration: InputDecoration(
                          hintText: '',
                          hintStyle: emailHint,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              color: textlightGrey,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                              color: textlightGrey,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    fieldTitle(title: "CNIC"),
                    const SizedBox(height: 10),
                    Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextFormField(
                        controller: controller.cnicController,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9|-]')),
                        ],
                        keyboardType: TextInputType.number,
                        onSaved: (value) {},
                        validator: (value) =>
                            validateField(value: value!, fieldName: "CNIC"),
                        decoration: InputDecoration(
                          hintText: '',
                          hintStyle: emailHint,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              color: textlightGrey,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                              color: textlightGrey,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    fieldTitle(title: "Phone"),
                    const SizedBox(height: 10),
                    Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),

                      child: TextFormField(
                        controller: controller.phoneController,
                        onSaved: (value) {},
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9|+]')),
                        ],
                        maxLength: 13,
                        validator: (value) =>
                            validateField(value: value!, fieldName: "Phone"),
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          counterText: "",
                          hintText: '',
                          hintStyle: emailHint,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              color: textlightGrey,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                              color: textlightGrey,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    fieldTitle(title: "Email"),
                    const SizedBox(height: 10),
                    Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextFormField(
                        controller:controller.emailController,
                        onSaved: (value) {},

                        validator: (value) => validateEmail(value),

                        decoration: InputDecoration(
                          hintText: '',
                          hintStyle: emailHint,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              color: textlightGrey,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                              color: textlightGrey,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    CustomeBigHeader(
                        title: "Business Information", color: loginButtonColor),
                    const SizedBox(height: 25),
                    fieldTitle(title: "Official Business Name (As per document)"),
                    const SizedBox(height: 10),
                    Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextFormField(
                        controller: controller.businessNameController,
                        onSaved: (value) {},
                        validator: (value) => validateField(
                            value: value!, fieldName: "Business Name"),
                        decoration: InputDecoration(
                          hintText: '',
                          hintStyle: emailHint,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              color: textlightGrey,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                              color: textlightGrey,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    fieldTitle(title: "Business Address"),
                    const SizedBox(height: 10),
                    Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextFormField(
                        controller: controller.businessAddressController,
                        onSaved: (value) {},
                        validator: (value) => validateField(
                            value: value!, fieldName: "Business Address"),

                        decoration: InputDecoration(
                          hintText: '',
                          hintStyle: emailHint,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              color: textlightGrey,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                              color: textlightGrey,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    fieldTitle(title: "Nature of Business"),
                    const SizedBox(height: 10),
                    Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextFormField(
                        controller: controller.natureController,
                        onSaved: (value) {},
                        validator: (value) => validateField(
                            value: value!, fieldName: "Nature of Business"),

                        decoration: InputDecoration(
                          hintText: '',
                          hintStyle: emailHint,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              color: textlightGrey,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                              color: textlightGrey,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const GreyDivider(),
                    const SizedBox(height: 15),
                    fieldTitle(title: "Business running years?"),
                    const SizedBox(height: 10),
                    Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextFormField(
                        controller:controller.yearsController,
                        onSaved: (value) {},
                        validator: (value) => validateField(
                            value: value!, fieldName: "years of Business"),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: '',
                          hintStyle: emailHint,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              color: textlightGrey,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                              color: textlightGrey,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              fieldTitle(title: "Number Of Shops"),
                              const SizedBox(height: 12.5),
                              SizedBox(
                                height: 44,
                                child: CardWidget(
                                  radius: 5,
                                  child: Padding(
                                      padding: const EdgeInsets.only(left: 15,right: 10),
                                      child: DropDownShop(
                                        fontSize: 14,
                                        isExpanded: true,
                                        locations: numberOfShopes,
                                        hintName: 'Number Of Shops',
                                        onChange: (inputValue) {
                                          controller.setShopNumber(inputValue.title.toString());
                                        },
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              fieldTitle(title: "Size of Shop"),
                              const SizedBox(height: 10),
                              Container(
                                height: 44,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: TextFormField(
                                  controller: controller.sizeController,
                                  // validator: (value) => validateRequestFormField(
                                  //     value: value!, fieldName: "Dob".tr),
                                  onSaved: (value) {},
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                  ],
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: '',
                                    hintStyle: emailHint,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide(
                                        color: textlightGrey,
                                        width: 1.0,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      borderSide: BorderSide(
                                        color: textlightGrey,
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              fieldTitle(title: "Shop Type"),
                              const SizedBox(height: 12.5),
                              SizedBox(
                                height: 44,
                                child: CardWidget(
                                  radius: 5,
                                  child: Padding(
                                      padding: const EdgeInsets.only(left: 15,right: 5),
                                      child: DropDownShop(
                                        fontSize: 14,
                                        isExpanded: true,
                                        locations: shopeType,
                                        hintName: 'Shop Type',
                                        onChange: (inputValue) {
                                          controller.setShopType(inputValue.title.toString());
                                        },
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              fieldTitle(title: "Monthly Rent"),
                              const SizedBox(height: 10),
                              Container(
                                height: 44,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: TextFormField(
                                  controller: controller.rentController,
                                  // validator: (value) => validateRequestFormField(
                                  //     value: value!, fieldName: "Dob".tr),
                                  onSaved: (value) {},
                                  inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                ],
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: '',
                                    hintStyle: emailHint,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide(
                                        color: textlightGrey,
                                        width: 1.0,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      borderSide: BorderSide(
                                        color: textlightGrey,
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    CustomeBigHeader(
                        title: "Mailing Address / Business Address",
                        color: loginButtonColor),
                    const SizedBox(height: 25),
                    fieldTitle(title: "Address"),
                    const SizedBox(height: 10),
                    Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextFormField(
                        controller: controller.addressController,
                        onSaved: (value) {},
                        validator: (value) =>
                            validateField(value: value!, fieldName: "Address"),
                        decoration: InputDecoration(
                          hintText: '',
                          hintStyle: emailHint,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              color: textlightGrey,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                              color: textlightGrey,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    fieldTitle(title: "City"),
                    const SizedBox(height: 10),
                    Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextFormField(
                        controller: controller.cityController,
                        onSaved: (value) {},
                        validator: (value) =>
                            validateField(value: value!, fieldName: "City"),

                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z\s]*$')),
                        ],
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: '',
                          hintStyle: emailHint,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              color: textlightGrey,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                              color: textlightGrey,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    CustomButtonWithoutBold(
                      textColor: Colors.white,
                      textValue: "SUBMIT",
                      buttonColor: HexColor("1BCB5D"),
                      onPressed: () async {
                            if (_bankFormKey.currentState!.validate()) {
                              showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (dialogContext) {
                                    return Center(
                                        child: SpinKitFadingCircle(
                                          color: loginButtonColor,
                                          size: 50,
                                        ));
                                  });

                                  PersonalInfo info = PersonalInfo(
                                    name: controller.nameController.text,
                                    cnic: controller.cnicController.text,
                                    email: controller.emailController.text,
                                    mobile: controller.phoneController.text
                                  );
                                  BusinessInfo businessInfo = BusinessInfo(
                                    officialName: controller.businessNameController.text,
                                    bsusinessAddress: controller.businessAddressController.text,
                                    nature: controller.natureController.text,
                                    bsusinessYears: controller.sizeController.text,
                                    shopNo: controller.numberShop,
                                    shopSize: controller.sizeController.text,
                                    ownership: controller.shopType,
                                    monthlyRent: controller.rentController.text
                                  );
                                  BusinessMailing mailing = BusinessMailing(
                                    address: controller.addressController.text,
                                    city: controller.cityController.text
                                  );
                                   BecomeMerchantBody body = BecomeMerchantBody(
                                     userId: blocUserProfile.viewModelUser.data![0].id.toString(),
                                     personalInfo: info,
                                     businessInfo: businessInfo,
                                     businessMailing: mailing
                                   );

                                   await controller.makeRequest(body);

                            }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget fieldTitle({required String title}) => Text(
        title,
        style: GoogleFonts.roboto(textStyle: productTitle)
            .copyWith(color: HexColor("414141")),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
}
