import 'package:flutter/material.dart';
import 'package:tesla_car_ui/constanins.dart';
import 'package:tesla_car_ui/home_controller.dart';
import 'package:tesla_car_ui/screens/components/tmp_btn.dart';

class TempDetail extends StatelessWidget {
  const TempDetail({
    Key? key,
    required HomeController controller,
  })  : _controller = controller,
        super(key: key);

  final HomeController _controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 120,
            child: Row(
              children: [
                TempBtn(
                  activeColor: primaryColor,
                  isActive: _controller.isCoolSelected,
                  SvgSrc: "assets/icons/coolShape.svg",
                  Title: "cool",
                  press: _controller.UpdateCoolSelected,
                ),
                const SizedBox(
                  width: defaultPadding,
                ),
                TempBtn(
                  activeColor: redColor,
                  isActive: !_controller.isCoolSelected,
                  SvgSrc: "assets/icons/heatShape.svg",
                  Title: "heat",
                  press: _controller.UpdateCoolSelected,
                )
              ],
            ),
          ),
          Spacer(),
          Column(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_drop_up,
                  size: 48,
                ),
                padding: EdgeInsets.zero,
              ),
              Text(
                "26" + "\u2103",
                style: TextStyle(fontSize: 86),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_drop_down,
                  size: 48,
                ),
                padding: EdgeInsets.zero,
              ),
            ],
          ),
          Spacer(),
          Text("Current temperature".toUpperCase()),
          const SizedBox(
            height: defaultPadding,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("inside".toUpperCase()),
                  Text(
                    "20" + "\u2103",
                    style: Theme.of(context).textTheme.headlineSmall,
                  )
                ],
              ),
              const SizedBox(
                width: defaultPadding,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "outside".toUpperCase(),
                    style: TextStyle(color: Colors.white54),
                  ),
                  Text(
                    "35" + "\u2103",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: Colors.white54),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
