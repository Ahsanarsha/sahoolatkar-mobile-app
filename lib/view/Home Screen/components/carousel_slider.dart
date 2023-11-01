import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saholatkar/const/Api_constant/Api.dart';
import 'package:saholatkar/const/theme.dart';
import 'package:saholatkar/controller/AllData/allDataController.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselSliderScreen extends StatefulWidget {

  CarouselSliderScreen({Key? key}) : super(key: key);

  @override
  State<CarouselSliderScreen> createState() => _CarouselSliderScreenState();
}

class _CarouselSliderScreenState extends State<CarouselSliderScreen> {
  CarouselController buttonCarouselController = CarouselController();
  int activeIndex = 0;
  AllDataController controller = Get.put(AllDataController());

  @override
  Widget build(BuildContext context) => GetBuilder<AllDataController>(
    builder:(controller)=> controller.bannerModel.data== null ? const SizedBox():
    Column(children: <Widget>[
          Column(
            children: [
              CarouselSlider.builder(
                itemCount: controller.bannerModel.data!.length,
                carouselController: buttonCarouselController,
                options: CarouselOptions(
                  padEnds: true,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 1.0,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) => setState(() {
                    activeIndex = index;
                  }),
                ),
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) {
                  final urlImage = ApiConstants.banner + controller.bannerModel.data![itemIndex].banerImage.toString();
                  return Image.network(urlImage, fit: BoxFit.cover);
                },
              ),
              SizedBox(height: 10),
              buildIndicator()
            ],
          ),

          // RaisedButton(
          //   onPressed: () => buttonCarouselController.nextPage(
          //       duration: Duration(milliseconds: 300), curve: Curves.linear),
          //   child: Text('→'),
          // )
        ]),
  );

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count:  controller.bannerModel.data!.length,
        effect: JumpingDotEffect(
            spacing: 8.0,
            radius: 16.0,
            dotWidth: 12.0,
            dotHeight: 12.0,
            // paintStyle: PaintingStyle.stroke,
            // strokeWidth: 1.5,
            dotColor: Colors.grey,
            activeDotColor: loginTextColor),
      );
}
