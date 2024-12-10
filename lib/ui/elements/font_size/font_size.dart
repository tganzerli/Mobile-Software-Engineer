class SyntraFontSize {
  final double mobileWidth;

  SyntraFontSize(this.mobileWidth);

  double size(double size) {
    switch (size) {
      case 56:
        return mobileWidth * 0.127;
      case 42:
        return mobileWidth * 0.098;
      case 36:
        return mobileWidth * 0.084;
      case 32:
        return mobileWidth * 0.075;
      case 28:
        return mobileWidth * 0.065;
      case 24:
        return mobileWidth * 0.056;
      case 21:
        return mobileWidth * 0.049;
      case 16:
        return mobileWidth * 0.036;
      case 14:
        return mobileWidth * 0.032;
      case 12:
        return mobileWidth * 0.026;
      case 10:
        return mobileWidth * 0.021;
      default:
        return mobileWidth * ((0.0024 * size) - 0.0022);
    }
  }
}
