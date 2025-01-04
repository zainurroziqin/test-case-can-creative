import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_case_can_creative/application/detail/detail_game_page.dart';
import 'package:test_case_can_creative/application/home/controller_home.dart';
import 'package:test_case_can_creative/application/search/search_page.dart';
import 'package:test_case_can_creative/data/config/theme.dart';
import 'package:test_case_can_creative/application/widget/card_game.dart';
import 'package:test_case_can_creative/injection.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Get.put(ControllerHome(gamesUsecase: sl()));
  TextEditingController searchController = TextEditingController();

  final scrollcontroller = ScrollController(); // ga di pake di search

  void setUpScrollController() {
    // ga di pake di search
    scrollcontroller.addListener(
      () {
        if (scrollcontroller.position.atEdge &&
            scrollcontroller.position.pixels != 0) {
          controller.getGames();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    setUpScrollController(); // ga di pake di search
    controller.getGames(); // pake di search tapi query kosong
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(top: 24.w),
          child: Text(
            'Games For You',
            style: robotoBigWhite.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        toolbarHeight: 80.h,
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(8.w, 8.w, 8.w, 60.w),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                filled: true,
                fillColor: secondaryColor,
                prefixIcon: const Icon(Icons.search),
                hintText: 'search',
                hintStyle: TextStyle(color: thirdColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.w)),
                  borderSide: BorderSide.none,
                ),
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const SearchGame()));
              },
            ),
            SizedBox(height: 20.h),
            Expanded(
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
                if (controller.isError) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(controller.message),
                    ),
                  );
                }
                return ListView.builder(
                  controller: scrollcontroller,
                  padding: EdgeInsets.symmetric(vertical: 4.w, horizontal: 8.w),
                  itemCount: controller.listGames.length +
                      (controller.loadinglast ? 2 : 0),
                  itemBuilder: (BuildContext context, int index) {
                    if (index < controller.listGames.length) {
                      // hilangin if else tinggalkan return padding
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 4.w, horizontal: 8.w),
                        child: CardGames(
                          item: controller.listGames[index],
                          ontap: () {
                            Get.to(DetailGamePage(
                              id: controller.listGames[index].id ?? 0,
                            ));
                          },
                        ),
                      );
                    } else {
                      Timer(const Duration(microseconds: 30), () {
                        scrollcontroller
                            .jumpTo(scrollcontroller.position.maxScrollExtent);
                      });
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
