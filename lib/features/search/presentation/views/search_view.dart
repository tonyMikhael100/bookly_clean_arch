import 'package:bookly_clean_arch/features/search/presentation/widgets/search_view_app_bar.dart';
import 'package:bookly_clean_arch/features/search/presentation/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.h),
          child: SafeArea(child: const SearchViewAppBar())),
      body: SafeArea(child: const SearchViewBody()),
    );
  }
}
