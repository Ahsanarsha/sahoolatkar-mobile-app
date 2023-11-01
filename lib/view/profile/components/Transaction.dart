import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saholatkar/const/theme.dart';
import 'package:saholatkar/controller/UserProfile/user_profile.dart';
import 'package:saholatkar/helper/date_formatter.dart';
import 'package:saholatkar/helper/prefs.dart';

import '../../../widgets/back_navigator_without_text.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({Key? key}) : super(key: key);

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
   List<String> list = <String>['One', 'Two', 'Three', 'Four'];
   UserProfileController userProfileController = Get.put(UserProfileController());
   @override
  void initState() {
     var id = Prefs.get('userId');
    userProfileController.getTransaction(id.toString());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserProfileController>(
      init: UserProfileController(),
      builder:(controller)=> Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const BackNavigatorWithoutText()),
          backgroundColor: Colors.white,
          title: const Text(
            "Transactions",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1)
                ),
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: list.first,
                      elevation: 16,
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          // dropdownValue = value!;
                        });
                      },
                      items: list.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              Material(
                  borderRadius: BorderRadius.circular(15),
                elevation: 5,
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15)
                    ),
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: controller.transactionsModel.transactions == null ? SpinKitChasingDots(color: loginButtonColor,):
                    ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Row(
                          mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Order transaction',style: GoogleFonts.roboto(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600
                                ),),
                                Text(dateFormatter(controller.transactionsModel.transactions![index].createdAt.toString()),style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    color: Colors.grey.withOpacity(0.5),
                                    fontWeight: FontWeight.w500
                                ))

                              ],),
                            Text(controller.transactionsModel.transactions![index].totalAmount.toString(),style: GoogleFonts.roboto(
                                fontSize: 18,
                                fontWeight: FontWeight.w600
                            ),),
                          ],
                        ),
                      );
                    }, separatorBuilder: (context,i){
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Divider(
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          );
                    }, itemCount: controller.transactionsModel.transactions!.length)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
