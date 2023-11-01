import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:saholatkar/const/theme.dart';
import 'package:saholatkar/controller/Product/Product_controller.dart';
import 'package:saholatkar/view/ProductDetails/components/add_remove_button.dart';

class AddRemoveCell extends StatelessWidget {
  final buttonHight;
  final horizontalPadding;
   AddRemoveCell(
      {Key? key, required this.buttonHight, required this.horizontalPadding})
      : super(key: key);
final product_conroller=Get.put(Product_Controller());
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(14.0),
      elevation: 0,
      child: Container(
        height: buttonHight,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(color: formTextColor, width: 1)),
        child: Material(
          color: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const SizedBox(width: 8),
                   RemoveButton(
                     onPressed: (){
                    //   product_conroller.decrement(index);
                     },
                   ),
                  // GetBuilder<CounterController>(
                  //   builder: (controller) => Text(
                  //     "increment  ${controller.count}",
                  //     style: TextStyle(fontSize: 18),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child:  GetBuilder<Product_Controller>(
                        builder: (controller) =>Text(
                      "${controller.product_count}",
                      style: heading8
                        ..copyWith(
                          color: HexColor("414141"),
                        ),
                    ),
                  )),
                   AddButton(
                     onPressed: (){
                     //  product_conroller.increment(index);
                     },
                   ),
                  // const SizedBox(width: 8),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
