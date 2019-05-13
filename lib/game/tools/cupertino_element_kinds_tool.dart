import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kevin_gamify/game/areas/model/Area.dart';
import 'package:kevin_gamify/game/cartridge/GameCartridge.dart';
import 'package:kevin_gamify/game/elements/element_kinds.dart';
import 'package:kevin_gamify/game/imagesets/element_drawers.dart';
import 'package:kevin_gamify/game/tools/elementKinds/ElementKindsToolsPresenter.dart';
import 'package:kevin_gamify/game/tools/elementKinds/ElementKindsToolsPresenterProvider.dart';
import 'package:kevin_gamify/game/tools/elementKinds/ElementKindsToolsView.dart';
import 'package:kevin_gamify/game/world/game_world.dart';

import 'elementKinds/ElementKindsToolElementController.dart';

class CupertinoElementKindsToolApp extends StatelessWidget {

  ElementKindsToolsPresenterProvider _elementKindsToolsPresenterProvider;
  GameCartridge _cartridge;
  List<ElementKind> _elementKinds;

  CupertinoElementKindsToolApp({ElementKindsToolsPresenterProvider provider, GameCartridge gameCartridge, List<ElementKind> elementKinds}) {
    this._elementKindsToolsPresenterProvider = provider;
    this._cartridge = gameCartridge;
    this._elementKinds = elementKinds;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData(
        barBackgroundColor: CupertinoColors.black
      ),
      home: CupertinoElementKindsTool(
        provider: _elementKindsToolsPresenterProvider,
        elementKinds: _elementKinds,
        gameCartridge: _cartridge,
      )
    );
  }

}

class CupertinoElementKindsTool extends StatefulWidget {

  ElementKindsToolsPresenterProvider _elementKindsToolsPresenterProvider;
  GameCartridge _cartridge;
  List<ElementKind> _elementKinds;
  Function(ElementKindsToolsPresenter) _onCreatePresenter;

  CupertinoElementKindsTool({ElementKindsToolsPresenterProvider provider, GameCartridge gameCartridge, List<ElementKind> elementKinds}) {
    this._elementKindsToolsPresenterProvider = provider;
    this._cartridge = gameCartridge;
    this._elementKinds = elementKinds;
  }

  @override
  State<CupertinoElementKindsTool> createState() {
    return CupertinoElementKindsState(_elementKindsToolsPresenterProvider, _cartridge, _elementKinds);
  }

}

class CupertinoElementKindsState extends State<CupertinoElementKindsTool> with ElementKindsToolsView {

  ElementKindsToolsPresenter presenter;

  GameSettings _settings;

  ElementDrawerRepository _elementDrawerRepository;

  List<ElementKind> _elementKinds;

  /// Widget for showing the element kinds
  GameWorldWidget _gameWorld;

  CupertinoElementKindsState(ElementKindsToolsPresenterProvider provider, GameCartridge cartridge, List<ElementKind> kinds) {
    this.presenter = provider.getPresenter(view: this, elementKinds: kinds, gameCartridge: cartridge);
    this._settings = GameSettings(5);
    presenter.start();
  }

  Widget getDefaultWidget(BuildContext context) {
    return Center(
      child: Text("Please select an element kind to view"),
    );
  }



  @override
  Widget build(BuildContext context) {

    double bottomBarFactor = 0.10;
    double maxHeight = 1 - bottomBarFactor;

    Size screenSize = MediaQuery.of(context).size;

    Widget toShow;
    if(_gameWorld != null){
      toShow = _gameWorld;
    } else {
      toShow = getDefaultWidget(context);
    }

    return CupertinoPageScaffold(
      child: CupertinoPageScaffold(
          backgroundColor: CupertinoColors.lightBackgroundGray,
          child: toShow
      ),
      backgroundColor: CupertinoColors.black,
      navigationBar: CupertinoNavigationBar(
          backgroundColor: CupertinoColors.activeBlue,
          actionsForegroundColor: CupertinoColors.activeBlue,
          trailing: CupertinoButton(
            child: Icon(CupertinoIcons.book_solid, color: CupertinoColors.activeGreen,),
            onPressed: ()=>_showElementKindSelector(context),
          )
      ),
    );
  }

  void _showElementKindSelector(BuildContext context) {

    FixedExtentScrollController controller = FixedExtentScrollController(initialItem: 0);

    CupertinoPicker picker = CupertinoPicker(
        backgroundColor: Color.fromRGBO(0, 0, 0, 0.0),
        scrollController: controller,
        magnification: 1.0,
        itemExtent: 40.0,
        children: List<Widget>.generate(_elementKinds.length, (index){
          return Container(
              padding: EdgeInsets.all(10),
              child: Text(_elementKinds[index].name,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18
                ),
              ));
        })
    );

    _showModalPopup(context,
        child: CupertinoActionSheet(
          message: Container(
            child: Column(
              children: <Widget>[Container(
                height: 200,
                child: picker,
              )],
            ),
          ),
          actions: <Widget>[
            CupertinoActionSheetAction(
                child: Text("OK"),
                onPressed: () {

                  //  See https://stackoverflow.com/questions/49611392/dismissing-a-cupertino-dialogue-action-flutter
                  //  Also see referenced API doc:
                  //  The dialog route created by this method is pushed to the root navigator. If the application has multiple Navigator objects, it may be necessary to call
                  //  Navigator.of(context, rootNavigator: true).pop(result) to close the dialog rather than just Navigator.pop(context, result).
                  //  in https://docs.flutter.io/flutter/material/showDialog.html
                  Navigator.of(context, rootNavigator: true).pop("OK");
                  presenter.selectKind(_elementKinds[controller.selectedItem]);
                } )
          ],
          cancelButton: CupertinoActionSheetAction(onPressed: ()=>Navigator.of(context, rootNavigator: true).pop("Cancel"), child: Text("Cancel")),
        )
    );

  }

  @override
  void showElementKind(Area area) {

    if(_gameWorld == null) {
      setState(() {
        _gameWorld =
            GameWorldWidget(ElementKindsToolElementControllersRepository(
                _elementDrawerRepository
            ), _settings, currentArea: area,);
      });
    } else {
      _gameWorld.gotoArea(area);
    }

  }


  @override
  void setElementDrawerRepository(
      ElementDrawerRepository elementDrawerRepository) {
    this._elementDrawerRepository = elementDrawerRepository;
  }

  void _showModalPopup(BuildContext context, {Widget child}) {
    showCupertinoModalPopup(context: context, builder: (BuildContext context) => child);
  }

  @override
  void setElementKinds(List<ElementKind> kinds) {
    this._elementKinds = kinds;
  }

  @override
  void setGameSettings(GameSettings settings) {
    _settings = settings;
  }


}