- [Introduction](#introduction)
  - [IMPORTANT](#important)
- [Getting Started](#getting-started)
  - [Examples](#examples)
  - [Game Tools](#game-tools)
  - [Elements](#elements)
    - [Definining an Element Kind](#definining-an-element-kind)
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
    import 'package:kevin_gamify/example/world/example_game_world.dart';
    import 'package:kevin_gamify/game/world/container/cupertino_game_container_app.dart';
    
    //  Run the example game
    runApp(CupertinoGameContainerApp(ExampleGameWorld()));
    
## Game Tools
KGRESS comes with tooling to allow you to preview areas in your game.  You can switch to using these tools by
updating the main.dart to the following:

    import 'package:flutter/cupertino.dart';
    import 'package:flutter/material.dart';
    import 'package:kevin_gamify/game/tools/cupertino_game_tool.dart';
    
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
