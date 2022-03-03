import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import '../../services/service_locator.dart';

class BrandImageScreenViewModel extends ChangeNotifier {
  File? _imageFile;
  File? get imageFile => _imageFile;
  void pickImageFromCamera() async {
    XFile? _file = await serviceLocator<ImagePicker>()
        .pickImage(source: ImageSource.camera);
    _imageFile = File(_file!.path);
    notifyListeners();
  }

  void pickImageFromGallery() async {
    XFile? _file = await serviceLocator<ImagePicker>()
        .pickImage(source: ImageSource.gallery);
    _imageFile = File(_file!.path);
    notifyListeners();
  }
}
