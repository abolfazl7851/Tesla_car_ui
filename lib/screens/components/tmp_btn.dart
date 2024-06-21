import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tesla_car_ui/constanins.dart';

class TempBtn extends StatelessWidget {
  const TempBtn({
    Key? key,
    required this.SvgSrc,
    required this.Title,
    this.isActive = false,
    required this.press,
     this.activeColor = primaryColor,
  }) : super(key: key);

  final String SvgSrc, Title;
  final bool isActive;
  final VoidCallback press;
  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInOutBack,
            height: isActive ? 67 : 50,
            width: isActive ? 67 : 50,
            child: SvgPicture.asset(
              SvgSrc,
              color: isActive ? activeColor : Colors.white38,
            ),
          ),
          const SizedBox(
            height: defaultPadding / 2,
          ),
          AnimatedDefaultTextStyle(
              duration: Duration(milliseconds: 200),
              style: TextStyle(
                  fontSize: 15,
                  color: isActive ? activeColor : Colors.white38,
                  fontWeight: isActive ? FontWeight.bold : FontWeight.normal),
              child: Text(
                Title.toUpperCase(),
              ))
        ],
      ),
    );
  }
}
