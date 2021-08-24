import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ibilling/model/bottom_nav_bar_item_model.dart';
import 'package:easy_localization/easy_localization.dart';

class BottomNavBarItem extends StatelessWidget {
  final BottomNavBarItemModel bottomNavBarItemModel;
  final VoidCallback onTap;

  const BottomNavBarItem({
    required this.bottomNavBarItemModel,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(bottomNavBarItemModel.isActive
              ? bottomNavBarItemModel.activeIconPath
              : bottomNavBarItemModel.iconPath),
          const SizedBox(
            height: 4,
          ),
          Text(
            bottomNavBarItemModel.title.tr(),
            style: TextStyle(
                color: bottomNavBarItemModel.isActive
                    ? Colors.white
                    : Color(0xffA6A6A6),
                fontSize: 10),
          ),
        ],
      ),
    );
  }
}