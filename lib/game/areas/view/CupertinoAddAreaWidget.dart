import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'AddAreaViewModel.dart';

/// Actual UI representation/display of the add area workflow
class CupertinoAddAreaWidget extends StatelessWidget {

  AddAreaViewModel _viewModel;

  CupertinoAddAreaWidget(this._viewModel);

  TextStyle _getItemStyle() {
    return TextStyle(

    );
  }

  Widget getSizeClassWidget(AreaSizeClass sizeClass, String label) {
    return
      Container(
        constraints: BoxConstraints(
          minWidth: 100
        ),
        decoration: BoxDecoration(
          //color: sizeClass == _viewModel.areaSize ? CupertinoColors.extraLightBackgroundGray : CupertinoColors.white
        ),
        child: Text(
          label,
          style: TextStyle(
            color: sizeClass == _viewModel.areaSize ? CupertinoColors.white : CupertinoColors.black,
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        )
      );
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    height *= 0.6;

    //  Size classes for selector!
    final Map<AreaSizeClass, Widget> sizeSelections = <AreaSizeClass, Widget> {
      AreaSizeClass.small: getSizeClassWidget(AreaSizeClass.small, "Small"),
      AreaSizeClass.medium: getSizeClassWidget(AreaSizeClass.medium, "Medium"),
      AreaSizeClass.large: getSizeClassWidget(AreaSizeClass.large, "Large"),
      AreaSizeClass.custom: getSizeClassWidget(AreaSizeClass.custom, "Custom")
    };

    return Container(
      constraints: BoxConstraints(
        maxHeight: height,
        maxWidth: width
      ),
      decoration: BoxDecoration(

      ),
      child: CupertinoActionSheet(
        actions: <Widget>[
          Container(
            constraints: BoxConstraints(
              maxWidth: width,
              maxHeight: height * 0.7
            ),
            decoration: BoxDecoration(
              color: CupertinoColors.white
            ),
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                          top: 10,
                          left: 10,
                          right: 10
                      ),
                      child: Image.asset(
                          "assets/images/add_place.png",
                          height: height * 0.12,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 10,
                        right: 10
                      ),
                      width: width * 0.8,
                      child: Text(
                        "Add a new place or area to your game.  Specify the size in the selector below!",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: CupertinoColors.black,
                          fontSize: 18
                        ),
                      ),
                    )

                  ],
                ),
                Container(
                  constraints: BoxConstraints(
                    minHeight: height * 0.2,
                  ),
                  alignment: FractionalOffset(0.0, 0.0),
                  padding: EdgeInsets.only(
                    top: 20.0
                  ),
                  child: CupertinoSegmentedControl<AreaSizeClass>(
                      groupValue: _viewModel.areaSize,
                      children: sizeSelections,
                      selectedColor: CupertinoColors.darkBackgroundGray,
                      borderColor: CupertinoColors.black,
                      pressedColor: CupertinoColors.lightBackgroundGray,
                      onValueChanged: (sizeClass) {
                        switch(sizeClass) {
                          case AreaSizeClass.small:
                            _viewModel.setSmall();
                            break;
                          case AreaSizeClass.medium:
                            _viewModel.setMedium();
                            break;
                          case AreaSizeClass.large:
                            _viewModel.setLarge();
                            break;
                          case AreaSizeClass.custom:
                            _viewModel.switchToCustom();
                            break;
                        }
                      }),
                )
              ],
            ),
          ),
          CupertinoActionSheetAction(
              onPressed: null,
              child: null)
        ],
        cancelButton: CupertinoActionSheetAction(onPressed: ()=>Navigator.pop(context, 'Cancel'), child: Text("Cancel")),
      ),
    );
  }
}