import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

List<Widget> tyres(BoxConstraints Constrains) {
    return [
                    Positioned(
                        top: Constrains.maxHeight * 0.21,
                        left: Constrains.maxWidth * 0.22,
                        child: SvgPicture.asset(
                          "assets/icons/FL_Tyre.svg",
                        )),
                    Positioned(
                        top: Constrains.maxHeight * 0.21,
                        right: Constrains.maxWidth * 0.22,
                        child: SvgPicture.asset(
                          "assets/icons/FL_Tyre.svg",
                        )),
                    Positioned(
                        bottom: Constrains.maxHeight * 0.23,
                        left: Constrains.maxWidth * 0.22,
                        child: SvgPicture.asset(
                          "assets/icons/FL_Tyre.svg",
                        )),
                    Positioned(
                        bottom: Constrains.maxHeight * 0.23,
                        right: Constrains.maxWidth * 0.22,
                        child: SvgPicture.asset(
                          "assets/icons/FL_Tyre.svg",
                        )),
                  ];
  }

