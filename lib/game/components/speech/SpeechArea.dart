import 'package:flutter/widgets.dart';
import 'package:character_talk/character_talk.dart';

class SpeechArea extends StatefulWidget {

  SpeechState _state;

  SpeechArea() {
    _state = SpeechState();
  }

  @override
  State<StatefulWidget> createState() {
    return _state;
  }

  void setText(String toSay) {
    _state.setText(toSay);
  }

}

class SpeechState extends State<SpeechArea> {

  String _text;

  void setText(String toSay) {
    setState(() {
      _text = toSay;
    });
  }

  @override
  Widget build(BuildContext context) {

    Widget child;
    if(_text != null){
      child = CharacterTalk().getSpeechDisplay(context: context, text: _text);
    } else {
      child = Container(
        height: 0.0,
        width: 0.0,
      );
    }

    return Center(
      child: Container(
        alignment:FractionalOffset(0.0, 0.0),
        child: child,
      ),
    );
  }
}