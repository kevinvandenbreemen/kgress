import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kevin_gamify/game/areas/model/Area.dart';
import 'package:kevin_gamify/game/tools/GameToolsPresenter.dart';
import 'package:kevin_gamify/game/tools/GameToolsPresenterProvider.dart';
import 'package:kevin_gamify/game/tools/GameToolsView.dart';

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

class CupertinoGameToolingScaffold extends StatelessWidget with GameToolsView {

  /// Main app logic access for the game builder
  GameToolsPresenter _presenter;

  CupertinoGameToolingScaffold() {
    this._presenter = DefaultGameToolsPresenterProvider().get(this);
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
          child: const Text("Visit An Area of My Game"),
          onPressed: () {
            showAreaSelector(_presenter.getAreas(), context);
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

    List<Widget> areaWidgets = List();
    areas.forEach((area) {
      areaWidgets.add(CupertinoButton(child: Text(area.name), 
          onPressed: ()=>_presenter.goToArea(area, context)));
    });

    CupertinoPicker picker = CupertinoPicker(
        magnification: 1.0,
        itemExtent: 20.0,
        children: areaWidgets
    );

    _showModalPopup(context,
        child: Container(
          height: 300,
          decoration: BoxDecoration(
              color: CupertinoColors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.0),
                topLeft: Radius.circular(10.0),
              )
          ),
          child: Column(
            children: <Widget>[
              Text("Select an Area to Visit"),
              Container(
                decoration: BoxDecoration(
                    color: CupertinoColors.white
                ),
                height: 200,
                child: picker,
              )
            ],
          ),
        ));
    
  }

  @override
  void goToArea(Area area, BuildContext context) {
    // TODO: implement goToArea
  }

}