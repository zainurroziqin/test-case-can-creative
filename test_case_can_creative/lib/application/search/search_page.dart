import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_case_can_creative/application/detail/detail_game_page.dart';
import 'package:test_case_can_creative/application/search/controller_search.dart';
import 'package:test_case_can_creative/application/widget/card_game.dart';
import 'package:test_case_can_creative/data/config/theme.dart';
import 'package:test_case_can_creative/injection.dart';

class SearchGame extends StatefulWidget {
  const SearchGame({super.key});

  @override
  State<SearchGame> createState() => _SearchGameState();
}

class _SearchGameState extends State<SearchGame> {
  final controller = Get.put(ControllerSearch(gamesUsecase: sl()));
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controller.searchGame('');
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
              onSubmitted: (value) {
                controller.searchGame(value);
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
                  // controller: scrollcontroller,
                  padding: EdgeInsets.symmetric(vertical: 4.w, horizontal: 8.w),
                  itemCount: controller.listGames.length,
                  itemBuilder: (BuildContext context, int index) {
                    // hilangin if else tinggalkan return padding
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 4.w, horizontal: 8.w),
                      child: CardGames(
                        item: controller.listGames[index],
                        ontap: () {
                          Get.to(
                            DetailGamePage(
                              id: controller.listGames[index].id ?? 0,
                            ),
                          );
                        },
                      ),
                    );
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
