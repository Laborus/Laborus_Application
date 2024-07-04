import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:laborus_app/core/utils/theme/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Widget buildIndicator(int activeIndex, List<String> urlImages,
    CarouselController controller, BuildContext context) {
  void animateToSlide(int index) => controller.animateToPage(index);
  return AnimatedSmoothIndicator(
    onDotClicked: animateToSlide,
    effect: ExpandingDotsEffect(
      dotWidth: 15,
      activeDotColor: AppColors.darknessPurple,
    ),
    activeIndex: activeIndex,
    count: urlImages.length,
  );
}
