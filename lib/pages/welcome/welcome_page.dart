import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int activeIndex = 0;
  final controller = CarouselController();
  final urlImages = [
    'assets/img/slide1.png',
    'assets/img/slide2.png',
    'assets/img/slide3.png',
  ];

  final titles = ['Laborus', 'Compartilhe', 'Interaja'];

  final labels = [
    'Sua plataforma de gestão acadêmica e oportunidades profissionais!',
    'Compartilhe trabalhos acadêmicos e converse com outros estudantes.',
    'Encontre novas pessoas e faça amizades com base nos interesses similares.',
  ];
  void refresh() {
    setState(() {});
    if (activeIndex == urlImages.length - 1) {
      context.goNamed('feed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CarouselSlider.builder(
                carouselController: controller,
                itemCount: urlImages.length,
                itemBuilder: (context, index, realIndex) {
                  final urlImage = urlImages[index];
                  final label = labels[index];
                  final title = titles[index];
                  return buildContainer(urlImage, title, label, index, context);
                },
                options: CarouselOptions(
                  height: 320,
                  autoPlay: false,
                  enableInfiniteScroll: false,
                  autoPlayAnimationDuration: const Duration(seconds: 2),
                  enlargeCenterPage: true,
                  clipBehavior: Clip.none,
                  onPageChanged: (index, reason) =>
                      setState(() => activeIndex = index),
                ),
              ),
              const SizedBox(height: 24),
              buildIndicator()
            ],
          ),
          ElevatedButton(
            onPressed:
                activeIndex == urlImages.length - 1 ? () => refresh() : null,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    // Estilo quando o botão está desabilitado
                    return Colors
                        .grey; // Cor de fundo cinza para indicar desabilitado
                  }
                  // Estilo padrão do botão ativado
                  return Theme.of(context).colorScheme.tertiary;
                },
              ),
            ),
            child: Container(
              width: 240,
              height: 50,
              alignment: Alignment.center,
              child: Text(
                'Continuar',
                style: const TextTheme().titleLarge,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        onDotClicked: animateToSlide,
        effect: ExpandingDotsEffect(
          dotWidth: 15,
          activeDotColor: Theme.of(context).colorScheme.tertiary,
        ),
        activeIndex: activeIndex,
        count: urlImages.length,
      );

  void animateToSlide(int index) => controller.animateToPage(index);
}

Widget buildContainer(String urlImage, String title, String label, int index,
        BuildContext ctx) =>
    SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Image.asset(urlImage, fit: BoxFit.cover),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextTheme().headlineSmall,
          ),
          const SizedBox(height: 20),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextTheme().bodyMedium,
          ),
        ],
      ),
    );
