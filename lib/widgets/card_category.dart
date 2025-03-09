import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardCategory extends StatelessWidget {
  const CardCategory({
    super.key,
    required this.urlImage,
    required this.nameCategory,
    this.onTap,
  });

  final String? urlImage;
  final String? nameCategory;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(10)),
            height: ScreenUtil().setHeight(200),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ScreenUtil().radius(12)),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  urlImage!,
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Center(
              child: Text(
                nameCategory!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: ScreenUtil().setSp(20),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
