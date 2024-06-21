import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tesla_car_ui/constanins.dart';
import 'package:tesla_car_ui/home_controller.dart';
import 'package:tesla_car_ui/models/TyrePsi.dart';
import 'package:tesla_car_ui/screens/components/battery_status.dart';
import 'package:tesla_car_ui/screens/components/door_lock.dart';
import 'package:tesla_car_ui/screens/components/temp_detail.dart';
import 'package:tesla_car_ui/screens/components/tesla_bottom_navigationBar.dart';
import 'package:tesla_car_ui/screens/components/tmp_btn.dart';
import 'package:tesla_car_ui/screens/components/tyre_psi_card.dart';
import 'package:tesla_car_ui/screens/components/tyres.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final HomeController _controller = HomeController();
  late AnimationController _batteryAnimationController;
  late Animation<double> _animationBattery;

  late Animation<double> _animationBatteryStatus;

  late AnimationController _TempAnimationController;
  late Animation<double> _animationCarShift;
  late Animation<double> _animationTempShowInfo;
  late Animation<double> _animationTempCoolGlow;

  late AnimationController _TyreAnimationController;

  late Animation<double> _Animationtyre1Psi;
  late Animation<double> _Animationtyre2Psi;
  late Animation<double> _Animationtyre3Psi;
  late Animation<double> _Animationtyre4Psi;

  late List<Animation<double>> _tyreAnimations;

  void setUpBatteryAnimation() {
    _batteryAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    _animationBattery = CurvedAnimation(
      parent: _batteryAnimationController,
      curve: Interval(0.0, 0.5),
    );

    _animationBatteryStatus = CurvedAnimation(
      parent: _batteryAnimationController,
      curve: Interval(0.6, 1),
    );
  }

  void setUpTempAnimation() {
    _TempAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));

    _animationCarShift = CurvedAnimation(
      parent: _TempAnimationController,
      curve: Interval(0.2, 0.4),
    );
    _animationTempShowInfo = CurvedAnimation(
      parent: _TempAnimationController,
      curve: Interval(0.45, 0.65),
    );
    _animationTempCoolGlow = CurvedAnimation(
      parent: _TempAnimationController,
      curve: Interval(0.7, 1),
    );
  }

  void setUpTyreAnimation() {
    _TyreAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1200));

    _Animationtyre1Psi = CurvedAnimation(
      parent: _TyreAnimationController,
      curve: Interval(0.34, 0.5),
    );
    _Animationtyre2Psi = CurvedAnimation(
      parent: _TyreAnimationController,
      curve: Interval(0.5, 0.66),
    );
    _Animationtyre3Psi = CurvedAnimation(
      parent: _TyreAnimationController,
      curve: Interval(0.66, 0.82),
    );
    _Animationtyre4Psi = CurvedAnimation(
      parent: _TyreAnimationController,
      curve: Interval(0.82, 1),
    );
  }

  @override
  void initState() {
    setUpBatteryAnimation();
    setUpTempAnimation();
    setUpTyreAnimation();
    _tyreAnimations = [
      _Animationtyre1Psi,
      _Animationtyre2Psi,
      _Animationtyre3Psi,
      _Animationtyre4Psi,
    ];
    super.initState();
  }

  @override
  void dispose() {
    _batteryAnimationController.dispose();
    _TempAnimationController.dispose();
    _TyreAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnimatedBuilder(
        animation: Listenable.merge([
          _controller,
          _batteryAnimationController,
          _TempAnimationController,
          _TyreAnimationController
        ]),
        builder: (context, _) {
          return Scaffold(
            bottomNavigationBar: TeslaBottomNavigationBar(
                onTap: (index) {
                  if (index == 1)
                    _batteryAnimationController.forward();
                  else if (_controller.SelectedBottomTab == 1 && index != 1)
                    _batteryAnimationController.reverse(from: 0.7);

                  if (index == 2)
                    _TempAnimationController.forward();
                  else if (_controller.SelectedBottomTab == 2 && index != 2)
                    _TempAnimationController.reverse(from: 0.4);

                  if (index == 3)
                    _TyreAnimationController.forward();
                  else if (_controller.SelectedBottomTab == 3 && index != 3)
                    _TyreAnimationController.reverse();

                  _controller.ShowTyreController(index);
                  _controller.TyreStatusController(index);
                  _controller.UpdateSelectedBottomTab(index);
                },
                SelectedTab: _controller.SelectedBottomTab),
            body: SafeArea(
              child: LayoutBuilder(builder: (context, Constrains) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: Constrains.maxHeight,
                      width: Constrains.maxWidth,
                    ),
                    Positioned(
                      left: Constrains.maxWidth / 2 * _animationCarShift.value,
                      height: Constrains.maxHeight,
                      width: Constrains.maxWidth,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: Constrains.maxHeight * 0.1),
                        child: SvgPicture.asset(
                          "assets/icons/Car.svg",
                          width: double.infinity,
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                        duration: showDuration,
                        right: _controller.SelectedBottomTab == 0
                            ? Constrains.maxWidth * 0.03
                            : Constrains.maxWidth / 2,
                        child: AnimatedOpacity(
                          duration: defaulDuration,
                          opacity: _controller.SelectedBottomTab == 0 ? 1 : 0,
                          child: DoorLock(
                            isLock: _controller.isRighthDoorLock,
                            press: _controller.UpdateRightDoorLock,
                          ),
                        )),
                    AnimatedPositioned(
                        duration: showDuration,
                        left: _controller.SelectedBottomTab == 0
                            ? Constrains.maxWidth * 0.03
                            : Constrains.maxWidth / 2,
                        child: AnimatedOpacity(
                          duration: defaulDuration,
                          opacity: _controller.SelectedBottomTab == 0 ? 1 : 0,
                          child: DoorLock(
                            isLock: _controller.isLeftDoorLock,
                            press: _controller.UpdateLeftDoorLock,
                          ),
                        )),
                    AnimatedPositioned(
                        duration: showDuration,
                        top: _controller.SelectedBottomTab == 0
                            ? Constrains.maxHeight * 0.16
                            : Constrains.maxHeight / 2,
                        child: AnimatedOpacity(
                          duration: defaulDuration,
                          opacity: _controller.SelectedBottomTab == 0 ? 1 : 0,
                          child: DoorLock(
                            isLock: _controller.isBonnetLock,
                            press: _controller.UpdateBonnetLock,
                          ),
                        )),
                    AnimatedPositioned(
                        duration: showDuration,
                        bottom: _controller.SelectedBottomTab == 0
                            ? Constrains.maxHeight * 0.18
                            : Constrains.maxHeight / 2,
                        child: AnimatedOpacity(
                          duration: defaulDuration,
                          opacity: _controller.SelectedBottomTab == 0 ? 1 : 0,
                          child: DoorLock(
                            isLock: _controller.isTrunkLock,
                            press: _controller.UpdateTrunkLock,
                          ),
                        )),
                    Opacity(
                      opacity: _animationBattery.value,
                      child: SvgPicture.asset(
                        "assets/icons/Battery.svg",
                        width: Constrains.maxWidth * 0.38,
                      ),
                    ),
                    Positioned(
                      top: 50 * (1 - _animationBatteryStatus.value),
                      height: Constrains.maxHeight,
                      width: Constrains.maxWidth,
                      child: Opacity(
                        opacity: _animationBatteryStatus.value,
                        child: BatteryStatus(
                          constraints: Constrains,
                        ),
                      ),
                    ),
                    Positioned(
                        height: Constrains.maxHeight,
                        width: Constrains.maxWidth,
                        top: 60 * (1 - _animationTempShowInfo.value),
                        child: Opacity(
                            opacity: _animationTempShowInfo.value,
                            child: TempDetail(controller: _controller))),
                    Positioned(
                        right: -180 * (1 - _animationTempCoolGlow.value),
                        child: AnimatedSwitcher(
                          duration: defaulDuration,
                          child: _controller.isCoolSelected
                              ? Image.asset(
                                  "assets/images/Cool_glow_2.png",
                                  width: 200,
                                  key: UniqueKey(),
                                )
                              : Image.asset(
                                  "assets/images/Hot_glow_4.png",
                                  width: 200,
                                  key: UniqueKey(),
                                ),
                        )),
                    //tyre
                    if (_controller.isShowTyre) ...tyres(Constrains),
                    if (_controller.isShowTyreStatus)
                      GridView.builder(
                        itemCount: 4,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: defaultPadding,
                            crossAxisSpacing: defaultPadding,
                            childAspectRatio:
                                Constrains.maxWidth / Constrains.maxHeight),
                        itemBuilder: (context, index) => ScaleTransition(
                          scale: _tyreAnimations[index],
                          child: TyrePsiCard(
                            isBottomTwoTyre: index > 1,
                            tyre_psi: DemoPsiList[index],
                          ),
                        ),
                      )
                  ],
                );
              }),
            ),
          );
        });
  }
}
