import 'package:aura_app/src/features/on_boarding/models/on_boarding_model.dart';
import 'package:aura_app/src/shared/routing/route_strings.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingData> _pages = [
    OnboardingData(
      image: 'assets/images/onboarding1.jpeg',
      title: 'Smarter ',
      highlightText: 'Forecasting',
      description:
          'Aura uses advanced AI to predict market trends before they happen.',
    ),
    OnboardingData(
      image: 'assets/images/onboarding2.png',
      title: 'Market ',
      highlightText: 'Pulse',
      description:
          'We analyze global sentiment to give you the full story behind the price.',
    ),
    OnboardingData(
      image: 'assets/images/onboarding3.jpeg',
      title: 'Smart ',
      highlightText: 'Portfolio',
      description:
          'Receive real-time buy and sell signals tailored to your risk profile.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 60),
              Opacity(
                opacity: _currentPage == _pages.length - 1 ? 0.0 : 1.0,
                child: AbsorbPointer(
                  absorbing: _currentPage == _pages.length - 1,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        _pageController.jumpToPage(_pages.length - 1);
                      },
                      child: Text(
                        "Skip",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.greyText,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) =>
                      setState(() => _currentPage = index),
                  itemCount: _pages.length,
                  itemBuilder: (context, index) =>
                      _buildPageContent(_pages[index]),
                ),
              ),
              _buildBottomControls(),
              const SizedBox(height: 40),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPageContent(OnboardingData data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.white.withOpacity(0.1),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.secondaryColor.withOpacity(0.15),
                  blurRadius: 30,
                  spreadRadius: 1,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(data.image, height: 320, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 50),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              children: [
                TextSpan(text: data.title),
                TextSpan(
                  text: data.highlightText,
                  style: TextStyle(color: AppColors.secondaryColor),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            data.description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              height: 1.5,
              color: AppColors.greyText,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomControls() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_pages.length, (index) => _buildDot(index)),
        ),
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: ElevatedButton(
            onPressed: () {
              if (_currentPage < _pages.length - 1) {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              } else {
                Navigator.pushReplacementNamed(context, Routes.CreateAccount);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.secondaryColor,
              foregroundColor: AppColors.primaryColor,
              minimumSize: const Size(double.infinity, 56),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
              ),
            ),
            child: Text(
              _currentPage == _pages.length - 1 ? "Get Started" : "Next",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(right: 8),
      height: 6,
      width: _currentPage == index ? 24 : 8,
      decoration: BoxDecoration(
        color: _currentPage == index
            ? AppColors.secondaryColor
            : AppColors.greyText.withOpacity(0.3),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
