import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kevin_gamify/game/MainGame.dart';
import 'package:kevin_gamify/game/areas/view/AddAreaViewModel.dart';
import 'package:kevin_gamify/game/cartridge/GameBuilderPresenter.dart';
import 'package:kevin_gamify/game/components/buttons/ControlArea.dart';
import 'package:kevin_gamify/game/components/speech/SpeechArea.dart';

void main() => runApp(CupertinoGameEditorApp());

class CupertinoGameEditorApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData(
        barBackgroundColor: CupertinoColors.darkBackgroundGray,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: CupertinoColors.darkBackgroundGray,
        textTheme: CupertinoTextThemeData(
          primaryColor: Colors.orange,
          textStyle: TextStyle(
            color: Colors.orangeAccent
          )
        )
      ),
      home: CupertinoGameEditorScaffold(),
    );
  }
}

class CupertinoGameEditorScaffold extends StatelessWidget {

  /// Main app logic access for the game builder
  GameBuilderPresenter _presenter;

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
            _showModalPopup(context, child: AddAreaContainer());
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

  @override
  Widget build(BuildContext context) {

    SpeechArea area = SpeechArea();

    GameModel model = GameModel(
        speechCallback: (String toSay) => area.setText(toSay)
    );

    return Stack(
      children: <Widget>[
        model.widget(),
        area,
        ControlArea(model),
      ],
    );
  }
}