import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saholatkar/Controller/ProfileMenu/AccountLevel/live_photo.dart';
import 'package:saholatkar/const/theme.dart';
import 'package:saholatkar/model/accountLevel/account_level.dart';
import 'package:saholatkar/widgets/back_navigator_without_text.dart';
import 'package:saholatkar/widgets/custome_button_without_bold.dart';

import '../../const/Api_constant/Api.dart';
import '../../controller/ProfileMenu/AccountLevel/account_level_controller.dart';

class LivePhotoScreen extends StatefulWidget {
  final LivePhoto livePhoto;
  const LivePhotoScreen({Key? key, required this.livePhoto}) : super(key: key);

  @override
  State<LivePhotoScreen> createState() => _LivePhotoScreenState();
}

class _LivePhotoScreenState extends State<LivePhotoScreen> {
  File? imageFile;
  String url = '';
  AccountLevelController controller = Get.find<AccountLevelController>();
  @override
  void initState() {
    if(controller.model.records!=null && controller.model.records!.isNotEmpty ) {
    url = '${ApiConstants.BASE_URL}LivePhoto/${controller.model.records![0].livePhoto}';
    }
    print(imageFile);
    super.initState();
  }

  /// Get from Camera
  _getFromCamera() async {
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
            "Live Photo",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: GetBuilder<LivePhotoController>(
          init: LivePhotoController(),
          builder: (livePhotoController) => Padding(
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
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: CustomButtonWithoutBold(
                    textColor: Colors.white,
                    textValue: "Take Photo",
                    buttonColor: HexColor("1BCB5D"),
                    onPressed: () {
                      _getFromCamera();
                    },
                  ),
                ),
                const SizedBox(height: 30),
                const SizedBox(height: 10),
                CustomButtonWithoutBold(
                  textColor: Colors.white,
                  textValue: widget.livePhoto.id != 0 ? "Next" : "Add",
                  buttonColor: HexColor("1BCB5D"),
                  onPressed: () async {
                    if(imageFile == null){
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Please chose image first')),
                      );
                    }else
                    if (widget.livePhoto.id != 0) {
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

                        await livePhotoController.uploadLivePhoto(
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
          ),
        ));
  }

  Widget fieldTitle({required String title}) => Text(
        title,
        style: GoogleFonts.roboto(textStyle: productTitle)
            .copyWith(color: HexColor("414141")),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
}
