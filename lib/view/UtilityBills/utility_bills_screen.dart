import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saholatkar/controller/ProfileMenu/AccountLevel/utility_bills_controller.dart';
import 'package:saholatkar/const/theme.dart';
import 'package:saholatkar/model/accountLevel/account_level.dart';
import 'package:saholatkar/widgets/back_navigator_without_text.dart';
import 'package:saholatkar/widgets/custome_button_without_bold.dart';

import '../../const/Api_constant/Api.dart';
import '../../controller/ProfileMenu/AccountLevel/account_level_controller.dart';

class UtilityBillsScreen extends StatefulWidget {
  final Utilitybill utilitybill;
  const UtilityBillsScreen({Key? key, required this.utilitybill})
      : super(key: key);

  @override
  State<UtilityBillsScreen> createState() => _UtilityBillsScreenState();
}

class _UtilityBillsScreenState extends State<UtilityBillsScreen> {
  File? imageFile;
  String url = '';
  AccountLevelController controller = Get.find<AccountLevelController>();

  @override
  void initState() {
    if(controller.model.records!=null && controller.model.records!.isNotEmpty ) {
    url = '${ApiConstants.BASE_URL}Bills/${controller.model.records![0].utilitybill}';
    }
    print(imageFile);
    super.initState();
  }

  /// Get from gallery
  _getFromGallery(
      {required UtilityBillsController utilityBillsController}) async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      // maxWidth: 1800,
      // maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  /// Get from Camera
  _getFromCamera(
      {required UtilityBillsController utilityBillsController}) async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      // maxWidth: 1800,
      // maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UtilityBillsController>(
      init: UtilityBillsController(),
      builder: (utilityBillsController) => Scaffold(
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
              "Utility Bill",
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                Container(
                  height: MediaQuery.of(context).size.height / 2.2,
                  width: MediaQuery.of(context).size.width / 1.2,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: formTextColor.withOpacity(0.15), width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: Container(
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              // image: DecorationImage(
                              //   image: AssetImage(
                              //       'assets/images/home_screen/bill.png'),
                              //   fit: BoxFit.cover,
                              // ),
                            ),
                            child: imageFile == null
                                ? CachedNetworkImage(
                                    imageUrl: url,
                                    placeholder: (context, url) => const Center(
                                        child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  )
                                : Image.file(imageFile!, fit: BoxFit.cover),
                          ),
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    const SizedBox(width: 10,),
                    Expanded(
                      flex: 2,
                      child: CustomButtonWithoutBold(
                        textColor: Colors.white,
                        textValue: "Upload  Photo",
                        buttonColor: HexColor("1BCB5D"),
                        onPressed: () {
                          _getFromGallery(
                              utilityBillsController: utilityBillsController);
                        },
                      ),
                    ),
                    const SizedBox(width: 30,),

                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          _getFromCamera(
                              utilityBillsController: utilityBillsController);
                        },
                        child: Text(
                          "Take Photo",
                          style: GoogleFonts.roboto(textStyle: productTitle)
                              .copyWith(color: HexColor("1BCB5D")),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    const SizedBox(width: 60,)
                  ],
                ),
                const SizedBox(height: 30),
                const SizedBox(height: 10),
                CustomButtonWithoutBold(
                  textColor: Colors.white,
                  textValue: widget.utilitybill.id != 0 ? "Next" : "Add",
                  buttonColor: HexColor("1BCB5D"),
                  onPressed: () async {
                    if (widget.utilitybill.id != 0) {
                    } else {
                      if (imageFile!.path.isNotEmpty) {
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

                        await utilityBillsController.uploadUtilityBill(
                            imageData: imageFile!.path).then((value){
                          Navigator.pop(context);
                        });

                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Please chose image first')),
                        );
                      }
                    }
                  },
                )
              ],
            ),
          )),
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
