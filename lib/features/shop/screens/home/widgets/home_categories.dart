
import 'package:flutter/material.dart';

import '../../../../../common/widgets/image_text_widgets/vertical_iamge_text.dart';
import '../../../../../utils/constants/image_strings.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        // => cho phep ds co lai cho phu hop voi widget cha
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return TVerticalImageText(
            image: TImages.shoeIcon,
            title: 'Shoe',
            onTap: () {},
          );
        },
      ),
    );
  }
}