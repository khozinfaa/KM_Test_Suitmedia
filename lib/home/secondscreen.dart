import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:question1/home/firstscreen.dart';
import 'package:question1/home/thirdscreen.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: const EdgeInsets.only(top: 0),
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xFFE2E3E4),
                          width: 1,
                        ),
                      ),
                    ),
                    height: 48,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      margin: const EdgeInsets.only(top: 2, left: 130),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Second Screen",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 2, left: 16),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                        onPressed: () {
                          Get.to(const FirstScreen());
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_outlined,
                          color: Color(0xff554AF0),
                        )),
                  ),
                ),
              ],
            ),
            Expanded(
                child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 6, left: 29, right: 29, bottom: 32),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        'Welcome',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        'John Doe',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Container(
                      height: 300,
                      width: 300,
                      alignment: Alignment.center,
                      child: const Text(
                        'Selected User Name',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 180,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2B637B),
                            fixedSize: const Size(310, 41),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                        onPressed: () {
                          Get.to(const ThirdScreen());
                        },
                        child: const Text(
                          'Choose a User',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        )),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
