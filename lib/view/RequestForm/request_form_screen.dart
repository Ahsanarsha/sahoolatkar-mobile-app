import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:saholatkar/const/fonts.dart';
import 'package:saholatkar/const/theme.dart';
import 'package:saholatkar/controller/RequestForm/request_form_controller.dart';
import 'package:saholatkar/controller/Trasnlation/translation_controller.dart';
import 'package:saholatkar/utility/validate.dart';
import 'package:saholatkar/widgets/CommonWidgets/common_widgets/common_widgets.dart';
import 'package:saholatkar/widgets/grey_divider.dart';

class RequestFormScreen extends StatefulWidget {
  const RequestFormScreen({Key? key}) : super(key: key);

  @override
  State<RequestFormScreen> createState() => _RequestFormScreenState();
}

class _RequestFormScreenState extends State<RequestFormScreen> {
  final TranslationController _translationController =
      Get.find<TranslationController>();
  bool valueRefr = false;
  bool valueCHQ = false;
  bool valuePTO = false;
  final RequestFormStepperController requestFormStepperController = Get.find<RequestFormStepperController>();



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller:requestFormStepperController.scrollController ,
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: GetBuilder<RequestFormStepperController>(
            // init: RequestFormStepperController(),
            builder: (requestFormStepperController) => Form(
              key: requestFormStepperController.requestFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            formFieldTitle(title: "ApplicantName".tr),
                            const SizedBox(height: 10),
                            Container(
                              height: 44,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: TextFormField(
                                controller: requestFormStepperController
                                    .requestFormApplicantNameController,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (value) => validateRequestFormField(
                                    value: value!,
                                    fieldName: "ApplicantName".tr),
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
                            formFieldTitle(title: "FatherName".tr),
                            const SizedBox(height: 10),
                            Container(
                              height: 44,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: TextFormField(
                                controller: requestFormStepperController
                                    .requestFormFatherNameController,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (value) => validateRequestFormField(
                                    value: value!, fieldName: "FatherName".tr),
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
                  const SizedBox(height: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      formFieldTitle(title: "IdCard".tr),
                      const SizedBox(height: 10),
                      Container(
                        height: 44,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          controller: requestFormStepperController
                              .requestFormIdCardController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) => validateRequestFormField(
                              value: value!, fieldName: "IdCard".tr),
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9|-]')),
                          ],
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
                  const SizedBox(height: 15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            formFieldTitle(title: "Dob".tr),
                            const SizedBox(height: 10),
                            InkWell(
                              onTap: () {
                                _selectDate(context, DateTime.now(),requestFormStepperController);
                              },
                              child: Container(
                                height: 44,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: AbsorbPointer(
                                  absorbing: true,
                                  child: TextFormField(
                                    controller: requestFormStepperController
                                        .requestFormDobController,
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    validator: (value) => validateRequestFormField(
                                        value: value!, fieldName: "Dob".tr),
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
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      formFieldTitle(title: "PermanentAddress".tr),
                      const SizedBox(height: 10),
                      Container(
                        // height: 44,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          controller:  requestFormStepperController
                              .requestFormPermanentAddressController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          minLines: 1,
                          maxLines: 3,
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
                      formFieldTitle(title: "CurrentAddress".tr),
                      const SizedBox(height: 10),
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          minHeight: 40,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: TextFormField(
                            controller: requestFormStepperController
                                .requestFormCurrentAddressController,
                            // validator: (value) =>
                            //     validateField(value: value!, fieldName: "Full Name"),
                            onSaved: (value) {},
                            // keyboardType: TextInputType.number,
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
                            formFieldTitle(title: "Position".tr),
                            const SizedBox(height: 10),
                            Container(
                              height: 44,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: TextFormField(
                                controller: requestFormStepperController
                                    .requestFormApplicantPositionController,
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
                            formFieldTitle(title: "Duration".tr),
                            const SizedBox(height: 10),
                            Container(
                              height: 44,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: TextFormField(
                                controller: requestFormStepperController
                                    .requestFormApplicantDurationController,
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
                  const SizedBox(height: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      formFieldTitle(title: "Phone".tr),
                      const SizedBox(height: 10),
                      Container(
                        height: 44,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          controller: requestFormStepperController
                              .requestFormPhoneController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) => validateRequestFormField(
                              value: value!, fieldName: "Phone".tr),
                          onSaved: (value) {},
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9|+]')),
                          ],
                          keyboardType: TextInputType.phone,
                          maxLength: 13,
                          decoration: InputDecoration(
                            hintText: '',
                            counterText: '',
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
                      formFieldTitle(title: "MaritalStatus".tr),
                      const SizedBox(height: 5),
                      Row(
                        children: <Widget>[
                          const SizedBox(
                            width: 10,
                          ), //SizedBox
                          Text(
                            'Married'.tr,
                            style: const TextStyle(
                                fontSize: 17.0, fontFamily: formUrduFont),
                          ), //Text
                          const SizedBox(width: 10),

                          Checkbox(
                            shape: const CircleBorder(),
                            splashRadius: 20,
                            value: requestFormStepperController.married,
                            onChanged: (bool? value) {
                              // setState(() {
                              requestFormStepperController.married = value!;
                              requestFormStepperController.checkMarried(value);
                              // });
                            },
                          ),

                          const SizedBox(
                            width: 10,
                          ), //SizedBox
                          Text(
                            'UnMarried'.tr,
                            style: const TextStyle(
                                fontSize: 17.0, fontFamily: formUrduFont),
                          ), //Text
                          const SizedBox(width: 10),

                          Checkbox(
                            shape: const CircleBorder(),
                            splashRadius: 20,
                            value: requestFormStepperController.unMarried,
                            onChanged: (bool? value) {
                              // setState(() {
                              requestFormStepperController.unMarried = value!;
                              requestFormStepperController
                                  .checkUnMarried(value);
                              // });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const GreyDivider(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      formFieldTitle(
                          title: "PreviousOfficeBussinessAddress".tr),
                      const SizedBox(height: 10),
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          minHeight: 40,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: TextFormField(
                            controller: requestFormStepperController
                                .requestFormPreviousWorkAddressController,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            // validator: (value) =>
                            //     validateField(value: value!, fieldName: "Full Name"),
                            onSaved: (value) {},
                            // keyboardType: TextInputType.number,
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
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const GreyDivider(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      formFieldTitle(title: "CurrentOfficeBussinessAddress".tr),
                      const SizedBox(height: 10),
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          minHeight: 40,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: TextFormField(
                            controller: requestFormStepperController
                                .requestFormCurrentWorkAddressController,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            // validator: (value) =>
                            //     validateField(value: value!, fieldName: "Full Name"),
                            onSaved: (value) {},
                            // keyboardType: TextInputType.number,
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
                            formFieldTitle(title: "Position".tr),
                            const SizedBox(height: 10),
                            Container(
                              height: 44,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: TextFormField(
                                controller: requestFormStepperController
                                    .requestFormWorkPositionController,
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
                            formFieldTitle(title: "Duration".tr),
                            const SizedBox(height: 10),
                            Container(
                              height: 44,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: TextFormField(
                                controller: requestFormStepperController
                                    .requestFormWorktDurationController,
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
                  const SizedBox(height: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      formFieldTitle(title: "Phone".tr),
                      const SizedBox(height: 10),
                      Container(
                        height: 44,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          controller: requestFormStepperController
                              .requestFormWorkPhoneController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) => validateRequestFormField(
                              value: value!, fieldName: "Phone".tr),
                          onSaved: (value) {},
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9|+]')),
                          ],
                          keyboardType: TextInputType.phone,
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
                      formFieldTitle(title: "Occupation".tr),
                      const SizedBox(height: 10),
                      Container(
                        height: 44,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          controller: requestFormStepperController
                              .requestFormOccupationController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) => validateRequestFormField(
                              value: value!, fieldName: "Occupation".tr),
                          onSaved: (value) {},
                          // keyboardType: TextInputType.number,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            formFieldTitle(title: "MonthlyIncome".tr),
                            const SizedBox(height: 10),
                            Container(
                              height: 44,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: TextFormField(
                                controller: requestFormStepperController
                                    .requestFormMonthlyIncomeController,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (value) => validateRequestFormField(
                                    value: value!,
                                    fieldName: "MonthlyIncome".tr),
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
                      // const SizedBox(width: 10),
                      // Expanded(
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       formFieldTitle(title: "Fine".tr),
                      //       const SizedBox(height: 10),
                      //       Container(
                      //         height: 44,
                      //         decoration: BoxDecoration(
                      //           color: Colors.white,
                      //           borderRadius: BorderRadius.circular(10.0),
                      //         ),
                      //         child: TextFormField(
                      //           controller: requestFormStepperController
                      //               .requestFormFineController,
                      //           autovalidateMode: AutovalidateMode.onUserInteraction,
                      //           validator: (value) => validateRequestFormField(
                      //               value: value!, fieldName: "Fine".tr),
                      //           onSaved: (value) {},
                      //           inputFormatters: <TextInputFormatter>[
                      //             FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      //           ],
                      //           keyboardType: TextInputType.number,
                      //           decoration: InputDecoration(
                      //             hintText: '',
                      //             hintStyle: emailHint,
                      //             enabledBorder: OutlineInputBorder(
                      //               borderRadius: BorderRadius.circular(8.0),
                      //               borderSide: BorderSide(
                      //                 color: textlightGrey,
                      //                 width: 1.0,
                      //               ),
                      //             ),
                      //             focusedBorder: OutlineInputBorder(
                      //               borderRadius: BorderRadius.circular(5.0),
                      //               borderSide: BorderSide(
                      //                 color: textlightGrey,
                      //                 width: 1.0,
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const GreyDivider(),
                  const SizedBox(height: 3),
                  formInfoText("HaveYouBuyAnything".tr),
                  const SizedBox(height: 5),
                  Row(
                    children: <Widget>[
                      const SizedBox(
                        width: 10,
                      ), //SizedBox
                      Text(
                        'No'.tr,
                        style: const TextStyle(
                            fontSize: 17.0, fontFamily: formUrduFont),
                      ), //Text
                      const SizedBox(width: 10),

                      Checkbox(
                        value: requestFormStepperController.buyNo,
                        onChanged: (bool? value) {
                          requestFormStepperController.buyNo = value!;
                          requestFormStepperController.checkBuyNo(value);
                        },
                      ),

                      const SizedBox(
                        width: 10,
                      ), //SizedBox
                      Text(
                        'Yes'.tr,
                        style: const TextStyle(
                            fontSize: 17.0, fontFamily: formUrduFont),
                      ), //Text
                      const SizedBox(width: 10),

                      Checkbox(
                        value: requestFormStepperController.buyYes,
                        onChanged: (bool? value) {
                          requestFormStepperController.buyYes = value!;
                          requestFormStepperController.checkBuyYes(value);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      formFieldTitle(title: "InstallmentProducts".tr),
                      const SizedBox(height: 10),
                      Container(
                        // height: 44,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(
                            minHeight: 40,
                          ),
                          child: TextFormField(
                            controller: requestFormStepperController
                                .requestFormInstallmentProductsController,
                            // validator: (value) =>
                            //     validateField(value: value!, fieldName: "Full Name"),
                            onSaved: (value) {},
                            maxLines: 3,
                            minLines: 1,
                            keyboardType: TextInputType.multiline,
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
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            formFieldTitle(title: "Organization".tr),
                            const SizedBox(height: 10),
                            Container(
                              height: 44,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: TextFormField(
                                controller: requestFormStepperController
                                    .requestFormOrganizationController,
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
                  const SizedBox(height: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      formFieldTitle(title: "RentalProductsName".tr),
                      const SizedBox(height: 10),
                      Container(
                        height: 44,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextFormField(
                          controller: requestFormStepperController
                              .requestFormRentalProductsController,
                          // validator: (value) =>
                          //     validateField(value: value!, fieldName: "Full Name"),
                          onSaved: (value) {},
                          // keyboardType: TextInputType.number,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            formFieldTitle(title: "ModelNo".tr),
                            const SizedBox(height: 10),
                            Container(
                              height: 44,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: TextFormField(
                                controller: requestFormStepperController
                                    .requestFormModelController,
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
                            formFieldTitle(title: "SerialNo".tr),
                            const SizedBox(height: 10),
                            Container(
                              height: 44,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: TextFormField(
                                controller: requestFormStepperController
                                    .requestFormSerialController,
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
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            formFieldTitle(title: "FirstInstallment".tr),
                            const SizedBox(height: 10),
                            Container(
                              height: 44,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: TextFormField(
                                controller: requestFormStepperController
                                    .requestFormFirstInstallmentController,
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
                            formFieldTitle(title: "SellingPrice".tr),
                            const SizedBox(height: 10),
                            Container(
                              height: 44,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: TextFormField(
                                controller: requestFormStepperController
                                    .requestFormSellingPriceController,
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
                            formFieldTitle(title: "MonthlyInstallment".tr),
                            const SizedBox(height: 10),
                            Container(
                              height: 44,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: TextFormField(
                                controller: requestFormStepperController
                                    .requestFormMonthlyInstallmentController,
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
                            formFieldTitle(title: "PendingAmount".tr),
                            const SizedBox(height: 10),
                            Container(
                              height: 44,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: TextFormField(
                                controller: requestFormStepperController
                                    .requestFormPendingController,
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
                    ],
                  ),
                  const SizedBox(height: 18),
                  formInfoText("RequestAggrementText".tr),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [ //SizedBox
                      const Text(
                        'REFR',
                        style: TextStyle(fontSize: 17.0),
                      ), //Text
                      const SizedBox(width: 10),

                      Checkbox(
                        value: requestFormStepperController.REFR,
                        onChanged: (bool? value) {

                            requestFormStepperController.setREFR(value!);

                        },
                      ),

                      const SizedBox(
                        width: 10,
                      ), //SizedBox
                      const Text(
                        'CHQ',
                        style: TextStyle(fontSize: 17.0),
                      ), //Text


                      Checkbox(
                        value:  requestFormStepperController.CHQ,
                        onChanged: (bool? value) {

                            requestFormStepperController.setCHQ( value!);

                        },
                      ),

                    //SizedBox
                      const Text(
                        'PTO',
                        style: TextStyle(fontSize: 17.0),
                      ), //Text
                      const SizedBox(width: 10),

                      Checkbox(
                        value:  requestFormStepperController.PTO,
                        onChanged: (bool? value) {

                          requestFormStepperController.setPTO( value!);

                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                          child: formThumbTitle(
                              title: "Thumb".tr, color: "DB0A0A")),
                      Expanded(
                        flex: 2,
                          child: TextFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) =>
                                validateRequestFormField(value: value!, fieldName: "Thumb".tr),
                        controller: requestFormStepperController
                            .requestFormThumbController,
                      ))
                    ],
                  ),
                  // const SizedBox(height: 15),
                  // Container(
                  //   padding: const EdgeInsets.only(right: 15),
                  //   alignment: Alignment.topRight,
                  //   child: FormButton(
                  //       onPressed: () {
                  //         Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) =>
                  //                   const GuaranteedtFormScreen()),
                  //         );
                  //       },
                  //       buttonName: "Next",
                  //       sizePercentage: 3.5),
                  // ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  _selectDate(BuildContext context, DateTime currentDate,RequestFormStepperController requestFormStepperController) async {
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(1940),
        lastDate: DateTime.now());
    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        currentDate = pickedDate;
        if (DateTime.now().difference(currentDate) <
            const Duration(days: 6570)) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('You must be at least 18+ years old'),
            backgroundColor: Colors.red,
          ));
        } else {
          requestFormStepperController
              .requestFormDobController.text =
              DateFormat('dd-MM-yyyy').format(currentDate.toLocal());
        }
      });
    }
  }
}
