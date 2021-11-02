class LayoutHelper {
  double? width;
  double? height;
  double? fontSize;
  double? titleFontSize;

  static LayoutHelper? _instance;

  factory LayoutHelper({
    double? width,
    double? height,
    double? fontSize,
    double? titleFontSize,
  }) {
    _instance ??= LayoutHelper._internal(
      width,
      height,
      fontSize,
      titleFontSize,
    );

    return _instance ?? LayoutHelper();
  }

  LayoutHelper._internal(
    this.width,
    this.height,
    this.fontSize,
    this.titleFontSize,
  );

  static LayoutHelper? get instance {
    return _instance;
  }
}
