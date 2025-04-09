import 'package:flutter/material.dart';
import 'package:vespa_app/core/app/app_config.dart';
import 'package:vespa_app/core/app/color_palette.dart';
import 'package:vespa_app/core/app/dimens.dart';
import 'package:vespa_app/core/util/size_config.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget {
  Widget attendanceLoading() {
    return Shimmer.fromColors(
      period: Duration(milliseconds: AppConfig.durationShimmer),
      highlightColor: ColorPalette.white,
      baseColor: ColorPalette.shimmer,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: SizeConfig.blockSizeVertical * 30,
              width: SizeConfig.blockSizeHorizontal * 100,
              color: ColorPalette.shimmer,
            ),
            const SizedBox(
              height: 20,
            ),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(0),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    height: 70,
                    decoration: BoxDecoration(color: ColorPalette.shimmer, borderRadius: BorderRadius.circular(10)),
                    width: SizeConfig.blockSizeHorizontal * 100,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget cardLoading() {
    return Shimmer.fromColors(
      period: Duration(milliseconds: AppConfig.durationShimmer),
      highlightColor: ColorPalette.white,
      baseColor: ColorPalette.shimmer,
      child: ListView.builder(
        itemCount: 4,
        padding: Dimens.padding20,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: Dimens.value10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: Dimens.value10),
                  height: Dimens.value30,
                  color: ColorPalette.shimmer,
                  width: double.infinity,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: Dimens.value8),
                      height: Dimens.value20,
                      color: ColorPalette.shimmer,
                      width: SizeConfig.blockSizeHorizontal * 25,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: Dimens.value8),
                      height: Dimens.value20,
                      color: ColorPalette.shimmer,
                      width: SizeConfig.blockSizeHorizontal * 25,
                    ),
                  ],
                ),
                const SizedBox(
                  height: Dimens.value8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: Dimens.value8),
                      height: Dimens.value20,
                      color: ColorPalette.shimmer,
                      width: SizeConfig.blockSizeHorizontal * 25,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: Dimens.value8),
                      height: Dimens.value20,
                      color: ColorPalette.shimmer,
                      width: SizeConfig.blockSizeHorizontal * 25,
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: Dimens.value8),
                  height: Dimens.value20,
                  color: ColorPalette.shimmer,
                  width: SizeConfig.blockSizeHorizontal * 60,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  static Widget loadingLogo() {
    return Center(
      child: Shimmer.fromColors(
        period: Duration(milliseconds: AppConfig.durationShimmer),
        highlightColor: ColorPalette.white,
        baseColor: ColorPalette.shimmer,
        child: Image.asset(
          "assets/icons/ic_hade_white.png",
          fit: BoxFit.fill,
          width: SizeConfig.blockSizeHorizontal * 30,
        ),
      ),
    );
  }
}
