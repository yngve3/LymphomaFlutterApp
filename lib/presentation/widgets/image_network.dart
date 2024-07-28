import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lymphoma/ext/context_ext.dart';
import 'package:shimmer/shimmer.dart';

import '../../consts/dimens.dart';
import '../../gen/assets.gen.dart';

class ImageNetwork extends StatelessWidget {
  const ImageNetwork({
    super.key,
    required this.imageURL,
    this.dimension = 126
  });

  final String? imageURL;
  final double dimension;

  @override
  Widget build(BuildContext context) {
    return imageURL == null || imageURL == "" ? Card(
      color: context.colors.tertiary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimens.cardBorderRadius),
        side: BorderSide(color: context.colors.primary),
      ),
      child: SizedBox.square(
        dimension: dimension,
        child: SizedBox.square(
          dimension: 20,
          child: Padding(
            padding: const EdgeInsets.all(35),
            child: Assets.icons.icImage.svg(
              colorFilter: ColorFilter.mode(context.colors.primary, BlendMode.srcIn),
            ),
          ),
        )
      )
    ) : Card(
        child: SizedBox.square(
          dimension: dimension,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppDimens.cardBorderRadius),
            child: CachedNetworkImage(
              imageUrl: imageURL!,
              fit: BoxFit.cover,
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  width: 30,
                  height: 30,
                ),
              ),
            ),
          ),
        )
    );
  }
}
