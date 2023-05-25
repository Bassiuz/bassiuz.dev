import 'package:auto_route/auto_route.dart';
import 'package:fluid_ui_design/fluid_ui_design.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/theme/fonts/text_scale_extension.dart';
import '../../config/theme/fonts/text_scale_helper.dart';
import '../../core/widget_list_extension.dart';
import 'typeface_demo/typeface_scale_widget.dart';

@RoutePage()
class DesignShowcasePage extends StatefulWidget {
  const DesignShowcasePage({super.key});

  @override
  State<DesignShowcasePage> createState() => _DesignShowcasePageState();
}

class _DesignShowcasePageState extends State<DesignShowcasePage> {
  TextScaleHelper? _value;

  List<TextScaleHelper> availableFonts = [];
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    availableFonts = [
      Theme.of(context).firaSans,
      Theme.of(context).firaMono,
      Theme.of(context).fromGoogleFont(GoogleFonts.roboto),
      Theme.of(context).fromGoogleFont(GoogleFonts.comicNeue)
    ];
    _value = availableFonts.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(context.fluid.spaces.m),
          child: Column(
            children: [
              Wrap(
                children: availableFonts
                    .map(
                      (e) => ChoiceChip(
                        label: Text(e.bodyLarge.fontFamily!),
                        selected: _value == e,
                        onSelected: (bool selected) {
                          setState(() {
                            _value = selected ? e : null;
                          });
                        },
                      ),
                    )
                    .toList()
                    .withSeperator(SizedBox(width: context.fluid.spaces.m)),
              ),
              if (_value != null) TypefaceScaleWidget(textScaleHelper: _value!),
            ],
          ),
        ),
      ),
    );
  }
}
