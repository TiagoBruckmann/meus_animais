// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crop.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CropMobx on _CropMobx, Store {
  late final _$imageAtom = Atom(name: '_CropMobx.image', context: context);

  @override
  XFile? get image {
    _$imageAtom.reportRead();
    return super.image;
  }

  @override
  set image(XFile? value) {
    _$imageAtom.reportWrite(value, super.image, () {
      super.image = value;
    });
  }

  late final _$listImageFileAtom =
      Atom(name: '_CropMobx.listImageFile', context: context);

  @override
  List<XFile> get listImageFile {
    _$listImageFileAtom.reportRead();
    return super.listImageFile;
  }

  @override
  set listImageFile(List<XFile> value) {
    _$listImageFileAtom.reportWrite(value, super.listImageFile, () {
      super.listImageFile = value;
    });
  }

  late final _$imageFileAtom =
      Atom(name: '_CropMobx.imageFile', context: context);

  @override
  File? get imageFile {
    _$imageFileAtom.reportRead();
    return super.imageFile;
  }

  @override
  set imageFile(File? value) {
    _$imageFileAtom.reportWrite(value, super.imageFile, () {
      super.imageFile = value;
    });
  }

  late final _$sampleImageAtom =
      Atom(name: '_CropMobx.sampleImage', context: context);

  @override
  File? get sampleImage {
    _$sampleImageAtom.reportRead();
    return super.sampleImage;
  }

  @override
  set sampleImage(File? value) {
    _$sampleImageAtom.reportWrite(value, super.sampleImage, () {
      super.sampleImage = value;
    });
  }

  late final _$lastCroppedAtom =
      Atom(name: '_CropMobx.lastCropped', context: context);

  @override
  File? get lastCropped {
    _$lastCroppedAtom.reportRead();
    return super.lastCropped;
  }

  @override
  set lastCropped(File? value) {
    _$lastCroppedAtom.reportWrite(value, super.lastCropped, () {
      super.lastCropped = value;
    });
  }

  late final _$_selectImageAsyncAction =
      AsyncAction('_CropMobx._selectImage', context: context);

  @override
  Future<dynamic> _selectImage(String imageSource) {
    return _$_selectImageAsyncAction.run(() => super._selectImage(imageSource));
  }

  late final _$cropImageAsyncAction =
      AsyncAction('_CropMobx.cropImage', context: context);

  @override
  Future<void> cropImage() {
    return _$cropImageAsyncAction.run(() => super.cropImage());
  }

  late final _$_CropMobxActionController =
      ActionController(name: '_CropMobx', context: context);

  @override
  dynamic setImage(XFile value) {
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
  dynamic setListImage(XFile value) {
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
  dynamic settingCamera(String prefEvent) {
    final _$actionInfo = _$_CropMobxActionController.startAction(
        name: '_CropMobx.settingCamera');
    try {
      return super.settingCamera(prefEvent);
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
