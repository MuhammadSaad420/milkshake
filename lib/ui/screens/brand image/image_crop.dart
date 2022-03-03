// import 'dart:typed_data';

// import 'package:extended_image/extended_image.dart';
// import 'package:flutter/material.dart';
// import 'package:milkshake_practise/ui/resources/color_manager.dart';
// import 'package:milkshake_practise/ui/widgets/text_widget.dart';

// class ImageCrop extends StatefulWidget {
//   final String imUrl;
//   const ImageCrop({Key? key, required this.imUrl}) : super(key: key);

//   @override
//   State<ImageCrop> createState() => _ImageCropState();
// }

// class _ImageCropState extends State<ImageCrop> {
//   final GlobalKey<ExtendedImageEditorState> editorKey =
//       GlobalKey<ExtendedImageEditorState>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.bgLightScaffold,
//       body: Container(
//         color: AppColors.black,
//         height: double.infinity,
//         width: double.infinity,
//         child: Stack(children: [
//           ExtendedImage.network(
//             widget.imUrl,
//             fit: BoxFit.contain,
//             onDoubleTap: (value) {},
//             mode: ExtendedImageMode.editor,
//             extendedImageEditorKey: editorKey,
//             initEditorConfigHandler: (state) {
//               return EditorConfig(
//                   maxScale: 8.0,
//                   cropRectPadding: EdgeInsets.all(20.0),
//                   hitTestSize: 20.0,
//                   cropAspectRatio: 1);
//             },
//           ),
//           Positioned(
//               bottom: 20,
//               left: 10,
//               child: const TextWidget(
//                   title: "Cancel", textColor: AppColors.black)),
//           GestureDetector(
//             onTap: () async {
//               Uint8List? fileData;

//       /// native library
     
//         fileData = await cropImageDataWithNativeLibrary(
//             state: editorKey.currentState!);
     
//         ///delay due to cropImageDataWithDartLibrary is time consuming on main thread
//         ///it will block showBusyingDialog
//         ///if you don't want to block ui, use compute/isolate,but it costs more time.
//         //await Future.delayed(Duration(milliseconds: 200));

//         ///if you don't want to block ui, use compute/isolate,but it costs more time.
       
      
//             },
//             child: Positioned(
//                 bottom: 20,
//                 right: 10,
//                 child: const TextWidget(
//                     title: "Choose", textColor: AppColors.black)),
//           ),
//         ]),
//       ),
//     );
//   }
//   Future<Uint8List?> cropImageDataWithNativeLibrary(
//       {required ExtendedImageEditorState state}) async {
//     print('native library start cropping');

//     final Rect? cropRect = state.getCropRect();
//     final EditActionDetails action = state.editAction!;

//     final int rotateAngle = action.rotateAngle.toInt();
//     final bool flipHorizontal = action.flipY;
//     final bool flipVertical = action.flipX;
//     final Uint8List img = state.rawImageData;

//     final ImageEditorOption option = ImageEditorOption();


//       option.addOption(ClipOption.fromRect(cropRect!));
   

    

//     final DateTime start = DateTime.now();
//     final Uint8List? result = await ImageEditor.editImage(
//       image: img,
//       imageEditorOption: option,
//     );

//     print('${DateTime.now().difference(start)} ：total time');
//     return result;
//   }
// }
