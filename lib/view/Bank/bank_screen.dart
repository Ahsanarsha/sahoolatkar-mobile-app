import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:saholatkar/controller/ProfileMenu/AccountLevel/bank_controller.dart';
import 'package:saholatkar/const/theme.dart';
import 'package:saholatkar/helper/BlocUserProfile.dart';
import 'package:saholatkar/model/accountLevel/account_level.dart';
import 'package:saholatkar/utility/validate.dart';
import 'package:saholatkar/widgets/back_navigator_without_text.dart';
import 'package:saholatkar/widgets/custome_button_without_bold.dart';

import '../../controller/ProfileMenu/AccountLevel/account_level_controller.dart';

class BankScreen extends StatefulWidget {
  final BankData bank;
  const BankScreen({Key? key, required this.bank}) : super(key: key);

  @override
  State<BankScreen> createState() => _BankScreenState();
}

class _BankScreenState extends State<BankScreen> {
  final _bankFormKey = GlobalKey<FormState>();
  final BankController bankController = Get.find();
  AccountLevelController controller = Get.find<AccountLevelController>();
  String initialString = '';

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        bankController.initFormData(widget.bank);
        if(controller.model.records!=null && controller.model.records!.isNotEmpty ) {
          if(controller.model.records![0].bank != null ) {
            initialString = controller.model.records![0].bank
                .toString()
                .replaceAll("{", "")
                .replaceAll("}", "");
            bankController.bankNameController.text = initialString
                .substring(
                    initialString.indexOf(': ') + 1, initialString.indexOf(','))
                .trim();
            bankController.accountNoController.text = initialString
                .substring(initialString.indexOf('account-no: ') + 12)
                .trim();
          }
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Bank",
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
                const SizedBox(height: 25),
                fieldTitle(title: "Bank Name"),
                const SizedBox(height: 10),
                Container(
                  height: 44,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextFormField(
                    controller: bankController.bankNameController,
                    onSaved: (value) {},
                    inputFormatters:[
                      // for below version 2 use this
                      FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z\s]*$')),
                    ],
                    validator: (value) =>
                        validateField(value: value!, fieldName: "Bank Name"),
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
                const SizedBox(height: 15),
                fieldTitle(title: "Account No"),
                const SizedBox(height: 10),
                Container(
                  height: 44,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextFormField(
                    controller: bankController.accountNoController,
                    onSaved: (value) {},
                    validator: (value) =>
                        validateField(value: value!, fieldName: "Account No"),
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
                const SizedBox(height: 30),
                widget.bank.id != 0
                    ? CustomButtonWithoutBold(
                        textColor: Colors.white,
                        textValue: "Update",
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

                            await bankController.updateBankDetail(
                                bankController.bankNameController.text,
                                bankController.accountNoController.text,
                                id: widget.bank.id.toString());
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Please fill all fields')),
                            );
                          }
                        },
                      )
                    : Container(),
                const SizedBox(height: 10),
                CustomButtonWithoutBold(
                  textColor: Colors.white,
                  textValue: widget.bank.id != 0 ? "Next" : "Add",
                  buttonColor: HexColor("1BCB5D"),
                  onPressed: () async {
                    if (widget.bank.id != 0) {
                    } else {
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

                        await bankController.addBankDetail(
                            bankController.bankNameController.text,
                            bankController.accountNoController.text,
                            blocUserProfile.viewModelUser.data![0].id.toString()
                        ).then((value){
                          Navigator.pop(context);
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Please fill all fields')),
                        );
                      }
                    }
                  },
                ),
              ],
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
