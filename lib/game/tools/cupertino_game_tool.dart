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
            Navigator.pop(context);
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

    FixedExtentScrollController controller = FixedExtentScrollController(initialItem: 0);


    CupertinoPicker picker = CupertinoPicker(
      backgroundColor: Color.fromRGBO(0, 0, 0, 0.0),
        scrollController: controller,
        magnification: 1.0,
        itemExtent: 40.0,
        children: List<Widget>.generate(areas.length, (index){
          return Text(areas[index].name,
            textAlign: TextAlign.center,

            style: TextStyle(

                fontSize: 18
            ),
          );
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
              onPressed: ()=>_presenter.goToArea(areas[controller.selectedItem], context),
            )
          ],
          cancelButton: CupertinoActionSheetAction(onPressed: ()=>Navigator.pop(context, 'Cancel'), child: Text("Cancel")),
        ));
    
  }

  @override
  void goToArea(Area area, BuildContext context) {
    print("Go to ${area.name}");
  }

}