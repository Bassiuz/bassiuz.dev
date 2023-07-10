import 'package:fluid_ui_design/fluid_ui_design.dart';
import 'package:flutter/material.dart';

import 'phone_layer_widget.dart';

class AnimatedPhoneWidget extends StatelessWidget {
  const AnimatedPhoneWidget({super.key, required this.height, required this.percentageVisible});

  final double height;
  final double percentageVisible;

  FluidSize _avatarHeight(BuildContext context) => FluidSize(fluidConfig: context.fluid, min: 220, max: 250);
  FluidSize _bottomAvatarPadding(BuildContext context) => FluidSize(fluidConfig: context.fluid, min: 330, max: 390);

  FluidSize _phoneHeight(BuildContext context) => FluidSize(fluidConfig: context.fluid, min: 600, max: 700);
  FluidSize _bottomPhonePadding(BuildContext context) => FluidSize(fluidConfig: context.fluid, min: 0, max: 0);

  FluidSize _backgroundHeight(BuildContext context) => FluidSize(fluidConfig: context.fluid, min: 470, max: 550);
  FluidSize _backgroundPadding(BuildContext context) => FluidSize(fluidConfig: context.fluid, min: 80, max: 95);

  FluidSize _menuItemHeight(BuildContext context) => FluidSize(fluidConfig: context.fluid, min: 30, max: 40);

  final double phoneScrollFactor = 2;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _phoneHeight(context).value,
      child: Stack(
        children: [
          PhoneLayerWidget(
            phoneLayerContent: Container(
              color: Colors.white,
              height: _backgroundHeight(context).value,
              width: _avatarHeight(context).value,
            ),
            bottomPadding: _backgroundPadding(context).value,
            percentageVisible: percentageVisible,
            totalHeight: _phoneHeight(context).value,
            scrollFactor: phoneScrollFactor,
          ),
          PhoneLayerWidget(
            phoneLayerContent: Image.asset(
              'assets/images/bassie.jpeg',
              fit: BoxFit.fitHeight,
              height: _avatarHeight(context).value,
            ),
            bottomPadding: _bottomAvatarPadding(context).value,
            percentageVisible: percentageVisible,
            totalHeight: _phoneHeight(context).value,
            scrollFactor: 1,
          ),
          PhoneLayerWidget(
            phoneLayerContent: Container(
                color: Colors.white,
                width: _avatarHeight(context).value,
                height: _menuItemHeight(context).value,
                child: const Center(
                  child: Text(
                    'B@sdevaan.nl',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                )),
            bottomPadding: _bottomAvatarPadding(context).value - _menuItemHeight(context).value,
            percentageVisible: percentageVisible,
            totalHeight: _phoneHeight(context).value,
            scrollFactor: 1.2,
          ),
          PhoneLayerWidget(
            phoneLayerContent: Container(
                color: Colors.white,
                width: _avatarHeight(context).value,
                height: _menuItemHeight(context).value,
                child: const Center(
                  child: Text(
                    'Blog',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                )),
            bottomPadding: _bottomAvatarPadding(context).value - (_menuItemHeight(context).value * 2),
            percentageVisible: percentageVisible,
            totalHeight: _phoneHeight(context).value,
            scrollFactor: 1.2,
          ),
          PhoneLayerWidget(
            phoneLayerContent: Container(
                color: Colors.white,
                width: _avatarHeight(context).value,
                height: _menuItemHeight(context).value,
                child: const Center(
                  child: Text(
                    'Showcase',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                )),
            bottomPadding: _bottomAvatarPadding(context).value - (_menuItemHeight(context).value * 3),
            percentageVisible: percentageVisible,
            totalHeight: _phoneHeight(context).value,
            scrollFactor: 1.3,
          ),
          PhoneLayerWidget(
            phoneLayerContent: Container(
                color: Colors.white,
                width: _avatarHeight(context).value,
                height: _menuItemHeight(context).value,
                child: const Center(
                  child: Text(
                    'Contact',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                )),
            bottomPadding: _bottomAvatarPadding(context).value - (_menuItemHeight(context).value * 4),
            percentageVisible: percentageVisible,
            totalHeight: _phoneHeight(context).value,
            scrollFactor: 1.4,
          ),
          PhoneLayerWidget(
            phoneLayerContent: Container(
                color: Colors.white,
                width: _avatarHeight(context).value,
                height: _menuItemHeight(context).value,
                child: const Center(
                  child: Text(
                    'Me',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                )),
            bottomPadding: _bottomAvatarPadding(context).value - (_menuItemHeight(context).value * 5),
            percentageVisible: percentageVisible,
            totalHeight: _phoneHeight(context).value,
            scrollFactor: 1.5,
          ),
          PhoneLayerWidget(
            phoneLayerContent: Image.asset(
              'assets/images/phone.png',
              height: _phoneHeight(context).value,
              fit: BoxFit.fitHeight,
              alignment: Alignment.bottomCenter,
            ),
            bottomPadding: _bottomPhonePadding(context).value,
            percentageVisible: percentageVisible,
            totalHeight: _phoneHeight(context).value,
            scrollFactor: phoneScrollFactor,
          ),
        ],
      ),
    );
  }
}
