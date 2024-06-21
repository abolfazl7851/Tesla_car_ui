import 'package:flutter/material.dart';
import 'package:tesla_car_ui/constanins.dart';

class BatteryStatus extends StatelessWidget {
  const BatteryStatus({
    Key? key,
    required this.constraints,
  }) : super(key: key);

  final BoxConstraints constraints;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("220 mi",
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: Colors.white)),
        Text(
          "63%",
          style: TextStyle(fontSize: 24),
        ),
        Spacer(),
        Text(
          "charging".toUpperCase(),
          style: TextStyle(fontSize: 20),
        ),
        Text(
          "36 min remaining",
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: constraints.maxHeight * 0.14,
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: DefaultTextStyle(
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "23mi/hr",
                ),
                Text(
                  "235 v",
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: defaultPadding,
        )
      ],
    );
  }
}
