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

    width *= 0.9;
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
              color: CupertinoColors.activeBlue
            ),
          )
        ],
        cancelButton: CupertinoActionSheetAction(onPressed: ()=>Navigator.pop(context, 'Cancel'), child: Text("Cancel")),
      ),
    );
  }
}