import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class UpdateEmployeeProvider extends ChangeNotifier {
  final employee = FirebaseFirestore.instance.collection('employee');
  File? _imageFile;
  File? get imgeFile => _imageFile;
  final ImagePicker _picker = ImagePicker();
  void picImage(ImageSource source) async {
    try {
      final image = await _picker.pickImage(
        source: source,
        imageQuality: 1,
      );
      _imageFile = File(image!.path);
    } catch (e) {
      // print("this is the error of the image " + e.toString());
    }
    notifyListeners();
  }

  void uploadImage(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo, color: Colors.black),
                title: const Text('Photo'),
                onTap: () async {
                  picImage(ImageSource.camera);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.browse_gallery_outlined,
                    color: Colors.black),
                title: const Text('Gallery'),
                onTap: () async {
                  picImage(
                    ImageSource.gallery,
                  );
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
    notifyListeners();
  }

  updateEmployee(String? name, String? id) async {
    log("hdfjjkdsfhjksadfkjaskdj" + name.toString());
    firebase_storage.UploadTask uploadTask;
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('updateEmployessImages/')
        .child(DateTime.now().microsecondsSinceEpoch.toString());
    uploadTask = ref.putFile(_imageFile!);
    await uploadTask.whenComplete(() => debugPrint("The picture is upload"));

    String? imageUrl = await ref.getDownloadURL();
    log(imageUrl);

    await employee.doc(id).update({"image": imageUrl, "name": name});
    notifyListeners();
  }
}
