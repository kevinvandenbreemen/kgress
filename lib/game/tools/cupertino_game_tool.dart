import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kevin_gamify/game/areas/model/Area.dart';
import 'package:kevin_gamify/game/cartridge/GameCartridge.dart';
import 'package:kevin_gamify/game/tools/GameToolsPresenter.dart';
import 'package:kevin_gamify/game/tools/GameToolsPresenterProvider.dart';
import 'package:kevin_gamify/game/tools/GameToolsView.dart';
import 'package:kevin_gamify/game/world/game_world.dart';

class CupertinoGameToolsApp extends StatelessWidget {

  GameCartridge game;

  CupertinoGameToolsApp(this.game);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData(
          barBackgroundColor: CupertinoColors.darkBackgroundGray,
          brightness: Brightness.dark,
          scaffoldBackgroundColor: CupertinoColors.darkBackgroundGray,
          primaryContrastingColor: CupertinoColors.white,
          textTheme: CupertinoTextThemeData(
              primaryColor: Colors.orange,
              textStyle: TextStyle(
                  color: Colors.orangeAccent
              )
          )
      ),
      home: CupertinoGameToolingScaffold(game),
    );
  }
}

class CupertinoGameToolingScaffold extends StatelessWidget with GameToolsView {

  /// Main app logic access for the game builder
  GameToolsPresenter _presenter;

  GameWorldWidget _gameWorld;

  CupertinoGameToolingScaffold(GameCartridge game) {
    this._presenter = DefaultGameToolsPresenterProvider(game).get(this);
    this._presenter.setCurrentArea(game.areas[0]);
    this._gameWorld = GameWorldWidget(game.elementControllerRepository, GameSettings(
      5
    ), currentArea: game.areas[0]);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
          backgroundColor: CupertinoColors.black,
          actionsForegroundColor: CupertinoColors.extraLightBackgroundGray,
          trailing: CupertinoButton(
            child: Icon(CupertinoIcons.book_solid, color: Colors.orangeAccent,),
            onPressed: ()=>showMainMenu(context),
          )

      ),
      child: _gameWorld,
    );
  }

  /// Display main menu for the main game tools
  void showMainMenu(BuildContext context) {
    _showModalPopup(context, child: CupertinoActionSheet(
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: const Text("Visit An Area of My Game"),
          onPressed: () {
            Navigator.pop(context);
            showAreaSelector(_presenter.getAreas(), context);
          },
        ),
        CupertinoActionSheetAction(
          child: const Text("Go to Layer"),
          onPressed: (){
            Navigator.pop(context);
            showLayerSelector(_presenter.getLayerNumbers(), context);
          },
        ),
        CupertinoActionSheetAction(
          child: const Text("Element Kinds"),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
      cancelButton: CupertinoActionSheetAction(onPressed: ()=>Navigator.pop(context, 'Cancel'), child: Text("Cancel")),
    ));
  }

  void _showModalPopup(BuildContext context, {Widget child}) {
    showCupertinoModalPopup(context: context, builder: (BuildContext context) => child);
  }

  @override
  void showAreaSelector(List<Area> areas, BuildContext context) {

    FixedExtentScrollController controller = FixedExtentScrollController(initialItem: 0);


    CupertinoPicker picker = CupertinoPicker(
      backgroundColor: Color.fromRGBO(0, 0, 0, 0.0),
        scrollController: controller,
        magnification: 1.0,
        itemExtent: 40.0,
        children: List<Widget>.generate(areas.length, (index){
          return Container(
              padding: EdgeInsets.all(10),
              child: Text(areas[index].name,
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
                children: <Widget>[
                  Container(
                    height: 200,
                    child: picker,
                  )
                ],
              )
          ),
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: Text("OK"),
              onPressed: () {
                Navigator.pop(context);
                _presenter.goToArea(areas[controller.selectedItem], context, layerNum: -1);
              },
            )
          ],
          cancelButton: CupertinoActionSheetAction(onPressed: ()=>Navigator.pop(context, 'Cancel'), child: Text("Cancel")),
        ));
    
  }

  @override
  void goToArea(Area area, BuildContext context) {
    _gameWorld.gotoArea(area, context);
  }

  void showLayerSelector(List<int> layerNumbers, BuildContext context) {
    FixedExtentScrollController controller = FixedExtentScrollController(initialItem: 0);

    CupertinoPicker picker = CupertinoPicker(
        backgroundColor: Color.fromRGBO(0, 0, 0, 0.0),
        scrollController: controller,
        magnification: 1.0,
        itemExtent: 40.0,
        children: List<Widget>.generate(layerNumbers.length, (index){
          return Container(
              padding: EdgeInsets.all(10),
              child: Text("${layerNumbers[index]}",
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
                children: <Widget>[
                  Container(
                    height: 200,
                    child: picker,
                  )
                ],
              )
          ),
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: Text("OK"),
              onPressed: () {
                Navigator.pop(context);
                //_presenter.goToArea(areas[controller.selectedItem], context, layerNum: -1);
                _presenter.gotoLayer(controller.selectedItem, context);
              },
            )
          ],
          cancelButton: CupertinoActionSheetAction(onPressed: ()=>Navigator.pop(context, 'Cancel'), child: Text("Cancel")),
        ));
  }

}