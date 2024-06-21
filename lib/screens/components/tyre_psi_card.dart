import 'package:flutter/material.dart';
import 'package:tesla_car_ui/constanins.dart';
import 'package:tesla_car_ui/models/TyrePsi.dart';

class TyrePsiCard extends StatelessWidget {
  const TyrePsiCard({
    Key? key,
    required this.isBottomTwoTyre,
    required this.tyre_psi,
  }) : super(key: key);

  final bool isBottomTwoTyre;
  final TyrePsi tyre_psi;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color:
            tyre_psi.isLowPressure ? redColor.withOpacity(0.2) : Colors.white10,
        border: Border.all(
            color: tyre_psi.isLowPressure ? redColor : primaryColor, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      child: isBottomTwoTyre
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LowPressureText(context),
                Spacer(),
                PsiText(context, text: tyre_psi.psi.toString()),
                const SizedBox(
                  height: defaultPadding,
                ),
                Text(
                  "${tyre_psi.temp}\u2103",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PsiText(context, text: tyre_psi.psi.toString()),
                const SizedBox(
                  height: defaultPadding,
                ),
                Text(
                  "${tyre_psi.temp}\u2103",
                  style: TextStyle(fontSize: 16),
                ),
                Spacer(),
                LowPressureText(context),
              ],
            ),
    );
  }

  Column LowPressureText(BuildContext context) {
    return Column(
      children: [
        Text(
          "Low".toUpperCase(),
          style: Theme.of(context)
              .textTheme.headlineMedium!
              .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        Text("pressure".toUpperCase(), style: TextStyle(fontSize: 20))
      ],
    );
  }

  Text PsiText(BuildContext context, {required String text}) {
    return Text.rich(
      TextSpan(
          text: text,
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
          children: [TextSpan(text: "psi", style: TextStyle(fontSize: 24))]),
    );
  }
}