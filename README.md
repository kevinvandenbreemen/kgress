- [Introduction](#introduction)
  - [IMPORTANT](#important)
- [Getting Started](#getting-started)
  - [Examples](#examples)
  - [Game Tools](#game-tools)
  - [Elements](#elements)
    - [Definining an Element Kind](#definining-an-element-kind)
      - [Adding Images](#adding-images)
        - [Adding Animations for Movement](#adding-animations-for-movement)
    - [Adding an Element](#adding-an-element)
    - [Adding movement and actions](#adding-movement-and-actions)
- [Architecture](#architecture)
  - [Overarching Architecture](#overarching-architecture)
  - [Gameworld](#gameworld)
  - [Elements](#elements-1)
  - [Imagesets](#imagesets)
  - [Game Cartridges](#game-cartridges)
  - [Actions](#actions)
  - [Tooling](#tooling)

# Introduction

Some code to help me make an RPG like game in a phone app.  This project is built on top of the Flame Flutter Game engine.

## IMPORTANT
This project is still very much under development.  Documentation below is not yet fully completed!

# Getting Started

## Examples
You can run the examle game by changing main.dart to the following:

    import 'package:flutter/cupertino.dart';
    import 'package:flutter/material.dart';
    import 'package:kgress/example/world/example_game_world.dart';
    import 'package:kgress/game/world/container/cupertino_game_container_app.dart';
    
    //  Run the example game
    runApp(CupertinoGameContainerApp(ExampleGameWorld()));
    
## Game Tools
KGRESS comes with tooling to allow you to preview areas in your game.  You can switch to using these tools by
updating the main.dart to the following:

    import 'package:flutter/cupertino.dart';
    import 'package:flutter/material.dart';
    import 'package:kgress/game/tools/cupertino_game_tool.dart';
    
    //  Run the game editor tool
    GameCartridge exampleGame = GameCartridge(
      areas: List.from([
        exampleArea,
        mainArea,
        trainingArea
      ]),
      elementDrawerRepo: ExampleElementDrawerRepository()
    );
    runApp(CupertinoGameToolsApp(exampleGame));
    
## Elements
Elements are characters/things on the screen.  They are everything from NPCs to your character to tiles on the floor.

### Definining an Element Kind
Element kinds come in various flavours.  For example, this defines a floor tile:

```
ElementKind decorativeTile = StationaryObjectKind(name: "Fancy Floor Tile", stationaryImage: greenGrayTile);
```

#### Adding Images
In order to create an element kind you need to specify an _image set_ that will be used for rendering it.  The simplest kind of image set is the SingleImage.  In the case of defining a couple of tile images you would do this:


```
SingleImage greenTile = SingleImage("green_tile.png");
SingleImage greenGrayTile = SingleImage("green_gray_tile.png");
```

Keep in mind that you need to make sure all of your images are available in a folder called 'images' under the assets folder of your project.

##### Adding Animations for Movement
Images for a character that can walk around on the screen require specific image sets for each state the character can be in.

For example, to create the animations for a player character you might do the following:

```
class PlayerCharacterSets {
  static final SpriteSheetRowSequence imgSetGoingUp = SpriteSheetRowSequence.fromStart('player_character.png', 64.0, 64.0, 8, 9);
  static final SpriteSheetRowSequence imgSetGoingDown = SpriteSheetRowSequence.fromStart('player_character.png', 64.0, 64.0, 10, 9);
  static final SpriteSheetRowSequence imgSetGoingLeft = SpriteSheetRowSequence.fromStart('player_character.png', 64.0, 64.0, 9, 9);
  static final SpriteSheetRowSequence imgSetGoingRight = SpriteSheetRowSequence.fromStart('player_character.png', 64.0, 64.0, 11, 9);
  static final SpriteSheetRowSequence imgSetStationary = SpriteSheetRowSequence.fromStart('player_character.png', 64.0, 64.0, 1, 7);
}
```

Placing the image sets inside a class like this is not required though it does help to more cleanly organize your image sets.

To use the images in creating the player character you can define an element kind as follows:

```
ElementKind playerCharacter = StatefulObjectKind(elementTypes.playerCharacter, directional, statesToImageSets: {
  states.stationary: PlayerCharacterSets.imgSetStationary,
  states.movingUp: PlayerCharacterSets.imgSetGoingUp,
  states.movingDown: PlayerCharacterSets.imgSetGoingDown,
  states.movingLeft: PlayerCharacterSets.imgSetGoingLeft,
  states.movingRight: PlayerCharacterSets.imgSetGoingRight,
}, name: "Player Character");
```

### Adding an Element
You add an element to an area in the game by using its element kind:

```
  Area currentArea = Area(10, "Test Area");

  AreaForEdit editor = AreaForEdit(currentArea);
  editor.fill(floorTile, layer: 0);

  editor.add(decorativeTile, 0, 0);
```
The code above adds your new "decorative tile" to the top corner of the area.

### Adding movement and actions
You can specify some actions for an element you want to add to a scene by using a variation on the code for adding an element.

```
  Area currentArea = Area(10, "Test Area");

  AreaForEdit editor = AreaForEdit(currentArea);
  editor.add(nonPlayerCharacter, 10, 10, actionSetActions: backAndForthActions);
```

The code above adds an element of kind "nonPlayerCharacter" to the area and gives it actions to execute.

# Architecture
    
## Overarching Architecture
![](https://github.com/kevinvandenbreemen/kgress/blob/master/doc/KGRESS-Components.svg)

## Gameworld

![](https://github.com/kevinvandenbreemen/kgress/blob/master/doc/KGRESS-Code%20-%20Game%20and%20World.svg)

## Elements

Elements (things on the screen in an area of the game) have element kinds, which fall under over-arching element types.

![](https://github.com/kevinvandenbreemen/kgress/blob/master/doc/KGRESS-Code%20-%20Elements.svg)

## Imagesets
Imagesets provide canned frame sets for drawing elements on the screen.  Elements can thus be added to a scene without your needing to worry about how they will be rendered.

![](https://github.com/kevinvandenbreemen/kgress/blob/master/doc/KGRESS-Code%20-%20Imagesets.svg)

## Game Cartridges
Relationship between the Game Cartridge and Components in a Game

![](https://github.com/kevinvandenbreemen/kgress/blob/master/doc/KGRESS-Code%20-%20Game%20Cartridge.svg)

## Actions
![](https://github.com/kevinvandenbreemen/kgress/blob/master/doc/KGRESS-Code%20-%20Actions.svg)

## Tooling
![](https://github.com/kevinvandenbreemen/kgress/blob/master/doc/KGRESS-Code%20-%20Tools.svg)
