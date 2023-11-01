import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:saholatkar/const/fonts.dart';
import 'package:saholatkar/const/theme.dart';
import 'package:saholatkar/controller/RequestForm/request_form_controller.dart';
import 'package:saholatkar/controller/Trasnlation/translation_controller.dart';
import 'package:saholatkar/helper/BlocUserProfile.dart';
import 'package:saholatkar/model/PlaceOrderBody.dart';
import 'package:saholatkar/model/menu/menu_item.dart';
import 'package:saholatkar/view/RequestForm/components/declarations.dart';
import 'package:saholatkar/view/RequestForm/components/guranted_form_screen.dart';
import 'package:saholatkar/view/RequestForm/request_form_screen.dart';
import 'package:saholatkar/widgets/back_navigator_without_text.dart';

import '../../../model/InstallmentRequestBody.dart';

class FormStepper extends StatefulWidget {
  String? productId,duration,advance,monthlyInstallment;
   FormStepper({Key? key,this.productId,this.duration,this.advance,this.monthlyInstallment}) : super(key: key);

  @override
  State<FormStepper> createState() => _FormStepperState();
}

class _FormStepperState extends State<FormStepper> {
  final TranslationController _translationController =
      Get.put(TranslationController());

  final RequestFormStepperController requestFormStepperController = Get.find<RequestFormStepperController>();

  int _currentStep = 0;
  StepperType stepperType = StepperType.horizontal;
  Applicant? applicantData;
  Granter1? granterOneData;
  Granter2? granterTwoData;
  Declaration? declarationData;
  InstallmentRequestBody body = InstallmentRequestBody();
  @override
  void initState() {
    // print('object');
    // requestFormStepperController.scrollController.addListener(() {
    //   if(requestFormStepperController.scrollController.offset==requestFormStepperController.scrollController.position.maxScrollExtent){
    //     requestFormStepperController.scrollController.jumpTo(0);
    //     print('asda');
    //     setState(() {});
    //   }
    // });
    super.initState();
  }
// Page
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async {
         _translationController.changeLanguage = "en_US";
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          // elevation: 0.0,
          leading: GestureDetector(
              onTap: () {
                _translationController.changeLanguage = "en_US";
                Navigator.of(context).pop();
              },
              child: const BackNavigatorWithoutText()),
          backgroundColor: Colors.white,
          title: Text(
            "RequestForm".tr,
            style: TextStyle(
              color: Colors.black,
              fontFamily: _translationController.selectedLanguage.value == "ur"
                  ? formUrduFont
                  : null,
            ),
          ),
          actions: [
            PopupMenuButton(
              tooltip: "Select language",
              icon: ImageIcon(
                const AssetImage("assets/images/language.png"),
                color: loginButtonColor,
                size: 35,
              ),
              onSelected: (int index) {
                if (index == 0) {
                  _translationController.changeLanguage = "en_US";

                }
                if (index == 1) {
                  _translationController.changeLanguage = "ur";
                }
              },
              initialValue: 2,
              itemBuilder: (context) {
                return List.generate(menuList.length, (index) {
                  var language = menuList[index];
                  return PopupMenuItem(
                    value: index,
                    child: Text(language.name),
                  );
                });
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Stepper(
                type: stepperType,
                physics: const ScrollPhysics(),
                currentStep: _currentStep,
                onStepTapped: (step) => tapped(step),
                controlsBuilder:
                    (BuildContext context, ControlsDetails details) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        onPressed: cancel,
                        child: const Text('CANCEL'),
                      ),
                      TextButton(
                        onPressed: continued,
                        child: Text(_currentStep == 1 ? 'SUBMIT' : 'NEXT'),
                      ),
                    ],
                  );
                },
                steps: <Step>[
                  Step(
                    title: Text('Request'.tr,
                        style: TextStyle(
                            fontFamily:
                                _translationController.selectedLanguage.value ==
                                        "ur"
                                    ? formUrduFont
                                    : null)),
                    content:  const RequestFormScreen(),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 0
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: Text('Guarantor'.tr,
                        style: TextStyle(
                            fontFamily:
                                _translationController.selectedLanguage.value ==
                                        "ur"
                                    ? formUrduFont
                                    : null)),
                    content:  const GuaranteedtFormScreen(),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 1
                        ? StepState.complete
                        : StepState.disabled,
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }



  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    if(widget.productId != null) {
      if (_currentStep == 0) {
        if (requestFormStepperController.requestFormKey.currentState!
            .validate()) {
          applicantData = Applicant(
            name: requestFormStepperController
                .requestFormApplicantNameController.text,
            fatherName: requestFormStepperController
                .requestFormFatherNameController.text,
            cnic: requestFormStepperController.requestFormIdCardController.text,
            dob: requestFormStepperController.requestFormDobController.text,
            pAddress: requestFormStepperController
                .requestFormPermanentAddressController.text,
            cAddress: requestFormStepperController
                .requestFormCurrentAddressController.text,
            businesPosition: requestFormStepperController
                .requestFormApplicantPositionController.text,
            duration: requestFormStepperController
                .requestFormApplicantDurationController.text,
            mobile:
                requestFormStepperController.requestFormPhoneController.text,
            preOfficeAddress: requestFormStepperController
                .requestFormPreviousWorkAddressController.text,
            currOfficeAddress: requestFormStepperController
                .requestFormCurrentWorkAddressController.text,
            position: requestFormStepperController
                .requestFormWorkPositionController.text,
            businesDuration: requestFormStepperController
                .requestFormWorktDurationController.text,
            businesMobile: requestFormStepperController
                .requestFormWorkPhoneController.text,
            occupation: requestFormStepperController
                .requestFormOccupationController.text,
            monthlyIncome: requestFormStepperController
                .requestFormMonthlyIncomeController.text,
            fine: '',// requestFormStepperController.requestFormFineController.text,
            prodName: requestFormStepperController
                .requestFormInstallmentProductsController.text,
            oraganiztion: requestFormStepperController
                .requestFormOrganizationController.text,
            rentalPrroductName: requestFormStepperController
                .requestFormRentalProductsController.text,
            modelNO:
                requestFormStepperController.requestFormModelController.text,
            srNO: requestFormStepperController.requestFormSerialController.text,
            firstInstallment: requestFormStepperController
                .requestFormFirstInstallmentController.text,
            sellingPrice: requestFormStepperController
                .requestFormSellingPriceController.text,
            monthlyInstallment: requestFormStepperController
                .requestFormMonthlyInstallmentController.text,
            pendingAmount:
                requestFormStepperController.requestFormPendingController.text,
            signature:
                requestFormStepperController.requestFormThumbController.text,
            mStatus: requestFormStepperController.married.toString(),
            isBuy: requestFormStepperController.haveYouBuy.toString(),
          );

          _currentStep < 2 ? setState(() => _currentStep += 1) : null;
        }
      }

      if (_currentStep == 1) {
        if (requestFormStepperController.guaranter1FormKey.currentState!
                .validate() &&
            requestFormStepperController.guaranter2FormKey.currentState!
                .validate()) {
          granterOneData = Granter1(
            name: requestFormStepperController
                .guaranter1FormApplicantNameController.text,
            fatherName: requestFormStepperController
                .guaranter1FormFatherNameController.text,
            cnic: requestFormStepperController
                .guaranter1FormIdCardController.text,
            dob: requestFormStepperController.guaranter1FormDobController.text,
            houseAddress: requestFormStepperController
                .guaranter1FormHouseAddressController.text,
            position: requestFormStepperController
                .guaranter1FormPositionController.text,
            duration: requestFormStepperController
                .guaranter1FormDurationController.text,
            relation: requestFormStepperController
                .guaranter1FormRelationController.text,
            mobile:
                requestFormStepperController.guaranter1FormPhoneController.text,
            workAddress: requestFormStepperController
                .guaranter1FormWorkAddressController.text,
            workMobile: requestFormStepperController
                .guaranter1FormWorkPhoneController.text,
            workPosition: requestFormStepperController
                .guaranter1WorkPositionController.text,
            workDuration: requestFormStepperController
                .guaranter1WorkDurationController.text,
            workMobile1: requestFormStepperController
                .guaranter1FormWorkPhone2Controller.text,
            occupation: requestFormStepperController
                .guaranter1FormOccupationController.text,
            monthlyInstallment: requestFormStepperController
                .guaranter1FormMonthlyInstallmentController.text,
            preAccount: requestFormStepperController
                .guaranter1FormPreviousAccountController.text,
            signature:
                requestFormStepperController.guaranter1FormThumbController.text,
            mStatus:
                requestFormStepperController.isGuaranter1Married.toString(),
          );
          granterTwoData = Granter2(
            name: requestFormStepperController
                .guaranter2FormApplicantNameController.text,
            fatherName: requestFormStepperController
                .guaranter2FormFatherNameController.text,
            cnic: requestFormStepperController
                .guaranter2FormIdCardController.text,
            dob: requestFormStepperController.guaranter2FormDobController.text,
            houseAddress: requestFormStepperController
                .guaranter2FormHouseAddressController.text,
            position: requestFormStepperController
                .guaranter2FormPositionController.text,
            duration: requestFormStepperController
                .guaranter2FormDurationController.text,
            relation: requestFormStepperController
                .guaranter2FormRelationController.text,
            mobile:
                requestFormStepperController.guaranter2FormPhoneController.text,
            workAddress: requestFormStepperController
                .guaranter2FormWorkAddressController.text,
            workMobile: requestFormStepperController
                .guaranter2FormWorkPhoneController.text,
            workPosition: requestFormStepperController
                .guaranter2WorkPositionController.text,
            workDuration: requestFormStepperController
                .guaranter2WorkDurationController.text,
            workMobile1: requestFormStepperController
                .guaranter2FormWorkPhone2Controller.text,
            occupation: requestFormStepperController
                .guaranter2FormOccupationController.text,
            monthlyInstallment: requestFormStepperController
                .guaranter2FormMonthlyInstallmentController.text,
            preAccount: requestFormStepperController
                .guaranter2FormPreviousAccountController.text,
            signature:
                requestFormStepperController.guaranter2FormThumbController.text,
            mStatus:
                requestFormStepperController.isGuaranter2Married.toString(),
          );

          body = InstallmentRequestBody(
            userId: blocUserProfile.viewModelUser.data![0].id.toString(),
            productId: widget.productId,
            duration: widget.duration,
            advance: widget.advance,
            monthlyinstallment: widget.monthlyInstallment,
            applicant: applicantData,
            granter1: granterOneData,
            granter2: granterTwoData,
            declaration: declarationData,
          );

          log(jsonEncode(body));
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
          requestFormStepperController.installmentRequest(body).then((value) {
            _translationController.changeLanguage = "en_US";
            Navigator.pop(context);
          });
        }
      }
    }else{
      Get.snackbar('Message', 'Select Some Product');
    }
  }

  cancel() {
    print("CANCEL BUTTON==>$_currentStep");
    Navigator.pop(context);
    _translationController.changeLanguage = "en_US";
   // _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
    print("CANCEL BUTTON==>$_currentStep");
  }
}
