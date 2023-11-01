import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:saholatkar/const/theme.dart';

import '../../../controller/Product/Product_controller.dart';
import '../../../controller/add_to_cart/AddToCartController.dart';

class TotalAmountCell extends StatefulWidget {
  const TotalAmountCell({Key? key}) : super(key: key);

  @override
  State<TotalAmountCell> createState() => _TotalAmountCellState();
}

class _TotalAmountCellState extends State<TotalAmountCell> {
  AddToCartController cartController = Get.find();
  final productController = Get.put(Product_Controller());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: GoogleFonts.roboto(textStyle: productTitle)
                    .copyWith(color: HexColor("414141"), fontSize: 19),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(width: 3),
              GetBuilder<Product_Controller>(builder: (_) {
                return Text(
                  "(${cartController.getFromCartModel.cart!.length} items)",
                  style: GoogleFonts.roboto(textStyle: heading8)
                      .copyWith(color: HexColor("414141"), fontSize: 12),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                );
              }),
              const Spacer(),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GetBuilder<Product_Controller>(builder: (_) {
                    double totals = 0;
                    for (var item in cartController.getFromCartModel.cart!) {
                     var tPrice = double.parse(item.quantity!) * double.parse(item.product!.salePrice!);
                      totals = totals + tPrice;
                    }
                    productController.totalC = totals;
                    return Text(
                      "Rs $totals",
                      style: GoogleFonts.roboto(textStyle: productTitle)
                          .copyWith(color: HexColor("414141"), fontSize: 19),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    );
                  }),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "(inc. of taxes)",
                style: GoogleFonts.roboto(textStyle: heading8)
                    .copyWith(color: HexColor("414141"), fontSize: 12),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          )
        ],
      ),
    );
  }
}
