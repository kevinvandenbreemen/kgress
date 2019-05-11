import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kevin_gamify/game/cartridge/GameCartridge.dart';
import 'package:kevin_gamify/game/elements/element_kinds.dart';
import 'package:kevin_gamify/game/tools/elementKinds/ElementKindsToolsPresenter.dart';
import 'package:kevin_gamify/game/tools/elementKinds/ElementKindsToolsPresenterProvider.dart';
import 'package:kevin_gamify/game/tools/elementKinds/ElementKindsToolsView.dart';

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
      //  CupertinoElementKindsTool(elementKinds: _elementKinds, gameCartridge: _cartridge, provider: _elementKindsToolsPresenterProvider),
      home: CupertinoPageScaffold(
        child: CupertinoElementKindsTool(elementKinds: _elementKinds, gameCartridge: _cartridge, provider: _elementKindsToolsPresenterProvider),
        backgroundColor: CupertinoColors.black,
        navigationBar: CupertinoNavigationBar(
          backgroundColor: CupertinoColors.activeBlue,
            actionsForegroundColor: CupertinoColors.activeBlue,
            trailing: CupertinoButton(
              child: Icon(CupertinoIcons.book_solid, color: CupertinoColors.activeGreen,),
              //onPressed: ()=>showMainMenu(context),
            )
        ),
      )
    );
  }

}

class CupertinoElementKindsTool extends StatefulWidget {

  ElementKindsToolsPresenterProvider _elementKindsToolsPresenterProvider;
  GameCartridge _cartridge;
  List<ElementKind> _elementKinds;

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

  CupertinoElementKindsState(ElementKindsToolsPresenterProvider provider, GameCartridge cartridge, List<ElementKind> kinds) {
    this.presenter = provider.getPresenter(view: this, elementKinds: kinds);
    this._settings = GameSettings(5);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.lightBackgroundGray,
      child: Text("Content Goes Here")
    );
  }

  @override
  void setElementKinds(List<ElementKind> kinds) {

  }

  @override
  void setGameSettings(GameSettings settings) {
    setState(() {
      _settings = settings;
    });
  }


}