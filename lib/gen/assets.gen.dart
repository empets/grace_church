// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsIconLauncherGen {
  const $AssetsIconLauncherGen();

  /// File path: assets/icon_launcher/icon.png
  AssetGenImage get icon =>
      const AssetGenImage('assets/icon_launcher/icon.png');

  /// List of all assets
  List<AssetGenImage> get values => [icon];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/03.jpg
  AssetGenImage get a03 => const AssetGenImage('assets/images/03.jpg');

  /// File path: assets/images/04.jpg
  AssetGenImage get a04 => const AssetGenImage('assets/images/04.jpg');

  /// File path: assets/images/Frame 2087324050.svg
  SvgGenImage get frame2087324050 =>
      const SvgGenImage('assets/images/Frame 2087324050.svg');

  /// File path: assets/images/Frame 2087324052.svg
  SvgGenImage get frame2087324052 =>
      const SvgGenImage('assets/images/Frame 2087324052.svg');

  /// File path: assets/images/Globe.svg
  SvgGenImage get globe => const SvgGenImage('assets/images/Globe.svg');

  /// File path: assets/images/arrow_back.svg
  SvgGenImage get arrowBack =>
      const SvgGenImage('assets/images/arrow_back.svg');

  /// File path: assets/images/atom_primaryicon_phone_outlined.svg
  SvgGenImage get atomPrimaryiconPhoneOutlined =>
      const SvgGenImage('assets/images/atom_primaryicon_phone_outlined.svg');

  /// File path: assets/images/box_up_image.png
  AssetGenImage get boxUpImage =>
      const AssetGenImage('assets/images/box_up_image.png');

  /// File path: assets/images/check_reclamation.svg
  SvgGenImage get checkReclamation =>
      const SvgGenImage('assets/images/check_reclamation.svg');

  /// File path: assets/images/diagnostic_successer.svg
  SvgGenImage get diagnosticSuccesser =>
      const SvgGenImage('assets/images/diagnostic_successer.svg');

  /// File path: assets/images/empty_paper.svg
  SvgGenImage get emptyPaper =>
      const SvgGenImage('assets/images/empty_paper.svg');

  /// File path: assets/images/icon_box_loading.svg
  SvgGenImage get iconBoxLoading =>
      const SvgGenImage('assets/images/icon_box_loading.svg');

  /// File path: assets/images/icon_change_box.svg
  SvgGenImage get iconChangeBox =>
      const SvgGenImage('assets/images/icon_change_box.svg');

  /// File path: assets/images/image.png
  AssetGenImage get image => const AssetGenImage('assets/images/image.png');

  /// File path: assets/images/o1.jpg
  AssetGenImage get o1 => const AssetGenImage('assets/images/o1.jpg');

  /// File path: assets/images/o2.jpg
  AssetGenImage get o2 => const AssetGenImage('assets/images/o2.jpg');

  /// File path: assets/images/oo.png
  AssetGenImage get oo => const AssetGenImage('assets/images/oo.png');

  /// File path: assets/images/pic.png
  AssetGenImage get pic => const AssetGenImage('assets/images/pic.png');

  /// File path: assets/images/probleme_request.svg
  SvgGenImage get problemeRequest =>
      const SvgGenImage('assets/images/probleme_request.svg');

  /// File path: assets/images/rapport_empty.svg
  SvgGenImage get rapportEmpty =>
      const SvgGenImage('assets/images/rapport_empty.svg');

  /// File path: assets/images/scan_box.png
  AssetGenImage get scanBox =>
      const AssetGenImage('assets/images/scan_box.png');

  /// File path: assets/images/wait_reclamation.svg
  SvgGenImage get waitReclamation =>
      const SvgGenImage('assets/images/wait_reclamation.svg');

  /// File path: assets/images/wifi_check.svg
  SvgGenImage get wifiCheck =>
      const SvgGenImage('assets/images/wifi_check.svg');

  /// List of all assets
  List<dynamic> get values => [
    a03,
    a04,
    frame2087324050,
    frame2087324052,
    globe,
    arrowBack,
    atomPrimaryiconPhoneOutlined,
    boxUpImage,
    checkReclamation,
    diagnosticSuccesser,
    emptyPaper,
    iconBoxLoading,
    iconChangeBox,
    image,
    o1,
    o2,
    oo,
    pic,
    problemeRequest,
    rapportEmpty,
    scanBox,
    waitReclamation,
    wifiCheck,
  ];
}

class $AssetsPdfFilesGen {
  const $AssetsPdfFilesGen();

  /// File path: assets/pdf_files/politique_securite_complete_application_mobile.pdf
  String get politiqueSecuriteCompleteApplicationMobile =>
      'packages/grace_church/assets/pdf_files/politique_securite_complete_application_mobile.pdf';

  /// List of all assets
  List<String> get values => [politiqueSecuriteCompleteApplicationMobile];
}

class $AssetsRapportTemplateGen {
  const $AssetsRapportTemplateGen();

  /// File path: assets/rapport_template/empty_paper.svg
  SvgGenImage get emptyPaper =>
      const SvgGenImage('assets/rapport_template/empty_paper.svg');

  /// File path: assets/rapport_template/rapport_.docx
  String get rapport =>
      'packages/grace_church/assets/rapport_template/rapport_.docx';

  /// File path: assets/rapport_template/rapport_em.docx
  String get rapportEm =>
      'packages/grace_church/assets/rapport_template/rapport_em.docx';

  /// List of all assets
  List<dynamic> get values => [emptyPaper, rapport, rapportEm];
}

class assets {
  const assets._();

  static const String package = 'grace_church';

  static const $AssetsIconLauncherGen iconLauncher = $AssetsIconLauncherGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsPdfFilesGen pdfFiles = $AssetsPdfFilesGen();
  static const $AssetsRapportTemplateGen rapportTemplate =
      $AssetsRapportTemplateGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  static const String package = 'grace_church';

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

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
    @Deprecated('Do not specify package for a generated library asset')
    String? package = package,
    FilterQuality filterQuality = FilterQuality.medium,
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
    @Deprecated('Do not specify package for a generated library asset')
    String? package = package,
  }) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => 'packages/grace_church/$_assetName';
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  static const String package = 'grace_church';

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    @Deprecated('Do not specify package for a generated library asset')
    String? package = package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    _svg.ColorMapper? colorMapper,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
        colorMapper: colorMapper,
      );
    }
    return _svg.SvgPicture(
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
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => 'packages/grace_church/$_assetName';
}
