/// Static set of one or more images for drawing something on the screen
abstract class ImageSet  {

}

/// Single image (for example, a floor tile, a desk, etc)
class SingleImage extends ImageSet {
  String _imagePath;
  String get imagePath => _imagePath;

  SingleImage(this._imagePath);

}

/// A collection of images from a row on a sprite sheet for use in building an animations
class SpriteSheetRowSequence extends ImageSet {

  /*
      return Animation.sequenced(imagePath,
        numFrames,
        textureHeight: height,
        textureWidth: width,
        textureX: 0.0,
        textureY: sheetRow * height
    );
   */
  final String imagePath;
  final double textureHeight;
  final double textureWidth;
  final double textureX;
  final int sheetRow;
  final int numFrames;

  SpriteSheetRowSequence(this.imagePath, this.textureHeight, this.textureWidth,
      this.textureX, this.sheetRow, this.numFrames);

  SpriteSheetRowSequence.fromStart(this.imagePath, this.textureHeight, this.textureWidth,
      this.sheetRow, this.numFrames, {this.textureX = 0});

}