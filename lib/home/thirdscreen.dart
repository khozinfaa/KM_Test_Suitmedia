import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:question1/home/secondscreen.dart';
import 'package:question1/model/user.dart';
import 'package:question1/service/userservice.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  Stream<List<User>> getUsers() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      yield await UserService.fetchUsers();
    }
  }

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
                      margin: const EdgeInsets.only(top: 2, left: 137),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Third Screen",
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
                          Get.to(const SecondScreen());
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
              child: RefreshIndicator(
                onRefresh: () async {
                  await Future.delayed(const Duration(seconds: 1));
                },
                child: StreamBuilder<List<User>>(
                  stream: getUsers(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (snapshot.hasError) {
                      return const Center(
                        child: Text('Error'),
                      );
                    }

                    final users = snapshot.data!;
                    return ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        final user = users[index];
                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(user.avatar),
                            ),
                            title: Text('${user.firstName} ${user.lastName}'),
                            subtitle: Text(user.email),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            // Expanded(
            //   child: FutureBuilder<List<User>>(
            //     future: UserService.fetchUsers(),
            //     builder: (context, snapshot) {
            //       final users = snapshot.data;
            //       if (snapshot.connectionState == ConnectionState.waiting) {
            //         return const Center(
            //           child: CircularProgressIndicator(),
            //         );
            //       }

            //       if (snapshot.hasError) {
            //         return const Center(
            //           child: Text('Error'),
            //         );
            //       }

            //       return ListView.builder(
            //           itemCount: users!.length,
            //           itemBuilder: (context, index) {
            //             final user = users[index];
            //             return Card(
            //               child: ListTile(
            //                 leading: CircleAvatar(
            //                   backgroundImage: NetworkImage(user.avatar),
            //                 ),
            //                 title: Text('${user.firstName} ${user.lastName}'),
            //                 subtitle: Text(user.email),
            //               ),
            //             );
            //           },
            //         );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
