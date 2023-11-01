import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saholatkar/Repositories/AccountLevel/account_level_repo.dart';
import 'package:saholatkar/model/accountLevel/account_level.dart';
import 'package:saholatkar/model/accountLevel/appointment.dart';
import 'package:saholatkar/model/userProfile/user_profile.dart';

import '../../model/InstallmentRequestBody.dart';

class RequestFormStepperController extends GetxController {
  ScrollController scrollController = ScrollController();
  //Request Form Start
  bool isLoading = false;
  final requestFormKey = GlobalKey<FormState>();
  final requestFormApplicantNameController = TextEditingController();
  final requestFormFatherNameController = TextEditingController();
  final requestFormIdCardController = TextEditingController();
  final requestFormDobController = TextEditingController();
  final requestFormPermanentAddressController = TextEditingController();
  final requestFormCurrentAddressController = TextEditingController();
  final requestFormApplicantPositionController = TextEditingController();
  final requestFormApplicantDurationController = TextEditingController();
  final requestFormPhoneController = TextEditingController();
  final requestFormPreviousWorkAddressController = TextEditingController();
  final requestFormCurrentWorkAddressController = TextEditingController();
  final requestFormWorkPositionController = TextEditingController();
  final requestFormWorktDurationController = TextEditingController();
  final requestFormWorkPhoneController = TextEditingController();
  final requestFormOccupationController = TextEditingController();
  final requestFormMonthlyIncomeController = TextEditingController();
  final requestFormFineController = TextEditingController();
  final requestFormInstallmentProductsController = TextEditingController();
  final requestFormOrganizationController = TextEditingController();
  final requestFormRentalProductsController = TextEditingController();
  final requestFormModelController = TextEditingController();
  final requestFormSerialController = TextEditingController();
  final requestFormFirstInstallmentController = TextEditingController();
  final requestFormSellingPriceController = TextEditingController();
  final requestFormMonthlyInstallmentController = TextEditingController();
  final requestFormPendingController = TextEditingController();
  final requestFormThumbController = TextEditingController();

//maried checkBox
  var married = false;
  var unMarried = false;
  var isMarried = false;
//maried checkBox

// have you buy anthing before
  var buyYes = false;
  var buyNo = false;
  var haveYouBuy = false;
// have you buy anthing before

//Request form checkBox Start
  var REFR = false;
  var CHQ = false;
  var PTO = false;

  setREFR(bool val){
    REFR = val;
    update();
  }
  setCHQ(bool val){
    CHQ = val;
    update();
  }
  setPTO(bool val){
    PTO = val;
    update();
  }
//Request form checkBox End

  checkMarried(bool status) {
    if (status) {
      unMarried = false;
      isMarried = true;
      update();
    }
  }

  checkUnMarried(bool status) {
    if (status) {
      married = false;
      isMarried = false;
      update();
    }
  }

  checkBuyYes(bool haveBuy) {
    if (haveBuy) {
      buyNo = false;
      haveYouBuy = true;
      update();
    }
  }

  checkBuyNo(bool haveBuy) {
    if (haveBuy) {
      buyYes = false;
      haveYouBuy = false;
      update();
    }
  }

//Request Form End

//Guaranter1 Form start
  final guaranter1FormKey = GlobalKey<FormState>();
  final guaranter1FormApplicantNameController = TextEditingController();
  final guaranter1FormFatherNameController = TextEditingController();
  final guaranter1FormIdCardController = TextEditingController();
  final guaranter1FormDobController = TextEditingController();
  final guaranter1FormHouseAddressController = TextEditingController();
  final guaranter1FormPositionController = TextEditingController();
  final guaranter1FormDurationController = TextEditingController();
  final guaranter1FormRelationController = TextEditingController();
  final guaranter1FormPhoneController = TextEditingController();
  final guaranter1FormWorkAddressController = TextEditingController();
  final guaranter1FormWorkPhoneController = TextEditingController();
  final guaranter1WorkPositionController = TextEditingController();
  final guaranter1WorkDurationController = TextEditingController();
  final guaranter1FormWorkPhone2Controller = TextEditingController();
  final guaranter1FormOccupationController = TextEditingController();
  final guaranter1FormMonthlyInstallmentController = TextEditingController();
  final guaranter1FormPreviousAccountController = TextEditingController();
  final guaranter1FormThumbController = TextEditingController();

//Guaranter1 maried checkBox start
  var guaranter1married = false;
  var guaranter1UnMarried = false;
  var isGuaranter1Married = false;
//Guaranter1 maried checkBox End

  checkGuaranter1Married(bool status) {
    if (status) {
      guaranter1UnMarried = false;
      isGuaranter1Married = true;
      update();
    }
  }

  checkGuaranter1UnMarried(bool status) {
    if (status) {
      guaranter1married = false;
      isGuaranter1Married = false;
      update();
    }
  }

//Guaranter1 Form End

//Guaranter2 Form start
  final guaranter2FormKey = GlobalKey<FormState>();
  final guaranter2FormApplicantNameController = TextEditingController();
  final guaranter2FormFatherNameController = TextEditingController();
  final guaranter2FormIdCardController = TextEditingController();
  final guaranter2FormDobController = TextEditingController();
  final guaranter2FormHouseAddressController = TextEditingController();
  final guaranter2FormPositionController = TextEditingController();
  final guaranter2FormDurationController = TextEditingController();
  final guaranter2FormRelationController = TextEditingController();
  final guaranter2FormPhoneController = TextEditingController();
  final guaranter2FormWorkAddressController = TextEditingController();
  final guaranter2FormWorkPhoneController = TextEditingController();
  final guaranter2WorkPositionController = TextEditingController();
  final guaranter2WorkDurationController = TextEditingController();
  final guaranter2FormWorkPhone2Controller = TextEditingController();
  final guaranter2FormOccupationController = TextEditingController();
  final guaranter2FormMonthlyInstallmentController = TextEditingController();
  final guaranter2FormPreviousAccountController = TextEditingController();
  final guaranter2FormThumbController = TextEditingController();

//Guaranter2 maried checkBox start
  var guaranter2married = false;
  var guaranter2UnMarried = false;
  var isGuaranter2Married = false;
//Guaranter2 maried checkBox End

  checkGuaranter2Married(bool status) {
    if (status) {
      guaranter2UnMarried = false;
      isGuaranter2Married = true;
      update();
    }
  }

  checkGuaranter2UnMarried(bool status) {
    if (status) {
      guaranter2married = false;
      isGuaranter2Married = false;
      update();
    }
  }

//Guaranter2 Form End

//Declare Form start
  final declareFormKey = GlobalKey<FormState>();
  final declareRemarksInquiryController = TextEditingController();
   final declareBankController = TextEditingController();
  final declareCheckCountController = TextEditingController();
  final declareMublighController = TextEditingController();
  final declareInquiryOfficerController = TextEditingController();
  final declareInquiryOfficerSignatureController = TextEditingController();
  final declareCRCController = TextEditingController();
  final declareCRCSignatureController = TextEditingController();
  final declareApprovalManagerAController = TextEditingController();
  final declareApprovalManagerASignatureController = TextEditingController();
  final declareASMController = TextEditingController();
  final declareASMSignatureController = TextEditingController();
  final declareApprovalManagerBController = TextEditingController();
  final declareApprovalManagerBSignatureController = TextEditingController();
  final declareRSMController = TextEditingController();
  final declareRSMSignatureController = TextEditingController();
  final declareOtherController = TextEditingController();
  final declareOtherSignatureController = TextEditingController();
  final declareCRCHeadController = TextEditingController();
  final declareCRCHeadSignatureController = TextEditingController();

//Declare Check checkBox start
  var declareCheckYes = false;
  var declareCheckNo = false;
  var isDeclareCheck = false;

  checkDeclareCheckYes(bool status) {
    if (status) {
      declareCheckNo = false;
      isDeclareCheck = true;
      update();
    }
  }

  checkDeclareCheckNo(bool status) {
    if (status) {
      declareCheckYes = false;
      isDeclareCheck = false;
      update();
    }
  }

//DeclareForm Check checkBox End

//DeclareForm Verify checkBox start
  var declareVerifyYes = false;
  var declareVerifyNo = false;
  var isDeclareVerify = false;

  checkDeclareVerifyYes(bool status) {
    if (status) {
      declareVerifyNo = false;
      isDeclareVerify = true;
      update();
    }
  }

  checkDeclareVerifyNo(bool status) {
    if (status) {
      declareVerifyYes = false;
      isDeclareVerify = false;
      update();
    }
  }

//DeclareForm Verify checkBox End

//DeclareForm End

  final apiClient = AccountLevelRepo();
  late ProfileData profileData;
  @override
  void onInit() {
    // getProfile();
    super.onInit();
  }

  Future<void> addPersonal(
      String name, String email, String mobile, String address) async {
    final appointmentModel =
        Appointment(name: name, email: email, mobile: mobile, address: address);
    print(appointmentModel);
    await apiClient.addPersonal(appointmentModel).then((response) {
      if (response != null) {
        var result = json.decode(response);
        var success = result["success"];
        var message = result["message"];
        if (success == true) {
          // Get.back() to hide loading indicator dialouge
          Get.back();
          Get.snackbar("Message", message[0].toString());
        } else {
          Get.back();
          Get.snackbar("Message", message[0].toString());
        }
      }
    });
  }
  Future<void> installmentRequest(InstallmentRequestBody body) async {

    await apiClient.makeInstallmentRequest(body).then((response) {
      print('$response');
      if (response != null) {
        var result = json.decode(response);
        var success = result["Status"];
        var message = result["message"];
        if (success == 'Success') {
          Get.back();
          Get.snackbar("Message", message.toString());
        } else {
          Get.back();
          Get.snackbar("Message", message.toString());
        }
      }else{
        Get.snackbar("Message", 'Internal Server Error');
      }
    });
  }


  initFormData(PersonalData personal) {
    // emailController.text = personal.email ?? "";
    // fullnameController.text = personal.name ?? "";
    // phoneController.text = personal.mobile ?? "";
    // addressController.text = personal.address ?? "";
    update();
  }

  clearForm() {
    requestFormApplicantNameController.clear();
    requestFormFatherNameController.clear();
    requestFormIdCardController.clear();
    requestFormDobController.clear();
    requestFormPermanentAddressController.clear();
    requestFormCurrentAddressController.clear();
    requestFormApplicantPositionController.clear();
    requestFormApplicantDurationController.clear();
    requestFormPhoneController.clear();
    requestFormPreviousWorkAddressController.clear();
    requestFormCurrentWorkAddressController.clear();
    requestFormWorkPositionController.clear();
    requestFormWorktDurationController.clear();
    requestFormWorkPhoneController.clear();
    requestFormOccupationController.clear();
    requestFormMonthlyIncomeController.clear();
    requestFormFineController.clear();
    requestFormInstallmentProductsController.clear();
    requestFormOrganizationController.clear();
    requestFormRentalProductsController.clear();
    requestFormModelController.clear();
    requestFormSerialController.clear();
    requestFormFirstInstallmentController.clear();
    requestFormSellingPriceController.clear();
    requestFormMonthlyInstallmentController.clear();
    requestFormPendingController.clear();
    requestFormThumbController.clear();
    guaranter1FormApplicantNameController.clear();
    guaranter1FormFatherNameController.clear();
    guaranter1FormIdCardController.clear();
    guaranter1FormDobController.clear();
    guaranter1FormHouseAddressController.clear();
    guaranter1FormPositionController.clear();
    guaranter1FormDurationController.clear();
    guaranter1FormRelationController.clear();
    guaranter1FormPhoneController.clear();
    guaranter1FormWorkAddressController.clear();
    guaranter1FormWorkPhoneController.clear();
    guaranter1WorkPositionController.clear();
    guaranter1WorkDurationController.clear();
    guaranter1FormWorkPhone2Controller.clear();
    guaranter1FormOccupationController.clear();
    guaranter1FormMonthlyInstallmentController.clear();
    guaranter1FormPreviousAccountController.clear();
    guaranter1FormThumbController.clear();
    guaranter2FormApplicantNameController.clear();
    guaranter2FormFatherNameController.clear();
    guaranter2FormIdCardController.clear();
    guaranter2FormDobController.clear();
    guaranter2FormHouseAddressController.clear();
    guaranter2FormPositionController.clear();
    guaranter2FormDurationController.clear();
    guaranter2FormRelationController.clear();
    guaranter2FormPhoneController.clear();
    guaranter2FormWorkAddressController.clear();
    guaranter2FormWorkPhoneController.clear();
    guaranter2WorkPositionController.clear();
    guaranter2WorkDurationController.clear();
    guaranter2FormWorkPhone2Controller.clear();
    guaranter2FormOccupationController.clear();
    guaranter2FormMonthlyInstallmentController.clear();
    guaranter2FormPreviousAccountController.clear();
    guaranter2FormThumbController.clear();
    declareRemarksInquiryController.clear();
    declareBankController.clear();
    declareCheckCountController.clear();
    declareMublighController.clear();
    declareInquiryOfficerController.clear();
    declareInquiryOfficerSignatureController.clear();
    declareCRCController.clear();
    declareCRCSignatureController.clear();
    declareApprovalManagerAController.clear();
    declareApprovalManagerASignatureController.clear();
    declareASMController.clear();
    declareASMSignatureController.clear();
    declareApprovalManagerBController.clear();
    declareApprovalManagerBSignatureController.clear();
    declareRSMController.clear();
    declareRSMSignatureController.clear();
    declareOtherController.clear();
    declareOtherSignatureController.clear();
    declareCRCHeadController.clear();
    declareCRCHeadSignatureController.clear();
  }

  @override
  void dispose() {
    // fullnameController.dispose();
    // phoneController.dispose();
    // addressController.dispose();
    // phoneController.dispose();
    // emailController.dispose();

    super.dispose();
  }
}
