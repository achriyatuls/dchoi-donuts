import 'package:example/core.dart';
import 'package:flutter/material.dart';

class LoginController extends State<LoginView> implements MvcController {
  static late LoginController instance;
  late LoginView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  //for ls login
  String email = "";
  String password = "";
  bool ready = false;

  doLogin() async {
    await showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Info'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Login success!'),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Ok"),
            ),
          ],
        );
      },
    );
  }

  loadLocalStorage() async {
    email = await mainStorage.get("email") ?? "";
    password = await mainStorage.get("password") ?? "";

    ready = true;
    setState(() {});
  }

  saveToLocalStorage() async {
    mainStorage.put("email", email);
    mainStorage.put("password", password);
  }

  doLoginAsMember() async {
    var isSuccess = await AuthService.doLoginAsMember();
    if (isSuccess) {
      Get.offAll(const MainNavigationView());
    }
  }

  doLoginAsVendor() async {
    var isSuccess = await AuthService.doLoginAsVendor();
    if (isSuccess) {
      Get.offAll(const MainNavigationView());
    }
  }
}
