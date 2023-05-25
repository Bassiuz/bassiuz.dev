import 'package:auto_route/auto_route.dart';
import 'package:fluid_ui_design/fluid_ui_design.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/theme/fonts/text_scale_extension.dart';
import '../../config/theme/fonts/text_scale_helper.dart';
import '../../core/widget_list_extension.dart';
import 'mockup_page.dart';
import 'typeface_demo/typeface_scale_widget.dart';

@RoutePage()
class DesignShowcasePage extends StatefulWidget {
  const DesignShowcasePage({super.key});

  @override
  State<DesignShowcasePage> createState() => _DesignShowcasePageState();
}

class _DesignShowcasePageState extends State<DesignShowcasePage> {
  int currentFontIndex = 0;
  TextScaleHelper? _value;
  FluidConfig _config = const FluidConfig(1024);
  PageType pageType = PageType.mockupPage;

  List<TextScaleHelper> availableFonts = [];
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setFonts();
  }

  void setSelectedFontIndex(int index) => setState(() {
        currentFontIndex = index;
        setFonts();
      });

  void setWidth(double width) => setState(() {
        _config = FluidConfig(width);
        setFonts();
      });

  void setFonts() => setState(() {
        availableFonts = [
          _config.firaSans,
          _config.firaMono,
          _config.fromGoogleFont(GoogleFonts.roboto),
          _config.fromGoogleFont(GoogleFonts.comicNeue)
        ];
        _value = availableFonts[currentFontIndex];
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(context.fluid.spaces.m),
          child: Column(
            children: [
              Wrap(
                children: PageType.values
                    .map(
                      (e) => ChoiceChip(
                        label: Text(e.toString().split('.').last),
                        selected: pageType == e,
                        onSelected: (bool selected) => setState(() {
                          pageType = e;
                        }),
                      ),
                    )
                    .toList()
                    .withSeperator(SizedBox(width: context.fluid.spaces.m)),
              ),
              Wrap(
                children: availableFonts
                    .map(
                      (e) => ChoiceChip(
                        label: Text(e.bodyLarge.fontFamily!),
                        selected: _value == e,
                        onSelected: (bool selected) => setSelectedFontIndex(availableFonts.indexOf(e)),
                      ),
                    )
                    .toList()
                    .withSeperator(SizedBox(width: context.fluid.spaces.m)),
              ),
              SizedBox(
                width: double.infinity,
                child: Slider(
                  value: _config.screenWidth,
                  min: _config.viewportConfig.minViewportSize,
                  max: _config.viewportConfig.maxViewportSize,
                  label: _config.screenWidth.round().toString(),
                  onChanged: (double value) => setWidth(value),
                ),
              ),
              Text('Screenwidth: ${_config.screenWidth}'),
              Container(
                //add borders
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2,
                  ),
                ),
                width: _config.screenWidth,
                height: _config.screenWidth / 4 * 3,
                child: SingleChildScrollView(
                  child: switch (pageType) {
                    PageType.typefaceScale => TypefaceScaleWidget(config: _config, textScaleHelper: _value!),
                    PageType.mockupPage => MockupPage(config: _config, textScaleHelper: _value!),
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

enum PageType { typefaceScale, mockupPage }
