abstract final class Images {
  static String asPng(String path) => 'assets/images/$path.png';
  static String asJpg(String path) => 'assets/images/$path.jpg';
  static String asJpeg(String path) => 'assets/images/$path.jpeg';
}

abstract final class CustomIcons {
  static String asPng(String path) => 'assets/icons/$path.png';
  static String asJpg(String path) => 'assets/icons/$path.jpg';
  static String asJpeg(String path) => 'assets/icons/$path.jpeg';
}
