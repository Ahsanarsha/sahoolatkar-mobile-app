import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:saholatkar/const/fonts.dart';
import 'package:saholatkar/const/theme.dart';
import 'package:saholatkar/controller/RequestForm/request_form_controller.dart';
import 'package:saholatkar/controller/Trasnlation/translation_controller.dart';
import 'package:saholatkar/widgets/CommonWidgets/common_widgets/common_widgets.dart';
import 'package:saholatkar/widgets/custom_big_header.dart';
import 'package:saholatkar/widgets/grey_divider.dart';

import '../../../utility/validate.dart';

class DeclarationsForm extends StatefulWidget {
  const DeclarationsForm({Key? key}) : super(key: key);

  @override
  State<DeclarationsForm> createState() => _DeclarationsFormState();
}

class _DeclarationsFormState extends State<DeclarationsForm> {
  final TranslationController _translationController =
      Get.find<TranslationController>();
  bool value = true;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestFormStepperController>(
      // init: RequestFormStepperController(),
      builder: (requestFormStepperController) => Form(
        key: requestFormStepperController.declareFormKey,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Center(
                child: CustomeBigHeader(
              title: "RenterDeclaration".tr,
              color: loginButtonColor,
            )),
          ),
          const SizedBox(height: 15),
          Text.rich(TextSpan(
              style: GoogleFonts.roboto().copyWith(
                color: HexColor("414141"),
                fontSize: 14,
                fontFamily:
                    _translationController.selectedLanguage.value == "ur"
                        ? formUrduFont
                        : null,
              ),
              text: 'Iacceptthat'.tr,
              children: <InlineSpan>[
                TextSpan(
                  text: 'SaholatKar'.tr,
                  style: GoogleFonts.roboto().copyWith(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    backgroundColor: loginButtonColor,
                    fontFamily:
                        _translationController.selectedLanguage.value == "ur"
                            ? formUrduFont
                            : null,
                  ),
                ),
                TextSpan(
                  text: 'TextAFterSaholatKar'.tr,
                  style: GoogleFonts.roboto().copyWith(
                    color: HexColor("414141"),
                    fontSize: 14,
                    fontFamily:
                        _translationController.selectedLanguage.value == "ur"
                            ? formUrduFont
                            : null,
                  ),
                ),
              ])),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              formFieldTitle(title: "RemarksInquiryOfficer".tr),
              const SizedBox(height: 10),
              Container(
                height: 44,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextFormField(
                  controller: requestFormStepperController
                      .declareRemarksInquiryController,
                  // validator: (value) =>
                  //     validateField(value: value!, fieldName: "Full Name"),
                  onSaved: (value) {},

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
          const SizedBox(height: 10),
          const GreyDivider(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              formFieldTitle(title: "Check".tr),
              const SizedBox(height: 5),
              Row(
                children: <Widget>[
                  const SizedBox(
                    width: 10,
                  ), //SizedBox
                  Text(
                    'Yes'.tr,
                    style: TextStyle(
                      fontSize: 17.0,
                      fontFamily:
                          _translationController.selectedLanguage.value == "ur"
                              ? formUrduFont
                              : null,
                    ),
                  ), //Text
                  const SizedBox(width: 10),

                  Checkbox(
                    value: requestFormStepperController.declareCheckYes,
                    onChanged: (bool? value) {
                      requestFormStepperController.declareCheckYes = value!;
                      requestFormStepperController.checkDeclareCheckYes(value);
                    },
                  ),

                  const SizedBox(
                    width: 10,
                  ), //SizedBox
                  Text(
                    'No'.tr,
                    style: TextStyle(
                      fontSize: 17.0,
                      fontFamily:
                          _translationController.selectedLanguage.value == "ur"
                              ? formUrduFont
                              : null,
                    ),
                  ), //Text
                  const SizedBox(width: 10),

                  Checkbox(
                    value: requestFormStepperController.declareCheckNo,
                    onChanged: (bool? value) {
                      requestFormStepperController.declareCheckNo = value!;
                      requestFormStepperController.checkDeclareCheckNo(value);
                    },
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              formFieldTitle(title: "Bank".tr),
              const SizedBox(height: 10),
              Container(
                height: 44,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextFormField(
                  controller:
                      requestFormStepperController.declareBankController,
                  validator: (value) =>
                      validateField(value: value!, fieldName: "Field is required"),
                  onSaved: (value) {},

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
          const SizedBox(height: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              formFieldTitle(title: "Verify".tr),
              const SizedBox(height: 5),
              Row(
                children: <Widget>[
                  const SizedBox(
                    width: 10,
                  ), //SizedBox
                  Text(
                    'Yes'.tr,
                    style: TextStyle(
                      fontSize: 17.0,
                      fontFamily:
                          _translationController.selectedLanguage.value == "ur"
                              ? formUrduFont
                              : null,
                    ),
                  ), //Text
                  const SizedBox(width: 10),

                  Checkbox(
                    value: requestFormStepperController.declareVerifyYes,
                    onChanged: (bool? value) {
                      requestFormStepperController.declareVerifyYes = value!;
                      requestFormStepperController.checkDeclareVerifyYes(value);
                    },
                  ),

                  const SizedBox(
                    width: 10,
                  ), //SizedBox
                  Text(
                    'No'.tr,
                    style: TextStyle(
                      fontSize: 17.0,
                      fontFamily:
                          _translationController.selectedLanguage.value == "ur"
                              ? formUrduFont
                              : null,
                    ),
                  ), //Text
                  const SizedBox(width: 10),

                  Checkbox(
                    value: requestFormStepperController.declareVerifyNo,
                    onChanged: (bool? value) {
                      requestFormStepperController.declareVerifyNo = value!;
                      requestFormStepperController.checkDeclareVerifyNo(value);
                    },
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    formFieldTitle(title: "CheckCount".tr),
                    const SizedBox(height: 10),
                    Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextFormField(
                        controller: requestFormStepperController
                            .declareCheckCountController,
                        // validator: (value) =>
                        //     validateField(value: value!, fieldName: "Full Name"),
                        onSaved: (value) {},
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
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    formFieldTitle(title: "Mubligh".tr),
                    const SizedBox(height: 10),
                    Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextFormField(
                        controller: requestFormStepperController
                            .declareMublighController,
                        // validator: (value) =>
                        //     validateField(value: value!, fieldName: "Full Name"),
                        onSaved: (value) {},
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
          const SizedBox(height: 10),
          const GreyDivider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    formFieldTitle(title: "InquiryOfficer".tr),
                    const SizedBox(height: 10),
                    Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextFormField(
                        controller: requestFormStepperController
                            .declareInquiryOfficerController,
                        // validator: (value) =>
                        //     validateField(value: value!, fieldName: "Full Name"),
                        onSaved: (value) {},

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
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    formFieldTitle(title: "Signature".tr),
                    const SizedBox(height: 10),
                    Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextFormField(
                        controller: requestFormStepperController
                            .declareInquiryOfficerSignatureController,
                        // validator: (value) =>
                        //     validateField(value: value!, fieldName: "Full Name"),
                        onSaved: (value) {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    formFieldTitle(title: "CRC"),
                    const SizedBox(height: 10),
                    Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextFormField(
                        controller:
                            requestFormStepperController.declareCRCController,
                        // validator: (value) =>
                        //     validateField(value: value!, fieldName: "Full Name"),
                        onSaved: (value) {},

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
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    formFieldTitle(title: "Signature".tr),
                    const SizedBox(height: 10),
                    Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextFormField(
                        controller: requestFormStepperController
                            .declareCRCSignatureController,
                        // validator: (value) =>
                        //     validateField(value: value!, fieldName: "Full Name"),
                        onSaved: (value) {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const GreyDivider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    formFieldTitle(title: "ApprovalManagerA".tr),
                    const SizedBox(height: 10),
                    Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextFormField(
                        controller: requestFormStepperController
                            .declareApprovalManagerAController,
                        // validator: (value) =>
                        //     validateField(value: value!, fieldName: "Full Name"),
                        onSaved: (value) {},

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
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    formFieldTitle(title: "Signature".tr),
                    const SizedBox(height: 10),
                    Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextFormField(
                        controller: requestFormStepperController
                            .declareApprovalManagerASignatureController,
                        // validator: (value) =>
                        //     validateField(value: value!, fieldName: "Full Name"),
                        onSaved: (value) {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    formFieldTitle(title: "ASM"),
                    const SizedBox(height: 10),
                    Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextFormField(
                        controller:
                            requestFormStepperController.declareASMController,
                        // validator: (value) =>
                        //     validateField(value: value!, fieldName: "Full Name"),
                        onSaved: (value) {},

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
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    formFieldTitle(title: "Signature".tr),
                    const SizedBox(height: 10),
                    Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextFormField(
                        controller: requestFormStepperController
                            .declareASMSignatureController,
                        // validator: (value) =>
                        //     validateField(value: value!, fieldName: "Full Name"),
                        onSaved: (value) {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const GreyDivider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    formFieldTitle(title: "ApprovalManagerB".tr),
                    const SizedBox(height: 10),
                    Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextFormField(
                        controller: requestFormStepperController
                            .declareApprovalManagerBController,
                        // validator: (value) =>
                        //     validateField(value: value!, fieldName: "Full Name"),
                        onSaved: (value) {},

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
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    formFieldTitle(title: "Signature".tr),
                    const SizedBox(height: 10),
                    Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextFormField(
                        controller: requestFormStepperController
                            .declareApprovalManagerBSignatureController,
                        // validator: (value) =>
                        //     validateField(value: value!, fieldName: "Full Name"),
                        onSaved: (value) {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    formFieldTitle(title: "RSM"),
                    const SizedBox(height: 10),
                    Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextFormField(
                        controller:
                            requestFormStepperController.declareRSMController,
                        // validator: (value) =>
                        //     validateField(value: value!, fieldName: "Full Name"),
                        onSaved: (value) {},

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
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    formFieldTitle(title: "Signature".tr),
                    const SizedBox(height: 10),
                    Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextFormField(
                        controller: requestFormStepperController
                            .declareRSMSignatureController,
                        // validator: (value) =>
                        //     validateField(value: value!, fieldName: "Full Name"),
                        onSaved: (value) {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const GreyDivider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    formFieldTitle(title: "Other".tr),
                    const SizedBox(height: 10),
                    Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextFormField(
                        controller:
                            requestFormStepperController.declareOtherController,
                        // validator: (value) =>
                        //     validateField(value: value!, fieldName: "Full Name"),
                        onSaved: (value) {},

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
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    formFieldTitle(title: "Signature".tr),
                    const SizedBox(height: 10),
                    Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextFormField(
                        controller: requestFormStepperController
                            .declareOtherSignatureController,
                        // validator: (value) =>
                        //     validateField(value: value!, fieldName: "Full Name"),
                        onSaved: (value) {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    formFieldTitle(title: "CRC Head"),
                    const SizedBox(height: 10),
                    Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextFormField(
                        controller: requestFormStepperController
                            .declareCRCHeadController,
                        // validator: (value) =>
                        //     validateField(value: value!, fieldName: "Full Name"),
                        onSaved: (value) {},

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
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    formFieldTitle(title: "Signature".tr),
                    const SizedBox(height: 10),
                    Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextFormField(
                        controller: requestFormStepperController
                            .declareCRCHeadSignatureController,
                        // validator: (value) =>
                        //     validateField(value: value!, fieldName: "Full Name"),
                        onSaved: (value) {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
        ]),
      ),
    );
  }
}
