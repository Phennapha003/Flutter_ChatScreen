// ignore_for_file: unused_field, unused_local_variable

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  const UserImagePicker({super.key, required this.callback});
  final void Function({required File pickedImageFile}) callback;

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _pickedImageFile;
  ImageProvider? _image;

  void pickImage() async {
    final pickImageXFile = await ImagePicker().pickImage(
        source: ImageSource.gallery, imageQuality: 50, maxWidth: 200);
    if (kIsWeb) {
      _pickedImageFile =
          await DefaultCacheManager().getSingleFile(pickImageXFile!.path);
    } else {
      _pickedImageFile = File(pickImageXFile!.path);
    }
    setState(() {
      _image = FileImage(_pickedImageFile!);
    });
    widget.callback(pickedImageFile: _pickedImageFile!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: _image,
        ),
        TextButton.icon(
          onPressed: () => pickImage(),
          icon: const Icon(Icons.image),
          label: const Text('select image'),
        )
      ],
    );
  }
}
