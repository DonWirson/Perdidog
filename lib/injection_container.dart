import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:perros_sos/features/stray_dog/data/datasources/remote/stray_dog_api_service.dart';
import 'package:perros_sos/features/stray_dog/data/repositories/stray_dog_repository_impl.dart';
import 'package:perros_sos/features/stray_dog/domain/repositories/stray_dog_repository.dart';
import 'package:perros_sos/features/stray_dog/domain/usecases/get_stray_dogs.dart';
import 'package:perros_sos/features/stray_dog/presentation/bloc/stray_dog_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //Dio instance
  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<StrayDogApiService>(
    StrayDogApiService(
      sl(),
    ),
  );
  //Dependencies
  sl.registerSingleton<StrayDogRepository>(
    StrayDogRepositoryImplementation(
      sl(),
    ),
  );
  //Use cases
  sl.registerSingleton<GetStrayDogsUseCase>(
    GetStrayDogsUseCase(
      sl(),
    ),
  );
  //Blocs
  sl.registerFactory<StrayDogBloc>(
    () => StrayDogBloc(
      sl(),
    ),
  );
}