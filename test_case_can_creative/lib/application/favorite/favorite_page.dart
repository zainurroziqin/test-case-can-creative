import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_case_can_creative/data/config/theme.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
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
        child: const Column(
          children: [
            // CardGames(),
          ],
        ),
      ),
    );
  }
}
