import 'package:flame/flame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kevin_gamify/example/drawers/ExampleElementDrawerRepository.dart';
import 'package:kevin_gamify/example/kinds/example_kinds.dart';
import 'package:kevin_gamify/game/MainGame.dart';
import 'package:kevin_gamify/game/areas/model/Area.dart';
import 'package:kevin_gamify/game/areas/view/AddAreaViewModel.dart';
import 'package:kevin_gamify/game/cartridge/GameBuilderPresenter.dart';
import 'package:kevin_gamify/game/cartridge/GameBuilderPresenterProvider.dart';
import 'package:kevin_gamify/game/cartridge/GameBuilderView.dart';
import 'package:kevin_gamify/game/cartridge/GameCartridge.dart';
import 'package:kevin_gamify/game/components/buttons/ControlArea.dart';
import 'package:kevin_gamify/game/components/speech/SpeechArea.dart';
import 'package:kevin_gamify/game/controller/area_controller.dart';
import 'package:kevin_gamify/game/controller/element_controllers_repository_default.dart';
import 'package:kevin_gamify/game/elements/element.dart' as elements;

void main() => runApp(CupertinoGameEditorApp());

class CupertinoGameEditorApp extends StatelessWidget {

  GameCartridge _cartridge;

  CupertinoGameEditorApp({GameCartridge cartridgeToEdit}) {
    this._cartridge = cartridgeToEdit;
  }

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
      home: CupertinoGameEditorScaffold(catridgeToEdit: _cartridge,),
    );
  }
}

class CupertinoGameEditorScaffold extends StatelessWidget with GameBuilderView {

  /// Main app logic access for the game builder
  GameBuilderPresenter _presenter;

  CupertinoGameEditorScaffold({GameCartridge catridgeToEdit}) {
    this._presenter = DefaultGameBuilderPresenterProvider().get(catridgeToEdit, this);
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
      child: GameWorld(),
    );
  }

  /// Display main menu for the main game editor
  void showMainMenu(BuildContext context) {
    _showModalPopup(context, child: CupertinoActionSheet(
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: const Text("Create Area"),
          onPressed: () {
            Navigator.pop(context);
            _showModalPopup(context, child: AddAreaContainer(_presenter));
          },
        )
      ],
      cancelButton: CupertinoActionSheetAction(onPressed: ()=>Navigator.pop(context, 'Cancel'), child: Text("Cancel")),
    ));
  }

  void _showModalPopup(BuildContext context, {Widget child}) {
    showCupertinoModalPopup(context: context, builder: (BuildContext context) => child);
  }
  
}

class GameWorld extends StatelessWidget {

  GameSettings gameSettings = GameSettings(5);

  @override
  Widget build(BuildContext context) {

    SpeechArea speechArea = SpeechArea();
    Area currentArea = Area(25, "Test Area");

    elements.Element e1 = elements.Element(floorTile);
    e1.locXinTiles = 0;
    e1.locYinTiles = 0;
    AreaForEdit editor = AreaForEdit(currentArea);
    editor.addElement(e1);

    AreaController areaController = AreaController(
      controllerRepository: DefaultElementControllersRepository(ExampleElementDrawerRepository()),
      area: currentArea,
      gameSettings: gameSettings
    );

    GameModel model = GameModel(
        speechCallback: (String toSay) => speechArea.setText(toSay),
        settings: gameSettings,
        currentArea: areaController
    );

    return Stack(
      children: <Widget>[
        model.widget(),
        speechArea,
        ControlArea(model),
      ],
    );
  }
}