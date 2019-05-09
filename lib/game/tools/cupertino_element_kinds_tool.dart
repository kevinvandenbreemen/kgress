import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:kevin_gamify/game/tools/elementKinds/ElementKindsToolsPresenter.dart';
import 'package:kevin_gamify/game/tools/elementKinds/ElementKindsToolsPresenterProvider.dart';

class CupertinoElementKindsTool extends StatefulWidget {

  ElementKindsToolsPresenterProvider _elementKindsToolsPresenterProvider;

  CupertinoElementKindsTool({ElementKindsToolsPresenterProvider provider}) {
    this._elementKindsToolsPresenterProvider = provider;
  }

  @override
  State<CupertinoElementKindsTool> createState() {
    return CupertinoElementKindsState(_elementKindsToolsPresenterProvider);
  }

}

class CupertinoElementKindsState extends State<CupertinoElementKindsTool> {

  ElementKindsToolsPresenter presenter;

  CupertinoElementKindsState(ElementKindsToolsPresenterProvider provider) {

  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: ElementKindView()
    );
  }
}

class ElementKindView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Text("Content Goes Here");
  }
}