import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:saholatkar/const/theme.dart';
import 'package:saholatkar/controller/ProfileMenu/AccountLevel/faq_controller.dart';
import 'package:saholatkar/model/faq/faq_model.dart';
import 'package:saholatkar/widgets/back_navigator_without_text.dart';
import 'package:get/get.dart';

class FAQsScreen extends StatefulWidget {
  const FAQsScreen({Key? key}) : super(key: key);

  @override
  State<FAQsScreen> createState() => _FAQsScreenState();
}

class _FAQsScreenState extends State<FAQsScreen> {
  FaqController controller = Get.put(FaqController());
  @override
  void initState() {
    controller.getFaqs();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const BackNavigatorWithoutText()),
        backgroundColor: Colors.white,
        title: const Text(
          "FAQ's",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: GetBuilder<FaqController>(
        init: FaqController(),
        builder: (_)=> controller.model.faqs == null ? const Center(child: CircularProgressIndicator(),):ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: controller.model.faqs!.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildPlayerModelList(controller.model.faqs![index]);
          },
        ),
      ),
    );
  }

  Widget _buildPlayerModelList(Faqs fAQ) {
    return Card(
      child: ExpansionTile(
        collapsedIconColor: loginButtonColor,
        title: Text(
          fAQ.question.toString(),
          style: GoogleFonts.roboto().copyWith(
              color: HexColor("414141"),
              fontSize: 14,
              fontWeight: FontWeight.w600),
        ),
        children: <Widget>[
          ListTile(
            title: Text(
              fAQ.answer.toString(),
              style: GoogleFonts.roboto().copyWith(
                  color: HexColor("414141"),
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}
