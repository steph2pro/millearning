/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/app-logo.svg
  String get appLogo => 'assets/images/app-logo.svg';

  /// File path: assets/images/apple-logo.svg
  String get appleLogo => 'assets/images/apple-logo.svg';

  /// File path: assets/images/art.png
  AssetGenImage get art => const AssetGenImage('assets/images/art.png');

  /// File path: assets/images/business.png
  AssetGenImage get business =>
      const AssetGenImage('assets/images/business.png');

  /// File path: assets/images/coding.png
  AssetGenImage get coding => const AssetGenImage('assets/images/coding.png');

  /// File path: assets/images/course1.png
  AssetGenImage get course1 => const AssetGenImage('assets/images/course1.png');

  /// File path: assets/images/course2.png
  AssetGenImage get course2 => const AssetGenImage('assets/images/course2.png');

  /// File path: assets/images/courseContinue.png
  AssetGenImage get courseContinue =>
      const AssetGenImage('assets/images/courseContinue.png');

  /// File path: assets/images/google-logo.svg
  String get googleLogo => 'assets/images/google-logo.svg';

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/marketing.png
  AssetGenImage get marketing =>
      const AssetGenImage('assets/images/marketing.png');

  /// File path: assets/images/onboarding1.png
  AssetGenImage get onboarding1Png =>
      const AssetGenImage('assets/images/onboarding1.png');

  /// File path: assets/images/onboarding1.svg
  String get onboarding1Svg => 'assets/images/onboarding1.svg';

  /// File path: assets/images/onboarding2.png
  AssetGenImage get onboarding2Png =>
      const AssetGenImage('assets/images/onboarding2.png');

  /// File path: assets/images/onboarding2.svg
  String get onboarding2Svg => 'assets/images/onboarding2.svg';

  /// File path: assets/images/onboarding3.png
  AssetGenImage get onboarding3Png =>
      const AssetGenImage('assets/images/onboarding3.png');

  /// File path: assets/images/onboarding3.svg
  String get onboarding3Svg => 'assets/images/onboarding3.svg';

  /// File path: assets/images/profile.png
  AssetGenImage get profile => const AssetGenImage('assets/images/profile.png');

  /// File path: assets/images/profile1.png
  AssetGenImage get profile1 =>
      const AssetGenImage('assets/images/profile1.png');

  /// File path: assets/images/profile2.png
  AssetGenImage get profile2 =>
      const AssetGenImage('assets/images/profile2.png');

  /// File path: assets/images/profile3.png
  AssetGenImage get profile3 =>
      const AssetGenImage('assets/images/profile3.png');

  /// File path: assets/images/profile4.png
  AssetGenImage get profile4 =>
      const AssetGenImage('assets/images/profile4.png');

  /// File path: assets/images/welcome.png
  AssetGenImage get welcomePng =>
      const AssetGenImage('assets/images/welcome.png');

  /// File path: assets/images/welcome.svg
  String get welcomeSvg => 'assets/images/welcome.svg';

  /// List of all assets
  List<dynamic> get values => [
        appLogo,
        appleLogo,
        art,
        business,
        coding,
        course1,
        course2,
        courseContinue,
        googleLogo,
        logo,
        marketing,
        onboarding1Png,
        onboarding1Svg,
        onboarding2Png,
        onboarding2Svg,
        onboarding3Png,
        onboarding3Svg,
        profile,
        profile1,
        profile2,
        profile3,
        profile4,
        welcomePng,
        welcomeSvg
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
