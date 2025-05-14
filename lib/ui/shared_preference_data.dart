import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes/view_model/shared_pref_screen.dart' show SharedProvider;
class SharedPreferenceData extends StatefulWidget {
  const SharedPreferenceData({super.key});

  @override
  State<SharedPreferenceData> createState() => _SharedPreferenceDataState();
}

class _SharedPreferenceDataState extends State<SharedPreferenceData> {
  void initState() {
      context.read<SharedProvider>().lodedData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final sharedProvider = context.watch<SharedProvider>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        backgroundColor: const Color(0xFF6B38FB),
        title: const Text("Shared Preference"),
      ),
        body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Text('Name-----: ${sharedProvider.name}'),

          ],
        ),
      ),
    );
  }
}
