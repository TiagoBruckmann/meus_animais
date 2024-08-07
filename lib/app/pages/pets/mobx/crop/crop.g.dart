// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crop.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CropMobx on _CropMobx, Store {
  late final _$cropControllerAtom =
      Atom(name: '_CropMobx.cropController', context: context);

  @override
  CropController get cropController {
    _$cropControllerAtom.reportRead();
    return super.cropController;
  }

  @override
  set cropController(CropController value) {
    _$cropControllerAtom.reportWrite(value, super.cropController, () {
      super.cropController = value;
    });
  }

  late final _$croppedDataAtom =
      Atom(name: '_CropMobx.croppedData', context: context);

  @override
  Uint8List? get croppedData {
    _$croppedDataAtom.reportRead();
    return super.croppedData;
  }

  @override
  set croppedData(Uint8List? value) {
    _$croppedDataAtom.reportWrite(value, super.croppedData, () {
      super.croppedData = value;
    });
  }

  late final _$currentImageAtom =
      Atom(name: '_CropMobx.currentImage', context: context);

  @override
  Uint8List? get currentImage {
    _$currentImageAtom.reportRead();
    return super.currentImage;
  }

  @override
  set currentImage(Uint8List? value) {
    _$currentImageAtom.reportWrite(value, super.currentImage, () {
      super.currentImage = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_CropMobx.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isCropImageAtom =
      Atom(name: '_CropMobx.isCropImage', context: context);

  @override
  bool get isCropImage {
    _$isCropImageAtom.reportRead();
    return super.isCropImage;
  }

  @override
  set isCropImage(bool value) {
    _$isCropImageAtom.reportWrite(value, super.isCropImage, () {
      super.isCropImage = value;
    });
  }

  late final _$chooseTypePictureAsyncAction =
      AsyncAction('_CropMobx.chooseTypePicture', context: context);

  @override
  Future<void> chooseTypePicture(String typeSelected) {
    return _$chooseTypePictureAsyncAction
        .run(() => super.chooseTypePicture(typeSelected));
  }

  late final _$_CropMobxActionController =
      ActionController(name: '_CropMobx', context: context);

  @override
  void setCroppedData(Uint8List? value) {
    final _$actionInfo = _$_CropMobxActionController.startAction(
        name: '_CropMobx.setCroppedData');
    try {
      return super.setCroppedData(value);
    } finally {
      _$_CropMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrentImage(Uint8List? value) {
    final _$actionInfo = _$_CropMobxActionController.startAction(
        name: '_CropMobx.setCurrentImage');
    try {
      return super.setCurrentImage(value);
    } finally {
      _$_CropMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsLoading(bool value) {
    final _$actionInfo =
        _$_CropMobxActionController.startAction(name: '_CropMobx.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$_CropMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsCropImage(bool value) {
    final _$actionInfo = _$_CropMobxActionController.startAction(
        name: '_CropMobx.setIsCropImage');
    try {
      return super.setIsCropImage(value);
    } finally {
      _$_CropMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _setCurrentImage(Uint8List? image) {
    final _$actionInfo = _$_CropMobxActionController.startAction(
        name: '_CropMobx._setCurrentImage');
    try {
      return super._setCurrentImage(image);
    } finally {
      _$_CropMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void cutImage() {
    final _$actionInfo =
        _$_CropMobxActionController.startAction(name: '_CropMobx.cutImage');
    try {
      return super.cutImage();
    } finally {
      _$_CropMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onCroppedImage(Uint8List croppedImage) {
    final _$actionInfo = _$_CropMobxActionController.startAction(
        name: '_CropMobx.onCroppedImage');
    try {
      return super.onCroppedImage(croppedImage);
    } finally {
      _$_CropMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cropController: ${cropController},
croppedData: ${croppedData},
currentImage: ${currentImage},
isLoading: ${isLoading},
isCropImage: ${isCropImage}
    ''';
  }
}
