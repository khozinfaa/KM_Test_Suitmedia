import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:question1/home/secondscreen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: SizedBox(
        height: 800,
        width: 400,
        child: Padding(
          padding: EdgeInsets.only(top: paddingTop),
          child: SizedBox(
            child: Container(
              padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background 1.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/ic_photo.png',
                    ),
                  ),
                  const SizedBox(
                    height: 51,
                  ),
                  SizedBox(
                    height: 41,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Name',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 41,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Palindrom',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2B637B),
                          fixedSize: const Size(310, 41),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onPressed: () {},
                      child: const Text(
                        'CHECK',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2B637B),
                          fixedSize: const Size(310, 41),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onPressed: () {
                        Get.to(const SecondScreen());
                      },
                      child: const Text(
                        'NEXT',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
