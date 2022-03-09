import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:milkshake_practise/ui/resources/color_manager.dart';
import 'package:milkshake_practise/ui/resources/values_manager.dart';
import 'package:milkshake_practise/ui/screens/brand%20image/image_crop.dart';
import 'package:milkshake_practise/ui/widgets/app_bar.dart';
import '../../../business_logic/model/unsplash.dart';
import '../../../provider/unsplash_image_provider.dart';

class UnsplashLibrary extends StatefulWidget {
  const UnsplashLibrary({Key? key}) : super(key: key);

  @override
  State<UnsplashLibrary> createState() => _UnsplashLibraryState();
}

class _UnsplashLibraryState extends State<UnsplashLibrary> {
  int page = 0, totalPages = -1;
  List<UnsplashImage> images = [];
  bool loadingImages = false;
  String? keyword;
  @override
  void initState() {
    _loadImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const AppBarWidget(
              appBarType: AppBarType.DOUBLE,
              backTitle: "Cancel",
              mainTitle: "Unsplash",
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 5, 16, 22),
              child: CupertinoSearchTextField(
                backgroundColor: AppColors.grey1,
                onSubmitted: (value) {
                  _loadImages(keyword: value);
                },
                onSuffixTap: () {
                  _loadImages();
                },
              ),
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2),
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        //Navigator.pop(context,images[index].getRegularUrl());
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ImageCrop(
                                    imUrl: images[index].getRegularUrl())));
                      },
                      child: Container(
                        height: AppSize.s126,
                        width: AppSize.s126,
                        color: AppColors.black,
                        child: Image.network(
                          images[index].getRegularUrl(),
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _loadImages({String? keyword}) async {
    if (loadingImages) {
      return;
    }
    if (totalPages != -1 && page >= totalPages) {
      return;
    }
    await Future.delayed(const Duration(microseconds: 1));
    setState(() {
      loadingImages = true;
      if (this.keyword != keyword) {
        this.images = [];
        this.page = 0;
      }
      this.keyword = keyword;
    });

    List<UnsplashImage> images;
    if (keyword == null) {
      images = await UnsplashImageProvider.loadImages(page: ++page);
    } else {
      List res = await UnsplashImageProvider.loadImagesWithKeyword(keyword,
          page: ++page);
      totalPages = res[0];
      images = res[1];
    }

    setState(() {
      loadingImages = false;
      this.images.addAll(images);
    });
  }
}
