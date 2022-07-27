// imports nativos do flutter
import 'package:flutter/material.dart';
import 'dart:io';

// import dos sources
import 'package:meus_animais/data/sources/remote/services/services.dart';

// import da ui
import 'package:meus_animais/ui/styles/app_colors.dart';

// import dos pacotes
import 'package:image_picker/image_picker.dart';
import 'package:image_crop/image_crop.dart';
import 'package:mobx/mobx.dart';
part 'crop.g.dart';

class CropMobx extends _CropMobx with _$CropMobx {}

abstract class _CropMobx with Store {

  final cropKey = GlobalKey<CropState>();
  final _imagePicker = ImagePicker();

  @observable
  XFile? image;

  @observable
  List<XFile> listImageFile = [];

  @observable
  File? imageFile;

  @observable
  File? sampleImage;

  @observable
  File? lastCropped;

  @action
  setImage( XFile value ) => image = value;

  @action
  setSample( value ) {
    sampleImage = value;
  }

  @action
  setFile( value ) => imageFile = value;

  @action
  setListImage( XFile value ) => listImageFile = [value];

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
  Future _selectImage( String imageSource ) async {
    try {

      XFile? image;
      switch ( imageSource ) {
        case "camera": image = await _imagePicker.pickImage(source: ImageSource.camera);
        break;
        case "gallery": image = await _imagePicker.pickImage(source: ImageSource.gallery);
        break;
      }

      final file = File(image!.path);
      final sample = await ImageCrop.sampleImage(
        file: file,
        preferredSize: 2550,
        // preferredSize: context.size!.longestSide.ceil(),
      );

      sampleImage?.delete();
      imageFile?.delete();
      listImageFile.clear();
      setSample(sample);
      setFile(file);
      setListImage(image);

    } catch (e) {
      crash.log(e.toString());
    }
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
      preferredWidth: (1280).round(),
      preferredHeight: (620).round(),
    );

    final file = await ImageCrop.cropImage(
      file: sample,
      area: area,
    );

    sample.delete();

    lastCropped?.delete();
    setLastCropped(file);
    setImage(XFile(file.path));
  }
}