import 'package:flutter/widgets.dart';
import 'package:kevin_gamify/game/areas/view/AddAreaViewModel.dart';
import 'package:kevin_gamify/game/areas/view/CupertinoAddAreaWidget.dart';

class AddAreaWidgetProvider {

  Widget getWidget(AddAreaViewModel addAreaViewModel) {
    return CupertinoAddAreaWidget(addAreaViewModel);
  }

}