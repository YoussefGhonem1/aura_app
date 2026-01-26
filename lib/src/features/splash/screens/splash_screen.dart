import 'package:aura_app/src/features/splash/widgets/animation_letter.dart';
import 'package:aura_app/src/features/splash/widgets/background_pointer.dart';
import 'package:aura_app/src/features/splash/widgets/logo_container.dart';
import 'package:aura_app/src/shared/routing/route_strings.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  final String word = "AURA";

  final List<Offset> entryOffsets = [
    const Offset(-1.5, 0),
    const Offset(0.0, -1.5),
    const Offset(0.0, 1.5),
    const Offset(1.5, 0),
  ];

  late List<AnimationController> _controllers;
  late List<Animation<Offset>> _slideAnimations;
  late List<Animation<double>> _fadeAnimations;

  late AnimationController _logoController;
  late Animation<double> _logoScale;

  @override
  void initState() {
    super.initState();

    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );
    _logoScale = CurvedAnimation(
      parent: _logoController,
      curve: Curves.elasticOut,
    );

    _controllers = List.generate(word.length, (index) {
      return AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1500),
      );
    });

    _slideAnimations = List.generate(word.length, (index) {
      return Tween<Offset>(
        begin: entryOffsets[index],
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: _controllers[index],
          curve: Curves.easeOutCubic,
        ),
      );
    });

    _fadeAnimations = List.generate(word.length, (index) {
      return Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _controllers[index], curve: Curves.easeIn),
      );
    });

    _startSequentialAnimations();
  }

  Future<void> _startSequentialAnimations() async {
    _logoController.forward();
    await Future.delayed(const Duration(milliseconds: 500));

    for (var controller in _controllers) {
      controller.forward();
      await Future.delayed(const Duration(milliseconds: 200));
    }
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      Navigator.pushReplacementNamed(context, Routes.onBoarding);
    }
  }

  @override
  void dispose() {
    _logoController.dispose();
    for (var c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(size: Size.infinite, painter: GridBackgroundPainter()),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ScaleTransition(
                  scale: _logoScale,
                  child: buildLogoContainer(),
                ),
                const SizedBox(height: 45),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(word.length, (index) {
                    return AnimatedLetter(
                      char: word[index],
                      slideAnimation: _slideAnimations[index],
                      fadeAnimation: _fadeAnimations[index],
                    );
                  }),
                ),

                const SizedBox(height: 15),
                FadeTransition(
                  opacity: _fadeAnimations.last,
                  child: Text(
                    "AI-POWERED INVESTING",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      letterSpacing: 2,
                      color: AppColors.greyText,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
