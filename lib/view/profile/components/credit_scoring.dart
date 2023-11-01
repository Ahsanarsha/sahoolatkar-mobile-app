import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:saholatkar/const/theme.dart';
import 'package:saholatkar/view/profile/components/meter_guage.dart';
import 'package:saholatkar/widgets/back_navigator_without_text.dart';
import 'package:saholatkar/widgets/custom_big_header.dart';

import '../../../controller/GoalAndRewars/goal_rewards_controller.dart';

class CreditScroringScreen extends StatefulWidget {
  const CreditScroringScreen({Key? key}) : super(key: key);

  @override
  State<CreditScroringScreen> createState() => _CreditScroringScreenState();
}

class _CreditScroringScreenState extends State<CreditScroringScreen> {
  GoalAndRewardsController controller = Get.put(GoalAndRewardsController());
  @override
  void initState() {
    controller.getGoalsPoints();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const BackNavigatorWithoutText()),
          backgroundColor: Colors.white,
          title: const Text(
            "Credit Scoring",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: GetBuilder<GoalAndRewardsController>(
          init: GoalAndRewardsController(),
          builder:(_)=> SingleChildScrollView(
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          Center(
                            child: CustomeBigHeader(
                                title: "What is credit score?",
                                color: HexColor("414141")),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            "Credit score can help you improve your score as much as 150 points",
                            style: GoogleFonts.roboto(textStyle: heading8)
                                .copyWith(
                                    color: HexColor("414141"),
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 30),
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width / 2.9,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)), //here
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 1.0), //(x,y)
                                  blurRadius: 2.0,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                controller.goalPointsResponse.data == null ? '':controller.goalPointsResponse.data![0].creditPoints.toString(),
                                style: GoogleFonts.roboto(textStyle: heading8)
                                    .copyWith(
                                        color: HexColor("414141"),
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ),
                     GaugeApp(points: controller.goalPointsResponse.data == null ? 0.0: double.parse(controller.goalPointsResponse.data![0].creditPoints.toString())),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
