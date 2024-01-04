import 'package:devhub_kenya/common/widgets/brands/brand_showcase.dart';
import 'package:devhub_kenya/features/shop/controllers/product/brands_controller.dart';
import 'package:devhub_kenya/features/shop/models/category_model.dart';
import 'package:devhub_kenya/utils/constants/image_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return const DBrandShowCase(images: [DImages.hpColorLaserjet, DImages.hpMf27,DImages.canonG3420]);
  }
}