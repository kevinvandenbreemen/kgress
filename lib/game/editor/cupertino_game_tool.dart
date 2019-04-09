import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kevin_gamify/game/cartridge/GameBuilderPresenter.dart';
import 'package:kevin_gamify/game/cartridge/GameBuilderPresenterProvider.dart';
import 'package:kevin_gamify/game/cartridge/GameBuilderView.dart';
import 'package:kevin_gamify/game/cartridge/GameCartridge.dart';

class CupertinoGameToolsApp extends StatelessWidget {

  CupertinoGameToolsApp();

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
      home: CupertinoGameToolingScaffold(),
    );
  }
}

class CupertinoGameToolingScaffold extends StatelessWidget with GameBuilderView {

  /// Main app logic access for the game builder
  GameBuilderPresenter _presenter;

  CupertinoGameToolingScaffold() {
    this._presenter = DefaultGameBuilderPresenterProvider().get(this);
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
      child: Text("Content Here"),
    );
  }

  /// Display main menu for the main game tools
  void showMainMenu(BuildContext context) {
    _showModalPopup(context, child: CupertinoActionSheet(
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: const Text("Element Testing"),
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

}