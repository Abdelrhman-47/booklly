import 'package:booklly/core/utiles/api_service.dart';
import 'package:booklly/features/home/data/data_sources/home_local_data_source.dart';
import 'package:booklly/features/home/data/data_sources/home_remot_data_source.dart';
import 'package:booklly/features/home/data/repo/repo_implement.dart';
import 'package:booklly/features/home/domain/use_case/featch_featured_use_case.dart';
import 'package:booklly/features/home/presintation/views_models/cubit/featuer_book_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class Di {
  static GetIt sl = GetIt.instance;
 static void init()  {
    sl.registerLazySingleton<Dio>(() => Dio());
    sl.registerLazySingleton<ApiService>(() => ApiService(sl<Dio>()));
    sl.registerLazySingleton<HomeRemoteDataSourceImpl>(
      () => HomeRemoteDataSourceImpl(sl<ApiService>()),
    );
    sl.registerLazySingleton<HomeRemoteDataSource>(
      () => sl<HomeRemoteDataSourceImpl>(),
    );
    sl.registerLazySingleton<HomeLocalDataSource>(
      () => HomeLocalDataSourceImpl(),
    );
    sl.registerLazySingleton<RepoImplement>(
      () => RepoImplement(
        homeLocalDataSource: sl<HomeLocalDataSource>(),
        homeRemoteDataSource: sl<HomeRemoteDataSource>(),
      ),
    );
    sl.registerLazySingleton<FetchFeaturedBooksUseeCase>(
      () => FetchFeaturedBooksUseeCase(sl<RepoImplement>()),
    );
    sl.registerFactory<FeatuerBookCubit>(
      () => FeatuerBookCubit(sl<FetchFeaturedBooksUseeCase>()),
    );
  }
}
