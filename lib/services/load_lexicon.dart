import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io'; // For File class
import 'package:path_provider/path_provider.dart'; // For getApplicationDocumentsDirectory

class LoadLexicon {
  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<void> downloadFile() async {
    try {
      Reference storageRef = FirebaseStorage.instance.ref();

      final islandRef = storageRef.child("CSW2021/CSW21_2.txt");

      final appDocDir = await getApplicationDocumentsDirectory();
      final filePath = "${appDocDir.absolute}/CSW2021/CSW21_2.txt";
      final file = File(filePath);

      final downloadTask = islandRef.writeToFile(file);
      // downloadTask.snapshotEvents.listen((taskSnapshot) {
      //   switch (taskSnapshot.state) {
      //     case TaskState.running:
      //       if (kDebugMode) {
      //         print("running");
      //       }
      //       break;
      //     case TaskState.paused:
      //       if (kDebugMode) {
      //         print("paused");
      //       }
      //       break;
      //     case TaskState.success:
      //       if (kDebugMode) {
      //         print("success");
      //       }
      //       break;
      //     case TaskState.canceled:
      //       if (kDebugMode) {
      //         print("canceled");
      //       }
      //       break;
      //     case TaskState.error:
      //       if (kDebugMode) {
      //         print("error");
      //       }
      //       break;
      //   }
      // });
    } catch (e) {
      print('Error downloading file: $e');
    }
  }
}
