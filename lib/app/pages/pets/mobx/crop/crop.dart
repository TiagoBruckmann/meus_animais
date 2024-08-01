// pacotes nativos do flutter
import 'package:flutter/material.dart';
import 'dart:io';

// imports globais
import 'package:meus_animais/session.dart';

// import das telas
import 'package:meus_animais/app/core/style/app_colors.dart';

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
  void setImage( XFile value ) => image = value;

  @action
  void setSampleImage( File? value ) => sampleImage = value;

  @action
  void setFile( File value ) => imageFile = value;

  @action
  void setListImage( XFile value ) => listImageFile = [value];

  @action
  void setLastCropped( File value ) => lastCropped = value;

  @action
  Widget settingCamera( String prefEvent ) {
    Session.appEvents.sharedEvent("${prefEvent}_settings_camera");

    final bottomSheet = BottomSheet(
      backgroundColor: AppColors.barossa,
      elevation: 5,
      onClosing: () {
        print("onClosing bottom Sheet => ");
      },
      builder: ( builder ) {

        return ListTile(
          title: TextButton(
            child: const Text("Camera"),
            onPressed: () => _selectImage("camera"),
          ),
          subtitle: TextButton(
            child: const Text("Galeria"),
            onPressed: () => _selectImage("gallery"),
          ),
        );

      },
    );

    return bottomSheet;
  }

  @action
  Future<void> _selectImage( String imageSource ) async {
    Session.appEvents.logCameraOption(imageSource);

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
      setSampleImage(sample);
      setFile(file);
      setListImage(image);

      return;

    } catch (e) {
      Session.crash.onError("select_image_error", error: e);
      throw Exception("select_image_error => ${e.toString()}");
    }
  }

  @action
  Future<void> cropImage() async {
    Session.appEvents.sharedEvent("crop_image_save_image");

    final area = cropKey.currentState!.area;

    if ( area == null ) {
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
    setSampleImage(null);
  }

}