// pacotes nativos do flutter
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// imports globais
import 'package:meus_animais/session.dart';

// import dos pacotes
import 'package:crop_your_image/crop_your_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

part 'crop.g.dart';

class CropMobx extends _CropMobx with _$CropMobx {}

abstract class _CropMobx with Store {

  final _currentContext = Session.globalContext.currentContext!;

  final ImagePicker _picker = ImagePicker();

  @observable
  CropController cropController = CropController();

  @observable
  Uint8List? croppedData;

  @observable
  Uint8List? currentImage;

  @observable
  String statusText = "";

  @observable
  bool isLoading = false;

  @observable
  bool isCropImage = false;

  @action
  void setCroppedData( Uint8List? value ) => croppedData = value;

  @action
  void setCurrentImage( Uint8List? value ) => currentImage = value;

  @action
  void setStatusText( String value ) => statusText = value;

  @action
  void setIsLoading( bool value ) => isLoading = value;

  @action
  void setIsCropImage( bool value ) => isCropImage = value;

  @action
  Future<void> chooseTypePicture( String typeSelected ) async {

    ImageSource typeFunction = ImageSource.camera;
    if ( typeSelected == "gallery" ) {
      typeFunction = ImageSource.gallery;
    }

    final XFile? image = await _picker.pickImage(source: typeFunction);
    return _setCurrentImage(await image?.readAsBytes());
  }

  @action
  void _setCurrentImage( Uint8List? image ) {

    if ( image == null ) {
      return goToPop();
    }

    setCurrentImage(image);
    return setIsCropImage(true);
  }

  @action
  void cutImage() {
    setIsLoading(true);
    cropController.cropCircle();
    return;
  }

  @action
  void onCroppedImage( Uint8List croppedImage ) {
    setCroppedData(croppedImage);
    return goToPop(value: croppedImage);
  }

  @action
  void goToPop({ dynamic value }) => Navigator.pop(_currentContext, value);

}