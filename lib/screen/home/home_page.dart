
import 'package:bliu/screen/home/component/home_body_ai.dart';
import 'package:bliu/screen/home/component/home_body_best_seles.dart';
import 'package:bliu/screen/home/component/home_body_category.dart';
import 'package:bliu/screen/home/component/home_body_exhibition.dart';
import 'package:bliu/screen/home/component/home_footer.dart';
import 'package:bliu/screen/home/component/home_header.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          HomeHeader(),
          HomeBodyCategory(),
          HomeBodyAi(),
          HomeBodyExhibition(),
          HomeBodyBestSeles(),
          HomeFooter(),
        ],
      ),
    );
  }
}

  // Future<void> _pickImage() async {
  //   var imagePicker = ImagePicker();
  //   var image = await imagePicker.pickImage(source: ImageSource.gallery);
  //   if (image != null) {
  //     _cropImage(image);
  //   }
  // }
  //
  // Future<void> _cropImage(XFile image) async {
  //   CroppedFile? croppedFile = await ImageCropper().cropImage(
  //     sourcePath: image.path,
  //     uiSettings: [
  //       AndroidUiSettings(
  //           toolbarTitle: '이미지 자르기',
  //           toolbarColor: Colors.white,
  //           toolbarWidgetColor: Colors.black,
  //           initAspectRatio: CropAspectRatioPreset.original,
  //           hideBottomControls: true,
  //           lockAspectRatio: false),
  //       IOSUiSettings(
  //           title: '이미지 자르기',
  //           hidesNavigationBar: true,
  //           aspectRatioPickerButtonHidden: true,
  //           rotateClockwiseButtonHidden: true,
  //           rotateButtonsHidden: true
  //       ),
  //     ],
  //   );
  //   // Do something with the cropped file
  // }


