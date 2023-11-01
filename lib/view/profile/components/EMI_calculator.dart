import "dart:math";

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:saholatkar/const/theme.dart';
import 'package:saholatkar/widgets/back_navigator_without_text.dart';
import 'package:saholatkar/widgets/custom_big_header.dart';
import 'package:saholatkar/widgets/custome_button_without_bold.dart';

import '../../../controller/RequestForm/request_form_controller.dart';
import '../../RequestForm/components/stepper_form.dart';

class EMICalculator extends StatefulWidget {
  String? amount,productId;
   EMICalculator({Key? key,this.amount,this.productId}) : super(key: key);

  @override
  State<EMICalculator> createState() => _EMICalculatorState();
}

class _EMICalculatorState extends State<EMICalculator> {

  final principleAmountController = TextEditingController();
  final intrestRateController = TextEditingController();
  final advanceController = TextEditingController();
  double principleAmount = 0.0;
  double totalAmount = 0.0;
  double advanceAmount = 0.0;
  int numberOfMonth = 0;
  String currentItem = "1";
  double intrestRate = 0.0;
  double installmentPerMonth = 0.0;
    List<String> months = ['1','2','3','4','5','6','7','8','9','10','11','12','13'];

  void computeEMI() {
    installmentPerMonth = 0.0;
    principleAmount = totalAmount - advanceAmount;
    var months = numberOfMonth;
    if(months<=3){
      intrestRate = 0.15;
    }else if(months>=4 && months<=6){
      intrestRate = 0.25;
    }else if(months>=7&&months<=13){
      intrestRate  =  0.40;
    }
    // var intrest = intrestRate / 12;
    var interestValue = principleAmount * intrestRate;
    var finalValue = principleAmount + interestValue;
    print("MY amount $principleAmount");
    print("MY Number Of Month $months");
    print("MY INTEREST RATE $interestValue");

    setState(() {
      installmentPerMonth = finalValue / months;
    });
  }
  @override
  void initState() {
    if(widget.amount != null){
      principleAmountController.text = widget.amount.toString();
      totalAmount = double.parse(principleAmountController.text);

    }
    numberOfMonth = 1;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.2,
          leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const BackNavigatorWithoutText()),
          backgroundColor: Colors.white,
          title: const Text(
            "EMI Calculator",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Total Amount",
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                color: HexColor("#414141"),
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 44,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: TextFormField(
                              controller: principleAmountController,
                              // validator: (value) =>
                              //     validateField(value: value!, fieldName: "Full Name"),
                              onSaved: (value) {},
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  var valueToCheck = double.parse(value);
                                    setState(() {
                                      totalAmount = valueToCheck;
                                    });
                                }
                              },
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.only(left: 5),
                                hintText: 'Amount',
                                // hintStyle: emailHint,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Advance you want to pay",
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                color: HexColor("#414141"),
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 44,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: TextFormField(
                              controller: advanceController,
                              onSaved: (value) {},
                              onChanged: (value) {
                                setState(() {
                                  advanceAmount = double.parse(value);
                                });
                              },
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.only(left: 5),
                                hintText: 'Advance',
                                // hintStyle: emailHint,
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




                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Payment Term",
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              color: HexColor("#414141"),
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey,width: 0.8),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [

                              DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  value: currentItem,
                                  items: months
                                      .map<DropdownMenuItem<String>>(
                                        (e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e),
                                    ),
                                  )
                                      .toList(),
                                  onChanged: (Object? value) {
                                    currentItem = value.toString();
                                    numberOfMonth = int.parse(value.toString());
                                    setState(() {

                                    });
                                  },
                                ),
                              ),
                              const SizedBox(width: 5,),
                              const Text('Months')
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),
                    CustomButtonWithoutBold(
                      textColor: Colors.white,
                      textValue: "CALCULATE",
                      buttonColor: loginButtonColor,
                      onPressed: () async {
                        if(principleAmountController.text.isEmpty){
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Please add some amount')),
                          );
                        } else if(advanceController.text.isEmpty){
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Please add some advance payment')),
                          );
                        }else{
                          computeEMI();
                        }

                      },
                    ),
                    installmentPerMonth == 0.0  || widget.productId == null ?const SizedBox():CustomButtonWithoutBold(
                      textColor: Colors.white,
                      textValue: "Apply for installment",
                      buttonColor: HexColor("1BCB5D"),
                      onPressed: ()  {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GetBuilder<
                                  RequestFormStepperController>(
                                  init: RequestFormStepperController(),
                                  builder:
                                      (requestFormStepperController) =>
                                      FormStepper(productId: widget.productId.toString(),advance: '${advanceController.text} months',duration: numberOfMonth.toString(),monthlyInstallment: installmentPerMonth.toString(),)),
                            ));
                      },
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Monthly Installment",
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                color: HexColor("#414141"),
                                fontSize: 15,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          CustomeBigHeader(
                            color: loginButtonColor,
                            title:
                                "${installmentPerMonth.toStringAsFixed(2)} Rs",
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
