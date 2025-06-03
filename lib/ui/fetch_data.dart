import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes/provider/group_provider.dart';

import '../drawer/side_drawer.dart';
class FetchData extends StatefulWidget {
  final  email;
  const FetchData({super.key, required this.email,});
  @override
  State<FetchData> createState() => _FetchDataState();
}
class _FetchDataState extends State<FetchData> {
  @override
  void initState() {
    context.read<GroupProvider>().getDealApi();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final groupProvider = context.watch<GroupProvider>();
    return Scaffold(
      drawer: const SideDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        toolbarHeight: 70,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        automaticallyImplyLeading: false,
        title: const Text(
          "Products Details",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        actions: const [],
      ),
      body: groupProvider.storeModel == null || groupProvider.storeModel!.data!.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
           itemCount: groupProvider.storeModel!.data!.length,
           itemBuilder: (context, index) {
           return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(groupProvider.storeModel!.data![index].storeName.toString()),
                Text(groupProvider.storeModel!.data![index].siteId.toString()),
                const SizedBox(height: 10),
              ],
            ),
          );
        },
      ),

    );
  }
}
