import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_case_can_creative/application/detail/detail_game_page.dart';
import 'package:test_case_can_creative/application/favorite/controller_favorite.dart';
import 'package:test_case_can_creative/application/widget/card_game.dart';
import 'package:test_case_can_creative/data/config/theme.dart';
import 'package:test_case_can_creative/injection.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final controller = Get.put(ControllerFavorite(gamesUsecase: sl()));

  @override
  Widget build(BuildContext context) {
    controller.getListGamesFavorite();
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(top: 24.w),
          child: Text(
            'Favorite Games',
            style: robotoBigWhite.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        toolbarHeight: 80.h,
        backgroundColor: primaryColor,
      ),
      body: Padding(
          padding: EdgeInsets.fromLTRB(12.w, 12.w, 16.w, 60.w),
          child: Obx(() {
            if (controller.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (controller.listGames.isEmpty) {
              return const Center(
                child: Text('Kosong'),
              );
            }
            return ListView.builder(
              // controller: scrollcontroller,
              padding: EdgeInsets.symmetric(vertical: 4.w, horizontal: 8.w),
              itemCount: controller.listGames.length,
              itemBuilder: (BuildContext context, int index) {
                // hilangin if else tinggalkan return padding
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.w, horizontal: 8.w),
                  child: CardGames(
                    item: controller.listGames[index],
                    ontap: () async {
                      final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailGamePage(
                              id: controller.listGames[index].id ?? 0,
                              isFavorite: true,
                            ),
                          ));
                      if (result == true) {
                        controller.getListGamesFavorite();
                      }
                    },
                  ),
                );
              },
            );
          })),
    );
  }
}
