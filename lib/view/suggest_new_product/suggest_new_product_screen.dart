import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:saholatkar/Controller/suggestNewProduct/suggest_new_product_controller.dart';
import 'package:saholatkar/const/theme.dart';
import 'package:saholatkar/utility/validate.dart';
import 'package:saholatkar/widgets/back_navigator_without_text.dart';
import 'package:saholatkar/widgets/custome_button_without_bold.dart';

class SuggestNewProductScreen extends StatelessWidget {
  SuggestNewProductScreen({Key? key}) : super(key: key);
  final _suggestProductFormKey = GlobalKey<FormState>();
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
            "Suggest New Products",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: GetBuilder<SuggestNewProductController>(
            init: SuggestNewProductController(),
            builder: (suggestNewProductController) => Form(
              key: _suggestProductFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  fieldTitle(title: "Brand and product name"),
                  const SizedBox(height: 15),
                  Container(
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: TextFormField(
                      controller:
                          suggestNewProductController.productNameController,
                      onSaved: (value) {},
                      validator: (value) => validateField(
                          value: value!, fieldName: "Brand and product name"),
                      decoration: InputDecoration(
                        hintText: 'Dawlance, Haier',
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
                  fieldTitle(title: "Size (Optional)"),
                  const SizedBox(height: 15),
                  Container(
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: TextFormField(
                      controller: suggestNewProductController.sizeController,
                      onSaved: (value) {},
                      decoration: InputDecoration(
                        hintText: 'Mini, Large',
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
                  fieldTitle(title: "Price (Optional)"),
                  const SizedBox(height: 15),
                  Container(
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: TextFormField(
                      controller: suggestNewProductController.priceController,
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
                  const SizedBox(height: 20),
                  CustomButtonWithoutBold(
                    textColor: Colors.white,
                    textValue: "Submit",
                    buttonColor: HexColor("1BCB5D"),
                    onPressed: () async {
                      if (_suggestProductFormKey.currentState!.validate()) {
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

                        await suggestNewProductController.suggestNewProduct(
                            suggestNewProductController
                                .productNameController.text,
                            suggestNewProductController.sizeController.text,
                            suggestNewProductController.priceController.text);
                        // Get.back();
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        )));
  }

  Widget fieldTitle({required String title}) => Text(
        title,
        style: GoogleFonts.roboto(textStyle: productTitle)
            .copyWith(color: HexColor("414141")),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
}
