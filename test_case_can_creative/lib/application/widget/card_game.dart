import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_case_can_creative/data/config/theme.dart';
import 'package:test_case_can_creative/domain/model/games_entity.dart';

class CardGames extends StatelessWidget {
  const CardGames({
    super.key,
    this.item,
    this.ontap,
  });

  final GamesEntity? item;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: InkWell(
        onTap: ontap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.network(
                item?.imgUrl ?? '',
                height: 120.h,
                width: 150.w,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item?.name ?? '',
                    style:
                        robotoMediumBlack.copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Realese date ${item?.released}',
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
                        '${item?.rating}',
                        style: robotoSmallBlack.copyWith(color: thirdColor),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
