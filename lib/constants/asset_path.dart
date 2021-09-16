final String imageAssetsRoot = "images/";

final String fox = _getImagePath("fox.png");

String _getImagePath(String fileName) {
  return imageAssetsRoot + fileName;
}
