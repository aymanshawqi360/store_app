import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import '../../main.dart';
class HiveService {
  static Future<Box> initHive(String name) async {
    final application = await path_provider.getApplicationDocumentsDirectory();
    Hive..init(application.path);
    // ..registerAdapter(int);

    return await Hive.openBox<int>(name);
  }

  static Future<void> addLength(
    int lengthAllCategories,
  ) async {
    // final boxAdd = await Hive.box<LengthAllCategories>("length");

    if (!hivee!.containsKey(lengthAllCategories)) {
      await hivee!.put(lengthAllCategories, lengthAllCategories);
      //  boxAdd.put(lengthAllCategories, lengthAllCategories);
      print('add========${hivee!.keys} add=======${hivee!.values}');
    }
  }
  // static String getLength() {
  //   final getLength = Hive.box<LengthAllCategories>("length").values.toString();
  //   print("get===${getLength}");
  //   return getLength;
  // }
}
