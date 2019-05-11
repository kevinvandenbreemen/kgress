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
              onPressed: ()=>_showElementKindSelector(context),
            )
        ),
      )
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
              Navigator.pop(context);
              _showElementKind(_elementKinds[controller.selectedItem]);
            } )
        ],
        cancelButton: CupertinoActionSheetAction(onPressed: ()=>Navigator.pop(context, 'Cancel'), child: Text("Cancel")),
      )
    );

  }

  void _showElementKind(ElementKind _kind) {

  }

  void _showModalPopup(BuildContext context, {Widget child}) {
    showCupertinoModalPopup(context: context, builder: (BuildContext context) => child);
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

    double bottomBarFactor = 0.10;
    double maxHeight = 1 - bottomBarFactor;

    Size screenSize = MediaQuery.of(context).size;

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.lightBackgroundGray,
      child: Container(
        decoration: BoxDecoration(
          color: CupertinoColors.activeGreen
        ),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                top: 0.0,
                bottom: screenSize.height * (maxHeight - 0.07)
              ),
              decoration: BoxDecoration(
                color: CupertinoColors.destructiveRed
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: CupertinoColors.activeOrange
                ),
              ),
            )
          ],
        ),
      )
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