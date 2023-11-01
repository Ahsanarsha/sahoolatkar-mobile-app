import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:saholatkar/helper/prefs.dart';
import 'package:saholatkar/utility/app_constants.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../const/color_model/Color_Model.dart';
import '../../../const/theme.dart';
import '../../../controller/Promotions/PromotionsController.dart';

// ignore: must_be_immutable
class MyFilter extends StatefulWidget {
  bool isopen = false;
  MyFilter({Key? key,required this.isopen}) : super(key: key);

  @override
  State<MyFilter> createState() => _MyFilterState();
}

class _MyFilterState extends State<MyFilter> {
   double _min = 0;
  int _groupValue = -1;
   double _max = 100000;
  SfRangeValues _values =  SfRangeValues(500, 20000);
   String val = '';
   String val2 = '';
  getVal()async{

    val = await Prefs.get('min') ?? '';
    val2 =  await Prefs.get('max') ?? '';
    if(val.isNotEmpty &&val2.isNotEmpty) {
      print('object');
      _values =  SfRangeValues(int.parse(val), int.parse(val2));
      // _min = double.parse(await Prefs.get('min'));
      // _max = double.parse(await Prefs.get('max'));
      setState(() {

      });
    }
  }
  @override
  void initState() {
    getVal();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PromotionController>(
      init: PromotionController(),
      builder: (controller)=> Container(
          width: MediaQuery.of(context).size.width / 1.4,
          height: MediaQuery.of(context).size.height / 1,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), //color of shadow
                spreadRadius: 5, //spread radius
                blurRadius: 7, // blur radius
                offset: const Offset(0, 2), // changes position of shadow
                //first paramerter of offset is left-right
                //second parameter is top to down
              )
            ],
          ),
          child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    child: Text(
                      "Price",
                      style: GoogleFonts.roboto(textStyle: productTitle)
                          .copyWith(color: HexColor("414141")),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      child: SfRangeSlider(
                        activeColor: Colors.red,
                        inactiveColor: Colors.red[100],
                        min: _min,
                        max: _max,
                        values: _values,
                        interval: 50000,
                        showLabels: true,
                        onChangeEnd: (SfRangeValues value)async{
                          if(AppConstants.filterBrand == ''){
                            await controller.getPromotionsByPrice(value.start, value.end);
                            // print(value.end.toString().substring(0,value.end.toString().indexOf('.')));

                            Prefs.setString('min', value.start.toString().contains('.')?value.start.toString().substring(0,value.start.toString().indexOf('.')):value.start.toString());
                            Prefs.setString('max', value.end.toString().contains('.') ?  value.end.toString().substring(0,value.end.toString().indexOf('.')):value.end.toString());
                          }else{
                            await controller.getPromotionsByPriceBrand(value.start, value.end,AppConstants.filterBrand);
                            Prefs.setString('min', value.start.toString().contains('.')?value.start.toString().substring(0,value.start.toString().indexOf('.')):value.start.toString());
                            Prefs.setString('max', value.end.toString().contains('.') ?  value.end.toString().substring(0,value.end.toString().indexOf('.')):value.end.toString());
                            }

                          controller.isopen = false;
                          setState(() {

                          });
                        },
                        onChanged: (SfRangeValues value) {
                          setState(() {
                            _values = value;
                          });
                        },
                      ),
                    ),
                  ),
                  // const Padding(
                  //   padding: EdgeInsets.all(10),
                  //   child: Divider(),
                  // ),
                  // Container(
                  //   alignment: Alignment.topLeft,
                  //   padding: const EdgeInsets.all(10),
                  //   child: Text(
                  //     "Color",
                  //     style: GoogleFonts.roboto(textStyle: productTitle)
                  //         .copyWith(color: HexColor("414141")),
                  //     maxLines: 1,
                  //     overflow: TextOverflow.ellipsis,
                  //   ),
                  // ),
                  // Container(
                  //   height: 70,
                  //   child: ListView.builder(
                  //     itemCount: list_of_color.length,
                  //     shrinkWrap: true,
                  //     scrollDirection: Axis.horizontal,
                  //     itemBuilder: (BuildContext context, int index) {
                  //       final color = list_of_color[index].Colorcode;
                  //
                  //       return Column(
                  //         children: [
                  //           Padding(
                  //             padding: const EdgeInsets.all(2),
                  //             child: Container(
                  //                 height: 35,
                  //                 width: MediaQuery.of(context).size.width / 11,
                  //                 decoration: BoxDecoration(
                  //                     color: Color(color),
                  //                     borderRadius: const BorderRadius.all(
                  //                         Radius.circular(100)))),
                  //           )
                  //         ],
                  //       );
                  //     },
                  //   ),
                  // ),
                  SizedBox(height: 20,),
                  Text('Price Range: $val - $val2',style: TextStyle(
                    fontSize: 16
                  ),),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Divider(),
                  ),
                  // Container(
                  //   alignment: Alignment.topLeft,
                  //   padding: const EdgeInsets.all(10),
                  //   child: Text(
                  //     "Size",
                  //     style: GoogleFonts.roboto(textStyle: productTitle)
                  //         .copyWith(color: HexColor("414141")),
                  //     maxLines: 1,
                  //     overflow: TextOverflow.ellipsis,
                  //   ),
                  // ),
                  // Padding(
                  //   padding:
                  //   const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Column(
                  //         children: [
                  //           Radio(
                  //               fillColor: MaterialStateColor.resolveWith(
                  //                       (states) => loginButtonColor),
                  //               value: 0,
                  //               groupValue: _groupValue,
                  //               onChanged: (newValue) {
                  //                 setState(() => _groupValue = newValue as int);
                  //               }),
                  //           const Text('Small')
                  //         ],
                  //       ),
                  //       Column(
                  //         children: [
                  //           Radio(
                  //               fillColor: MaterialStateColor.resolveWith(
                  //                       (states) => loginButtonColor),
                  //               value: 1,
                  //               groupValue: _groupValue,
                  //               onChanged: (newValue) {
                  //                 setState(() => _groupValue = newValue as int);
                  //               }),
                  //           const Text('Medium')
                  //         ],
                  //       ),
                  //       Column(
                  //         children: [
                  //           Radio(
                  //               fillColor: MaterialStateColor.resolveWith(
                  //                       (states) => loginButtonColor),
                  //               value: 2,
                  //               groupValue: _groupValue,
                  //               onChanged: (newValue) {
                  //                 setState(() => _groupValue = newValue as int);
                  //               }),
                  //           const Text('Large')
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  controller.isFilterLoading ?  CircularProgressIndicator(color: loginButtonColor,):InkWell(
                    onTap: (){
                      if(AppConstants.filterBrand == ''){
                        Prefs.setString('min', '');
                        Prefs.setString('max','');
                        controller.getAllPromotions();
                      }else{
                        Prefs.setString('min', '');
                        Prefs.setString('max','');
                         controller.getPromotionsByBrand(AppConstants.filterBrand);
                      }
                      controller.isopen = false;

                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 25),
                      width: 120,
                      height: 30,
                      decoration: BoxDecoration(
                        color: loginButtonColor,
                      ),
                      child: const Center(child: Text('Clear',style: TextStyle(color: Colors.white),)),
                    ),
                  )

                ],
              ))),
    );
  }
}