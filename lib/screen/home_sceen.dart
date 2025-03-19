import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/provider_class.dart';
class HomeSceen extends StatefulWidget {
  const HomeSceen({super.key});
  @override
  State<HomeSceen> createState() => _HomeSceenState();
}
class _HomeSceenState extends State<HomeSceen> {
  void initState() {
    super.initState();
    // Fetch store data when the screen is loaded
    Provider.of<StoreProvider>(context, listen: false).getRpdFiltersSTORE();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70,
         title: Text("Store",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 24,color: Colors.white),),
        backgroundColor: Colors.deepOrange,
      ),

      body: Consumer<StoreProvider>(builder: (context ,storeVale ,child){
          if(storeVale.isLoading){
            return Center(child: CircularProgressIndicator());
          }
          if(storeVale.storeModel.data==null||storeVale.storeModel.data!.isEmpty){
            return Text("Data not available",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600),);
          }
         return ListView.builder(
           itemCount: storeVale.storeModel.data!.length,
             itemBuilder: (context , index){
             final dataValue = storeVale.storeModel.data![index]; 
             return Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 ListTile(
                   leading: dataValue.imgUrl != null
                       ? Image.network(dataValue.imgUrl!,height: 60,width: 60,)
                       : Icon(Icons.store),
                   title: Text(dataValue.storeName.toString(),style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
                 ),
                  Divider(
                    height: 25,
                  )
                 
               ],
             );
         });
      }
      )
    );
  }
}
