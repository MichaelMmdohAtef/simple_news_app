
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class defaultDevider extends StatelessWidget {
  const defaultDevider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.w),
      child: SizedBox(
        width: double.infinity,
        height: 1.h,
        child: Container(
          color: Theme.of(context).textTheme.bodyText1!.color,
        ),
      ),
    );
  }
}
