import 'package:flutter/widgets.dart';
import 'package:kevin_gamify/game/areas/view/AddAreaViewModel.dart';
import 'package:kevin_gamify/game/areas/view/CupertinoAddAreaWidget.dart';
import 'package:kevin_gamify/game/cartridge/GameBuilderPresenter.dart';

class AddAreaWidgetProvider {

  Widget getWidget(AddAreaViewModel addAreaViewModel, GameBuilderPresenter presenter) {
    return CupertinoAddAreaWidget(addAreaViewModel, presenter);
  }

}