/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/ic_add_user.svg
  SvgGenImage get icAddUser =>
      const SvgGenImage('assets/icons/ic_add_user.svg');

  /// File path: assets/icons/ic_arrow_left.svg
  SvgGenImage get icArrowLeft =>
      const SvgGenImage('assets/icons/ic_arrow_left.svg');

  /// File path: assets/icons/ic_arrow_right.svg
  SvgGenImage get icArrowRight =>
      const SvgGenImage('assets/icons/ic_arrow_right.svg');

  /// File path: assets/icons/ic_articles.svg
  SvgGenImage get icArticles =>
      const SvgGenImage('assets/icons/ic_articles.svg');

  /// File path: assets/icons/ic_hide.svg
  SvgGenImage get icHide => const SvgGenImage('assets/icons/ic_hide.svg');

  /// File path: assets/icons/ic_image.svg
  SvgGenImage get icImage => const SvgGenImage('assets/icons/ic_image.svg');

  /// File path: assets/icons/ic_not_ok.svg
  SvgGenImage get icNotOk => const SvgGenImage('assets/icons/ic_not_ok.svg');

  /// File path: assets/icons/ic_notifications.svg
  SvgGenImage get icNotifications =>
      const SvgGenImage('assets/icons/ic_notifications.svg');

  /// File path: assets/icons/ic_ok.svg
  SvgGenImage get icOk => const SvgGenImage('assets/icons/ic_ok.svg');

  /// File path: assets/icons/ic_person.svg
  SvgGenImage get icPerson => const SvgGenImage('assets/icons/ic_person.svg');

  /// File path: assets/icons/ic_show.svg
  SvgGenImage get icShow => const SvgGenImage('assets/icons/ic_show.svg');

  /// File path: assets/icons/ic_star.svg
  SvgGenImage get icStar => const SvgGenImage('assets/icons/ic_star.svg');

  /// File path: assets/icons/ic_three_dots.svg
  SvgGenImage get icThreeDots =>
      const SvgGenImage('assets/icons/ic_three_dots.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        icAddUser,
        icArrowLeft,
        icArrowRight,
        icArticles,
        icHide,
        icImage,
        icNotOk,
        icNotifications,
        icOk,
        icPerson,
        icShow,
        icStar,
        icThreeDots
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/img_start_page.png
  AssetGenImage get imgStartPage =>
      const AssetGenImage('assets/images/img_start_page.png');

  /// File path: assets/images/img_svg.svg
  SvgGenImage get imgSvg => const SvgGenImage('assets/images/img_svg.svg');

  /// List of all assets
  List<dynamic> get values => [imgStartPage, imgSvg];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
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
    bool gaplessPlayback = false,
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

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final BytesLoader loader;
    if (_isVecFormat) {
      loader = AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
