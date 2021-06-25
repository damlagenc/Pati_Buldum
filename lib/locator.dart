import 'package:get_it/get_it.dart';
import 'package:mobil_projem/repository/user_repository.dart';
import 'package:mobil_projem/services/fake_auth_service.dart';
import 'package:mobil_projem/services/firebase_auth_service.dart';
import 'package:mobil_projem/services/firestore_db_service.dart';

GetIt locator = GetIt.I;

void setupLocator() {
  locator.registerLazySingleton(() => FirebaseAuthService());
  locator.registerLazySingleton(() => FakeAuthService());
  locator.registerLazySingleton(() => FirestoreDBService());
  locator.registerLazySingleton(() => UserRepository());
}
