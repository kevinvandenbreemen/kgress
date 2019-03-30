import 'package:flutter/widgets.dart';
import 'package:kevin_gamify/game/areas/model/Area.dart';
import 'package:kevin_gamify/game/areas/model/AreaBuilder.dart';
import 'package:kevin_gamify/game/areas/view/AddAreaWidgetProvider.dart';
import 'package:kevin_gamify/game/cartridge/GameBuilderPresenter.dart';

class AddAreaContainer extends StatefulWidget {

  GameBuilderPresenter _gameBuilderPresenter;


  AddAreaContainer(this._gameBuilderPresenter);

  @override
  State createState() {
    return AddAreaState(_gameBuilderPresenter);
  }
}

class AddAreaState extends State<AddAreaContainer>  {

  AddAreaViewModel _viewModel;

  GameBuilderPresenter _gameBuilderPresenter;


  AddAreaState(this._gameBuilderPresenter) {
    this._viewModel = AddAreaViewModel();
    _viewModel._state = this;
  }

  @override
  Widget build(BuildContext context) {
    return AddAreaWidgetProvider().getWidget(_viewModel, _gameBuilderPresenter);
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

  String error;

  int get specifiedSize => _builder.size;

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
    _builder.size = 0;
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

  void showError(String error){
    this.error = error;
    _state.setState((){});
  }

  Area build() => _builder.area;

}