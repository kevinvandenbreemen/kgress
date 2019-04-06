/// Static set of one or more images for drawing something on the screen
abstract class ImageSet  {

}

class SingleImage extends ImageSet {
  String _imagePath;
  String get imagePath => _imagePath;

  SingleImage(this._imagePath);

}