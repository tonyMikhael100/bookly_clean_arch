import 'package:bookly_clean_arch/features/home/presentation/widgets/home/home_app_bar.dart';
import 'package:bookly_clean_arch/features/home/presentation/widgets/home/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: SafeArea(
          child: HomeAppBar(),
        ),
      ),
      body: SafeArea(
        child: HomeViewBody(),
      ),
    );
  }
}
