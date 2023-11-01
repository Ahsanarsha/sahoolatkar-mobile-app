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
import 'package:saholatkar/widgets/custom_big_header.dart';
import 'package:saholatkar/widgets/grey_divider.dart';

class GuaranteedOne extends StatefulWidget {
  const GuaranteedOne({Key? key}) : super(key: key);

  @override
  State<GuaranteedOne> createState() => _GuaranteedOneState();
}

class _GuaranteedOneState extends State<GuaranteedOne> {
  bool value = true;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestFormStepperController>(
      // init: RequestFormStepperController(),
      builder: (requestFormStepperController) => Form(
        key: requestFormStepperController.guaranter1FormKey,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: CustomeBigHeader(
                title: "Guaranteed1".tr, color: loginButtonColor),
          ),
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
                            .guaranter1FormApplicantNameController,
                        validator: (value) => validateRequestFormField(
                            value: value!, fieldName: "ApplicantName".tr),
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
                            .guaranter1FormFatherNameController,
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
                      .guaranter1FormIdCardController,
                  validator: (value) => validateRequestFormField(
                      value: value!, fieldName: "IdCard".tr),
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
          Column(
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
                    child: TextFormField(
                      controller: requestFormStepperController
                          .guaranter1FormDobController,
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
          const SizedBox(height: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              formFieldTitle(title: "HouseAddress".tr),
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
                        .guaranter1FormHouseAddressController,
                    validator: (value) => validateRequestFormField(
                        value: value!, fieldName: "HouseAddress".tr),
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
                            .guaranter1FormPositionController,
                        // validator: (value) =>
                        //     validateRequestFormField(value: value!, fieldName: "Full Name"),
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
                            .guaranter1FormDurationController,
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
              formFieldTitle(title: "Relation".tr),
              const SizedBox(height: 10),
              Container(
                height: 44,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextFormField(
                  controller: requestFormStepperController
                      .guaranter1FormRelationController,
                  validator: (value) => validateRequestFormField(
                      value: value!, fieldName: "Relation".tr),
                  onSaved: (value) {},
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
                      .guaranter1FormPhoneController,
                  validator: (value) => validateRequestFormField(
                      value: value!, fieldName: "Phone".tr),
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
                    value: requestFormStepperController.guaranter1married,
                    onChanged: (bool? value) {
                      requestFormStepperController.guaranter1married = value!;
                      requestFormStepperController
                          .checkGuaranter1Married(value);
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
                    value: requestFormStepperController.guaranter1UnMarried,
                    shape: const CircleBorder(),
                    splashRadius: 20,
                    onChanged: (bool? value) {
                      requestFormStepperController.guaranter1UnMarried = value!;
                      requestFormStepperController
                          .checkGuaranter1UnMarried(value);
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
              formFieldTitle(title: "WorkAddress".tr),
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
                        .guaranter1FormWorkAddressController,
                    validator: (value) => validateRequestFormField(
                        value: value!, fieldName: "WorkAddress".tr),
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
                      .guaranter1FormWorkPhoneController,
                  validator: (value) => validateRequestFormField(
                      value: value!, fieldName: "Phone".tr),
                  onSaved: (value) {},
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9|+]')),
                  ],
                  keyboardType: TextInputType.phone,                        decoration: InputDecoration(
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
                            .guaranter1WorkPositionController,
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
                            .guaranter1WorkDurationController,
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
                      .guaranter1FormWorkPhone2Controller,
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
          const SizedBox(height: 10),
          const GreyDivider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
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
                            .guaranter1FormOccupationController,
                        validator: (value) => validateRequestFormField(
                            value: value!, fieldName: "Occupation".tr),
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
                            .guaranter1FormMonthlyInstallmentController,
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              formFieldTitle(title: "PreviousAccount".tr),
              const SizedBox(height: 10),
              Container(
                height: 44,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextFormField(
                  controller: requestFormStepperController
                      .guaranter1FormPreviousAccountController,
                  validator: (value) => validateRequestFormField(
                      value: value!, fieldName: "PreviousAccount".tr),
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
          const SizedBox(height: 18),
          formInfoText("RequestAggrementText".tr),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(child: formThumbTitle(title: "Thumb".tr)),
              Expanded(
                  child: TextFormField(
                    validator: (value) => validateRequestFormField(
                        value: value!, fieldName: "Thumb".tr),
                controller:
                    requestFormStepperController.guaranter1FormThumbController,
              ))
            ],
          ),
          const SizedBox(height: 15),
        ]),
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
              .guaranter1FormDobController.text =
              DateFormat('dd-MM-yyyy').format(currentDate.toLocal());
        }
      });
    }
  }

}
