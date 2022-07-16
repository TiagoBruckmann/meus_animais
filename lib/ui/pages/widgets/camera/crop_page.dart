// pacotes nativos flutter
import 'package:flutter/material.dart';

// import dos sources
import 'package:meus_animais/data/sources/remote/services/services.dart';

// import dos pacotes
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:image_crop/image_crop.dart';

// gerencia de estado
import 'package:meus_animais/data/sources/local/mobx/crop/crop.dart';

class CropPage extends StatefulWidget {

  final CropMobx cropMobx;
  const CropPage({ Key? key, required this.cropMobx }) : super(key: key);

  @override
  State<CropPage> createState() => _CropPageState();
}

class _CropPageState extends State<CropPage> {

  @override
  void initState() {
    super.initState();
    Services().sendScreen("Crop-page");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Crop.file(
            widget.cropMobx.sampleImage!,
            key: widget.cropMobx.cropKey,
            aspectRatio: 20.0 / 10.0,
          ),
        ),
        Container(
          color: Theme.of(context).primaryColor,
          // padding: const EdgeInsets.only(top: 20.0),
          alignment: AlignmentDirectional.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              TextButton(
                child: Text(
                  FlutterI18n.translate(context, "widgets.crop.new"),
                  style: Theme.of(context).textTheme.button!.copyWith(color: Colors.white),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar( widget.cropMobx.settingCamera() );
                },
              ),

              TextButton(
                child: Text(
                  FlutterI18n.translate(context, "widgets.crop.save"),
                  style: Theme.of(context).textTheme.button!.copyWith(color: Colors.white),
                ),
                onPressed: () {
                  widget.cropMobx.cropImage();
                  widget.cropMobx.setSample(null);
                },
              ),

            ],
          ),
        ),
      ],
    );
  }
}