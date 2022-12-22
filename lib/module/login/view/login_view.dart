import 'package:flutter/material.dart';
import 'package:example/core.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  Widget build(context, LoginController controller) {
    controller.view = this;
    //  final String imagePath;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("assets/icon/flat_donat.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              const Color.fromARGB(255, 227, 225, 227).withOpacity(0.1),
              BlendMode.color,
            ),
          ),
        ),
        child: Center(
          child: ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            children: [
              SizedBox(
                height: 100,
                child: Image.asset(
                  "assets/icon/donuts_kartun.png",
                  fit: BoxFit.contain,
                ),
              ),
              //  const SizedBox(height: 20),
              const Text(
                "Sweet Donuts",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    fontFamily: "Poppins-Bold",
                    color: Colors.brown),
              ),

              // adding card
              Card(
                elevation: 30,
                color: Theme.of(context).colorScheme.surfaceVariant,
                borderOnForeground: true,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: QTextField(
                        label: "Name",
                        validator: Validator.required,
                        value: controller.email,
                        onChanged: (value) {
                          controller.email = value;
                          controller.saveToLocalStorage();
                        },
                      ),
                    ),
                    //const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: QTextField(
                        label: "Password",
                        validator: Validator.required,
                        obscure: true,
                        value: controller.password,
                        onChanged: (value) {
                          controller.password = value;
                          controller.saveToLocalStorage();
                        },
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          textStyle: const TextStyle(
                            fontSize: 15,
                          )),
                      onPressed: () {},
                      child: const Text("Forgot Password"),
                    ),
                    SizedBox(
                      width: 250,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          controller.doLogin();
                          //  controller.setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange[300],
                        ),
                        child: const Text("Log in"),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      // width: MediaQuery.of(context).size.width,
                      width: 250,
                      height: 40.0,
                      child: ElevatedButton.icon(
                        icon: const Icon(MdiIcons.google),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 136, 0, 113),
                        ),
                        label: const Text("Login as Member"),
                        onPressed: () => controller.doLoginAsMember(),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      //width: MediaQuery.of(context).size.width,
                      width: 250,
                      height: 40.0,
                      child: ElevatedButton.icon(
                        icon: const Icon(MdiIcons.google),
                        label: const Text("Login as Vendor"),
                        onPressed: () => controller.doLoginAsVendor(),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don’t have an account? ",
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text("Sign up"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<LoginView> createState() => LoginController();
}
