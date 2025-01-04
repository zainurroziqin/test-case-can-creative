import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_case_can_creative/application/detail/controller_detail.dart';
import 'package:test_case_can_creative/data/config/theme.dart';
import 'package:test_case_can_creative/injection.dart';
import 'package:flutter_html/flutter_html.dart' as html;

class DetailGamePage extends StatefulWidget {
  final int id;
  final bool isFavorite;
  const DetailGamePage({super.key, required this.id, this.isFavorite = false});

  @override
  State<DetailGamePage> createState() => _DetailGamePageState();
}

class _DetailGamePageState extends State<DetailGamePage> {
  final controller = Get.put(ControllerDetail(gamesUsecase: sl()));

  @override
  void initState() {
    super.initState();
    controller.setFavorite(widget.isFavorite);
  }

  @override
  Widget build(BuildContext context) {
    controller.getDetailGames(widget.id);
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, true);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Detail', style: robotoMediumWhite),
          centerTitle: true,
          backgroundColor: primaryColor,
          iconTheme: IconThemeData(color: whiteColor),
          actions: [
            Obx(() {
              return IconButton(
                  onPressed: () {
                    widget.isFavorite
                        ? controller.deleteFavorite()
                        : controller.addFavorite();
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: controller.isFavorite ? Colors.red : whiteColor,
                  ));
            })
          ],
        ),
        body: Obx(() {
          if (controller.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network('${controller.data.imgUrl}'),
                SizedBox(height: 12.h),
                Padding(
                  padding:
                      EdgeInsets.only(left: 12.w, right: 12.w, bottom: 12.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${controller.data.publish?[0].name}',
                        style: robotoSmallBlack.copyWith(color: thirdColor),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        '${controller.data.name}',
                        style: robotoMediumBlack.copyWith(
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'Release date ${controller.data.released}',
                        style: robotoSmallBlack.copyWith(color: thirdColor),
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: starIconColor,
                            size: 16.w,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            '${controller.data.rating}',
                            style: robotoSmallBlack.copyWith(color: thirdColor),
                          ),
                          SizedBox(width: 4.w),
                          Icon(
                            Icons.games_outlined,
                            size: 16.w,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            '${controller.data.playing} played',
                            style: robotoSmallBlack.copyWith(color: thirdColor),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      html.Html(
                        data: '${controller.data.desc}',
                        style: {
                          'body': html.Style.fromTextStyle(robotoSmallBlack)
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
