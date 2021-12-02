import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  final void Function(File pickedImage) imagePickFn;

  const UserImagePicker(this.imagePickFn);

  @override
  _ImagePickerState createState() => _ImagePickerState();
}

class _ImagePickerState extends State<UserImagePicker> {
  File? _pickedImage;
  void _pickImage() async {
    final _picker = ImagePicker();
    final File? image =
        await _picker.pickImage(source: ImageSource.camera) as File;
    setState(() {
      _pickedImage = File(image!.path);
    });
    widget.imagePickFn(image!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage:
              _pickedImage != null ? FileImage(File(_pickedImage!.path)) : null,
        ),
        TextButton.icon(
          onPressed: _pickImage,
          icon: const Icon(Icons.image),
          label: const Text("Add Image"),
        ),
      ],
    );
  }
}


// Column(
//       children: [
//         InkWell(
//           onTap: _pickImage,
//           child: CircleAvatar(
//             backgroundColor: Colors.black,
//             radius: 40.0,
//             child: CircleAvatar(
//               radius: 38.0,
//               child: ClipOval(
//                 child: (_pickedImage == null)
//                     ? const Icon(Icons.edit)
//                     : Image.file(File(_pickedImage!.path)),
//               ),
//               backgroundColor: Colors.white,
//             ),
//           ),
//         )
//       ],
//     );