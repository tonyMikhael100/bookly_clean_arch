// generate app router

import 'package:bookly_clean_arch/core/di/dependency_injection.dart';
import 'package:bookly_clean_arch/core/networking/api_service.dart';
import 'package:bookly_clean_arch/features/home/data/data_source/home_remote_data_source.dart';
import 'package:bookly_clean_arch/features/home/data/repo/home_repo_imp.dart';
import 'package:bookly_clean_arch/features/home/domain/repo/home_repo.dart';
import 'package:bookly_clean_arch/features/home/domain/use_cases/fetch_home_books_use_cases.dart';
import 'package:bookly_clean_arch/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_clean_arch/features/home/presentation/views/home_view.dart';
import 'package:bookly_clean_arch/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:bookly_clean_arch/features/search/presentation/views/search_view.dart';
import 'package:bookly_clean_arch/features/splash/presentation/views/splash_view.dart';
import 'package:bookly_clean_arch/main_scaffold.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: '/onboardingView',
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(
        path: '/homeView',
        builder: (context, state) {
          return HomeView();
        },
      ),
      GoRoute(
        path: '/mainScaffold',
        builder: (context, state) => const MainScaffold(),
      ),
      GoRoute(
        path: '/searchView',
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
