import 'package:flutter/widgets.dart';
import 'package:kevin_gamify/game/areas/model/Area.dart';
import 'package:kevin_gamify/game/areas/model/AreaBuilder.dart';
import 'package:kevin_gamify/game/areas/view/AddAreaWidgetProvider.dart';

class AddAreaContainer extends StatefulWidget {

  @override
  State createState() {
    return AddAreaState();
  }
}

class AddAreaState extends State<AddAreaContainer>  {

  AddAreaViewModel _viewModel;

  AddAreaState() {
    this._viewModel = AddAreaViewModel();
    _viewModel._state = this;
  }

  @override
  Widget build(BuildContext context) {
    return AddAreaWidgetProvider().getWidget(_viewModel);
  }


}

/// Not persisted, this enum helps with UI
enum AreaSizeClass {
  small,
  medium,
  large,
  custom
}

class AddAreaViewModel {

  AreaBuilder _builder;

  AddAreaState _state;

  AreaSizeClass areaSize;

  AddAreaViewModel() {
    _builder = AreaBuilder();
  }

  Area getArea() {
    return _builder.area;
  }

  void setSmall() {
    _builder.size = 10;
    areaSize = AreaSizeClass.small;
    _refresh();
  }

  void setMedium() {
    _builder.size = 25;
    areaSize = AreaSizeClass.medium;
    _refresh();
  }

  void setLarge() {
    _builder.size = 100;
    areaSize = AreaSizeClass.large;
    _refresh();
  }

  void switchToCustom() {
    areaSize = AreaSizeClass.custom;
    _refresh();
  }

  void setCustomSize(int size) {
    _builder.size = size;
    areaSize = AreaSizeClass.custom;
    _refresh();
  }

  void _refresh() {
    if(_state != null){
      _state.setState((){});
    }
  }

}