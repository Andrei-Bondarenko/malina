import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../res/colors/my_colors.dart';

class BottomBarButtonWidget extends StatelessWidget {
  const BottomBarButtonWidget({
    super.key,
    required this.isScreenCurrent,
    required this.onChanged,
    required this.selectedIcon,
    required this.unselectedIcon,
    required this.buttonName,
  });

  final void Function() onChanged;
  final bool isScreenCurrent;
  final String selectedIcon;
  final String unselectedIcon;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 60,
      height: 60,
      onPressed: onChanged,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            isScreenCurrent
                ? selectedIcon
                : unselectedIcon,
          ),
          Text(
            buttonName,
            style: TextStyle(
              color: isScreenCurrent
                  ? MyColors.kF72055
                  : MyColors.kAAAAAA,
              fontWeight: FontWeight.w500,
              fontSize: 10,
            ),
          )
        ],
      ),
    );
  }
}
