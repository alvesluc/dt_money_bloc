class ScreenSize {
  const ScreenSize(this.name, this.width, this.height, this.pixelDensity);
  final String name;
  final double width, height, pixelDensity;
}

const iPhone8 = ScreenSize('iPhone_8', 414, 736, 3);
const iPhone13ProMax = ScreenSize('iPhone_13_Pro_Max', 414, 896, 3);
const tablet = ScreenSize('Tablet', 1280, 720, 1);
const desktop = ScreenSize('Desktop', 1920, 1080, 1);
