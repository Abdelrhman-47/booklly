import 'package:flutter/material.dart';
import '../../../../../core/assets.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animationSlider;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1), // خليتها ثانيتين
    );

    animationSlider =
        Tween<Offset>(
          begin: const Offset(0, 1), // يبدأ من تحت
          end: Offset.zero, // يوصل مكانه الطبيعي
        ).animate(
          CurvedAnimation(
            parent: animationController,
            curve: Curves.easeOut, // حركة ناعمة
          ),
        );

    animationController.forward(); // تشغيل الأنيميشن
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo),
        Center(
          child: SlideTransition(
            position: animationSlider,
            child: const Text(
              'this your book app',
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ],
    );
  }
}
