// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crop.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CropMobx on _CropMobx, Store {
  final _$imageAtom = Atom(name: '_CropMobx.image');

  @override
  File get image {
    _$imageAtom.reportRead();
    return super.image;
  }

  @override
  set image(File value) {
    _$imageAtom.reportWrite(value, super.image, () {
      super.image = value;
    });
  }

  final _$listImageFileAtom = Atom(name: '_CropMobx.listImageFile');

  @override
  List<File> get listImageFile {
    _$listImageFileAtom.reportRead();
    return super.listImageFile;
  }

  @override
  set listImageFile(List<File> value) {
    _$listImageFileAtom.reportWrite(value, super.listImageFile, () {
      super.listImageFile = value;
    });
  }

  final _$imageFileAtom = Atom(name: '_CropMobx.imageFile');

  @override
  File get imageFile {
    _$imageFileAtom.reportRead();
    return super.imageFile;
  }

  @override
  set imageFile(File value) {
    _$imageFileAtom.reportWrite(value, super.imageFile, () {
      super.imageFile = value;
    });
  }

  final _$sampleImageAtom = Atom(name: '_CropMobx.sampleImage');

  @override
  File get sampleImage {
    _$sampleImageAtom.reportRead();
    return super.sampleImage;
  }

  @override
  set sampleImage(File value) {
    _$sampleImageAtom.reportWrite(value, super.sampleImage, () {
      super.sampleImage = value;
    });
  }

  final _$lastCroppedAtom = Atom(name: '_CropMobx.lastCropped');

  @override
  File get lastCropped {
    _$lastCroppedAtom.reportRead();
    return super.lastCropped;
  }

  @override
  set lastCropped(File value) {
    _$lastCroppedAtom.reportWrite(value, super.lastCropped, () {
      super.lastCropped = value;
    });
  }

  final _$_selectImageAsyncAction = AsyncAction('_CropMobx._selectImage');

  @override
  Future<dynamic> _selectImage(String imageSource) {
    return _$_selectImageAsyncAction.run(() => super._selectImage(imageSource));
  }

  final _$cropImageAsyncAction = AsyncAction('_CropMobx.cropImage');

  @override
  Future<void> cropImage() {
    return _$cropImageAsyncAction.run(() => super.cropImage());
  }

  final _$_CropMobxActionController = ActionController(name: '_CropMobx');

  @override
  dynamic setImage(File value) {
    final _$actionInfo =
        _$_CropMobxActionController.startAction(name: '_CropMobx.setImage');
    try {
      return super.setImage(value);
    } finally {
      _$_CropMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSample(dynamic value) {
    final _$actionInfo =
        _$_CropMobxActionController.startAction(name: '_CropMobx.setSample');
    try {
      return super.setSample(value);
    } finally {
      _$_CropMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFile(dynamic value) {
    final _$actionInfo =
        _$_CropMobxActionController.startAction(name: '_CropMobx.setFile');
    try {
      return super.setFile(value);
    } finally {
      _$_CropMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setListImage(File value) {
    final _$actionInfo =
        _$_CropMobxActionController.startAction(name: '_CropMobx.setListImage');
    try {
      return super.setListImage(value);
    } finally {
      _$_CropMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLastCropped(dynamic value) {
    final _$actionInfo = _$_CropMobxActionController.startAction(
        name: '_CropMobx.setLastCropped');
    try {
      return super.setLastCropped(value);
    } finally {
      _$_CropMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic settingCamera() {
    final _$actionInfo = _$_CropMobxActionController.startAction(
        name: '_CropMobx.settingCamera');
    try {
      return super.settingCamera();
    } finally {
      _$_CropMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
image: ${image},
listImageFile: ${listImageFile},
imageFile: ${imageFile},
sampleImage: ${sampleImage},
lastCropped: ${lastCropped}
    ''';
  }
}
