import 'package:example/core.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';

class ProfileController extends State<ProfileView> implements MvcController {
  static late ProfileController instance;
  late ProfileView view;

  final ImagePicker imagePicker = ImagePicker();
  File? image;

  //tambahan td
  File? imageFile;
  dynamic pickImageError;
  final picker = ImagePicker();
  String? convertPath;
  String? jpgPath;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  bool setimage = false;
  List imageGalleries = [];

  // fungsion td
  onSelectImagePicker(ImageSource source) async {
    try {
      final pickedFile = await picker.pickImage(source: source);
      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
      } else {
        if (kDebugMode) {
          print('No image selected');
        }
      }
    } catch (e) {
      pickImageError = e;
    }
    if (imageFile != null) {}
    setState(() {});
  }

  pickImage(ImageSource source) async {
    XFile? xFileImage = await imagePicker.pickImage(source: source);
    if (xFileImage != null) {
      image = File(xFileImage.path);
      setState(() {});
    }
  }

  Future picksImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final imageTemporary = File(image.path);
    setState(() => this.image = imageTemporary);

    print(this.image);
  }

  doLogout() async {
    await AuthService.doLogout();
    Get.offAll(const LoginView());
  }
}
