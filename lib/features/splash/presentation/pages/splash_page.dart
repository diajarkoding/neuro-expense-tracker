import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/router/route_paths.dart';
import '../../../../app/theme/neo_colors.dart';
import '../../../../app/theme/neo_text_styles.dart';
import '../../../../app/theme/neo_spacing.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        context.go(RoutePaths.expenses);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeoColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(NeoSpacing.lg),
          child: Column(
            children: [
              const Spacer(),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 96,
                      height: 96,
                      decoration: BoxDecoration(
                        color: NeoColors.pureBlack,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: const Icon(
                        Icons.receipt_long_rounded,
                        color: NeoColors.sunYellow,
                        size: 48,
                      ),
                    ),
                    const SizedBox(height: NeoSpacing.xxl),
                    const Text(
                      'NeuroExpense',
                      style: NeoTextStyles.headlineLarge,
                    ),
                    const SizedBox(height: NeoSpacing.sm),
                    const Text(
                      'Track expenses clearly',
                      style: NeoTextStyles.bodyMedium,
                    ),
                    const SizedBox(height: NeoSpacing.xxxl),
                    const SizedBox(
                      width: 32,
                      height: 32,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        color: NeoColors.pureBlack,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              const Text('v1.0.0', style: NeoTextStyles.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
