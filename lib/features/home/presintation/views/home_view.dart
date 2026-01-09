
import 'package:booklly/core/utiles/api_service.dart';
import 'package:booklly/core/utiles/dio_clint.dart';
import 'package:booklly/features/home/data/data_sources/home_local_data_source.dart';
import 'package:booklly/features/home/data/data_sources/home_remot_data_source.dart';
import 'package:booklly/features/home/data/repo/repo_implement.dart';
import 'package:booklly/features/home/domain/repos/home_repo.dart';
import 'package:booklly/features/home/domain/use_case/featch_featured_use_case.dart';
import 'package:booklly/features/home/presintation/views/widgets/home_view_body.dart';
import 'package:booklly/features/home/presintation/views_models/cubit/featuer_book_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FeatuerBookCubit(
        FetchFeaturedBooksUseeCase(
          RepoImplement(
            homeLocalDataSource: HomeLocalDataSourceImpl(),
            homeRemoteDataSource: HomeRemoteDataSourceImpl(ApiService(DioClient().dio)),
          ),
        ),
      )..featchFeatueredBooks(),

      child: Scaffold(body: HomeViewBody()),
    );
  }
}
