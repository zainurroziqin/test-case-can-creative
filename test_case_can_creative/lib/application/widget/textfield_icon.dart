// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:test_case_can_creative/data/config/theme.dart';

// class TextFieldIcon extends StatelessWidget {
//   const TextFieldIcon({
//     super.key,
//     required this.textEditingController,
//     required this.hint,
//     required this.icon,
//     this.textInputType,
//     this.onsubmitted,
//   });

//   final TextEditingController textEditingController;
//   final String hint;
//   final Icon icon;
//   final TextInputType? textInputType;
//   final VoidCallback onsubmitted;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 50.h,
//       child: TextFormField(
//           controller: textEditingController,
//           keyboardType: textInputType ?? TextInputType.text,
//           decoration: InputDecoration(
//               filled: true,
//               fillColor: secondaryColor,
//               prefixIcon: icon,
//               hintText: hint,
//               hintStyle: TextStyle(color: thirdColor),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(14.w)),
//                 borderSide: BorderSide.none,
//               )),
//           onFieldSubmitted: onsubmitted),
//     );
//   }
// }
