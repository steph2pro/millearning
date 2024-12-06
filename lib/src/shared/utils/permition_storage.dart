// import 'package:permission_handler/permission_handler.dart';

// Future<bool> requestStoragePermission() async {
//   if (await Permission.manageExternalStorage.isGranted) {
//     return true;
//   } else {
//     var status = await Permission.manageExternalStorage.request();
//     return status.isGranted;
//   }
// }

import 'package:permission_handler/permission_handler.dart';

Future<bool> requestManageStoragePermission() async {
  if (await Permission.manageExternalStorage.isGranted) {
    print("Permission MANAGE_EXTERNAL_STORAGE déjà accordée.");
    return true;
  }

  final status = await Permission.manageExternalStorage.request();

  if (status.isGranted) {
    print("Permission MANAGE_EXTERNAL_STORAGE accordée.");
    return true;
  } else if (status.isDenied) {
    print("Permission MANAGE_EXTERNAL_STORAGE refusée.");
    return false;
  } else if (status.isPermanentlyDenied) {
    print("Permission MANAGE_EXTERNAL_STORAGE refusée définitivement.");
    await openAppSettings();
    return false;
  }

  return false;
}
