import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

import 'AddAreaViewModel.dart';

/// Actual UI representation/display of the add area workflow
class CupertinoAddAreaWidget extends StatelessWidget {

  AddAreaViewModel _viewModel;

  CupertinoAddAreaWidget(this._viewModel);

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;


    height *= 0.6;

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
              maxHeight: height * 0.9
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
                          top: 5,
                          left: 5,
                          right: 10
                      ),
                      child: Image.asset(
                          "assets/images/add_place.png",
                          height: height * 0.1,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: 5,
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
                )
              ],
            ),
          )
        ],
        cancelButton: CupertinoActionSheetAction(onPressed: ()=>Navigator.pop(context, 'Cancel'), child: Text("Cancel")),
      ),
    );
  }
}