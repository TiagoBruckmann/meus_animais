// imports nativos do flutter
import 'package:flutter/material.dart';
import 'dart:io';

// import dos pacotes
import 'package:image_picker/image_picker.dart';
import 'package:image_crop/image_crop.dart';
import 'package:meus_animais/ui/styles/app_colors.dart';
import 'package:mobx/mobx.dart';
part 'crop.g.dart';

class CropMobx extends _CropMobx with _$CropMobx {}

abstract class _CropMobx with Store {

  final cropKey = GlobalKey<CropState>();
  final _imagePicker = ImagePicker();

  @observable
  File? image;

  @observable
  File? imageFile;

  @observable
  File? sampleImage;

  @observable
  File? lastCropped;

  @action
  setImage( value ) => image = value;

  @action
  setSample( value ) {
    sampleImage = value;
  }

  @action
  setFile( value ) => imageFile = value;

  @action
  setLastCropped( value ) => lastCropped = value;

  @action
  settingCamera() {
    final snackBar = SnackBar(
      backgroundColor: AppColors.barossa,
      content: ListTile(
        title: TextButton(
          child: const Text("Camera"),
          onPressed: () {
            _selectImage("camera");
          },
        ),
        subtitle: TextButton(
          child: const Text("Galeria"),
          onPressed: () {
            _selectImage("gallery");
          },
        ),
      ),
    );

    return snackBar;
  }

  @action
  Future _selectImage( String originImage ) async {
    XFile? imageSelected;
    switch( originImage ) {
      case "camera" :
        imageSelected = (await _imagePicker.pickImage(source: ImageSource.camera));
        break;
      case "gallery" :
        imageSelected = (await _imagePicker.pickImage(source: ImageSource.gallery));
        break;
    }

    final file = File(imageSelected!.path);
    final sample = await ImageCrop.sampleImage(
      file: file,
      preferredSize: 1550,
      // preferredSize: context.size!.longestSide.ceil(),
    );

    sampleImage?.delete();
    imageFile?.delete();
    setSample(sample);
    setFile(file);
  }

  @action
  Future<void> cropImage() async {
    final area = cropKey.currentState!.area;

    if (area == null) {
      // cannot crop, widget is not setup
      return;
    }

    // scale up to use maximum possible number of pixels
    // this will sample image in higher resolution to make cropped image larger
    final sample = await ImageCrop.sampleImage(
      file: imageFile!,
      preferredWidth: (1000).round(),
      preferredHeight: (480).round(),
    );

    final file = await ImageCrop.cropImage(
      file: sample,
      area: area,
    );

    sample.delete();

    lastCropped?.delete();
    setLastCropped(file);
    setImage(file);
  }
}