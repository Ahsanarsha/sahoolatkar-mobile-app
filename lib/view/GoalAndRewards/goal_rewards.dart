import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../const/theme.dart';
import '../../controller/GoalAndRewars/goal_rewards_controller.dart';
import '../../widgets/back_navigator_without_text.dart';

class GoalRewardsScreen extends StatefulWidget {
  const GoalRewardsScreen({Key? key}) : super(key: key);

  @override
  State<GoalRewardsScreen> createState() => _GoalRewardsScreenState();
}

class _GoalRewardsScreenState extends State<GoalRewardsScreen> {
  GoalAndRewardsController controller = Get.put(GoalAndRewardsController());
  @override
  void initState() {
    controller.getGoals();
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
          "Goals and Rewards",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: GetBuilder<GoalAndRewardsController>(
        init: GoalAndRewardsController(),
        builder:(_)=> controller.model.data == null ? const Center(child: CircularProgressIndicator(),)
        :SizedBox(
           child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: ListView.builder(
                  itemCount: controller.model.data!.length,
                 itemBuilder: (context,int index){
                   return Padding(
                     padding: const EdgeInsets.only(bottom: 8.0),
                     child: Material(
                       elevation: 2,
                         borderRadius: BorderRadius.circular(5),
                       child: Container(
                         padding: const EdgeInsets.all(15),
                         decoration: BoxDecoration(
                             color: Colors.white,
                           borderRadius: BorderRadius.circular(5)
                         ),
                         child: Row(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             Text("${index + 1}",style: GoogleFonts.roboto(
                               fontWeight: FontWeight.bold,
                               color: loginButtonColor,
                               fontSize: 20
                             ),),
                             const SizedBox(width: 10,),
                             Expanded(child: Text(controller.model.data![index].title.toString())),
                           ],
                         ),
                       ),
                     ),
                   );
                 }),
           ),
        )
      ),
    );
  }
}
