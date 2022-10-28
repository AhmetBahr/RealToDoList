import 'package:get_it/get_it.dart';
import 'package:real_to_do_list/storage/storage_service.dart';

import 'hive_storage_service.dart';

final getIt = GetIt.I;

void setUpServiceLocator() {
  getIt.registerSingleton<StorageService>(HiveStorageService());
}
