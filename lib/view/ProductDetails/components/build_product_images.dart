import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:saholatkar/const/theme.dart';

import '../../../const/Api_constant/Api.dart';

class BuildProductImages extends StatelessWidget {
  List<String> imageList;
  final Function(int) onCountSelected;
  BuildProductImages(
      {Key? key, required this.imageList, required this.onCountSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Center(
        child: ListView.builder(
            itemCount: imageList.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              var image = imageList[index];
              return GestureDetector(
                onTap: () => onCountSelected(index),
                child: Center(
                  child: Container(
                    height: 80.0,
                    width: 80.0,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      // margin: const EdgeInsets.symmetric(horizontal: 12),
                      border: Border.all(
                          color: formTextColor.withOpacity(0.15), width: 2),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),


                    ),
                      child: CachedNetworkImage(
                        width: 120,
                        height: 120,
                        imageUrl: index == 0 ? image.toString() :'${ApiConstants.categoriesProducts}${imageList[index]}',
                        progressIndicatorBuilder: (context, url, downloadProgress) =>
                            Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                        errorWidget: (context, url, error) =>  const SizedBox(
                            width: 120,
                            height: 180,
                            child: Center(child: Text('Image not found!',textAlign: TextAlign.center,))),
                      )
                  ),
                ),
              );
            }),
      ),
    );
  }
}
