// pacotes nativos do flutter
import 'package:flutter/services.dart';

// import dos pacotes
import 'package:crop_your_image/crop_your_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

part 'crop.g.dart';

class CropMobx extends _CropMobx with _$CropMobx {}

abstract class _CropMobx with Store {

  final ImagePicker _picker = ImagePicker();

  @observable
  CropController cropController = CropController();

  @observable
  Uint8List? croppedData;

  @observable
  Uint8List? currentImage;

  @observable
  bool isLoading = false;

  @observable
  bool isCropImage = false;

  @action
  void setCroppedData( Uint8List? value ) => croppedData = value;

  @action
  void setCurrentImage( Uint8List? value ) => currentImage = value;

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

    setCroppedData(null);
    if ( image == null ) return;

    setCurrentImage(image);
    return setIsCropImage(true);
  }

  @action
  void cutImage() {
    setIsLoading(true);
    cropController.crop();
    // cropController.cropCircle();
    return;
  }

  @action
  void onCroppedImage( Uint8List croppedImage ) {
    setCroppedData(croppedImage);
    setCurrentImage(null);
    setIsLoading(false);
    return setIsCropImage(false);
  }

}