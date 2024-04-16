import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexteons_test/controller/data_fetch.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiController controller = Get.put(ApiController());

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Nexteons'),
      ),
      body: ListView.builder(
        itemCount: controller.list.length,
        itemBuilder: (context, index) {
          final userData = controller.list[index];
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(userData.url),
                ),
                title: Text('Uid: ${userData.uid.toString()}'),
                subtitle: Text('Doc type: ${userData.docType.toString()}'),
              ),
            ),
          );
        },
      ),
    );
  }

  getData() async {
    await controller.getData();
  }
}
