import 'package:booklly/core/utiles/di.dart';
import 'package:booklly/features/home/presintation/views/widgets/home_view_body.dart';
import 'package:booklly/features/home/presintation/views_models/cubit/featuer_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Di.sl<FeatuerBookCubit>()..featchFeatueredBooks(),

      child: Scaffold(body: HomeViewBody()),
    );
  }
}
