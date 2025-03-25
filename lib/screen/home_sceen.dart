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
    Provider.of<StoreProvider>(context, listen: false).getDealsData();
    Provider.of<StoreProvider>(context, listen: false).recientPriceDrop();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70,
        title: Text("Flipshope",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 24,color: Colors.white),),
        backgroundColor: Color(0xFF2158D7),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer<StoreProvider>(builder: (context , counterProvider , child){
                if(counterProvider.isLoading){
                  return Center(child: CircularProgressIndicator());
                }
                return SizedBox(
                  height: MediaQuery.of(context).size.height*0.390,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:counterProvider.datamodel.data!.length,
                      itemBuilder: (context , index){
                        //  int dealsData=counterProvider.datamodel.data!.length;
                        return  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Card(
                                color: Colors.white,
                                elevation: 5,
                                child: Container(
                                    margin: EdgeInsets.all(8.0),
                                    height: 300,
                                    width: 180,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Image.network(counterProvider.datamodel.data![index].imgurl.toString(),height: 150,width: 200,),
                                        Image.network(counterProvider.datamodel.data![index].storeImgurl.toString(),height: 50,width: 30,),
                  
                                        Text(counterProvider.datamodel.data![index].title.toString(),style: TextStyle(
                                          fontSize: 16,fontWeight: FontWeight.w600,
                                        ),
                                          maxLines: 2,
                  
                                        ),
                                        SizedBox(height: 5,),
                                        Text("₹ ${counterProvider.datamodel.data![index].price}",
                                          style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
                                        Text(counterProvider.datamodel.data![index].time!)
                                      ],
                                    )
                  
                                ),
                              ),
                            ),
                          ],
                        );
                  
                  
                      }),
                );
              }),
              SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Image.asset("assets/images/dealUnder499.png",height: 100,width: 200,),
                    Image.asset("assets/images/electronicDeals.png",height: 100,width: 200,),

                ],),
              ),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 15.0),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text("Recent Price drop",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                     Text("Filter",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),

                   ],
                 ),
               ),

              Consumer<StoreProvider>(builder: (context , counterProvider , child){
                if(counterProvider.isLoading){
                  return Center(child: CircularProgressIndicator());
                }
                return SizedBox(
                  height: MediaQuery.of(context).size.height*0.390,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:counterProvider.datamodel.data!.length,
                      itemBuilder: (context , index){
                        //  int dealsData=counterProvider.datamodel.data!.length;
                        return  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Card(
                                color: Colors.white,
                                elevation: 5,
                                child: Container(
                                    margin: EdgeInsets.all(8.0),
                                    height: 300,
                                    width: 180,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Image.network(counterProvider.datamodel.data![index].imgurl.toString(),height: 150,width: 200,),
                                        Image.network(counterProvider.datamodel.data![index].storeImgurl.toString(),height: 50,width: 30,),

                                        Text(counterProvider.datamodel.data![index].title.toString(),style: TextStyle(
                                          fontSize: 16,fontWeight: FontWeight.w600,
                                        ),
                                          maxLines: 2,

                                        ),
                                        SizedBox(height: 5,),
                                        Text("₹ ${counterProvider.datamodel.data![index].price}",
                                          style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
                                        Text(counterProvider.datamodel.data![index].time!)
                                      ],
                                    )

                                ),
                              ),
                            ),
                          ],
                        );


                      }),
                );
              }),



            ],
        ),
      )
      //
     //  body: Consumer<StoreProvider>(builder: (context ,storeVale ,child){
     //      if(storeVale.isLoading){
     //        return Center(child: CircularProgressIndicator());
     //      }
     //      if(storeVale.storeModel.data==null||storeVale.storeModel.data!.isEmpty){
     //        return Text("Data not available",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600),);
     //      }
     //     return ListView.builder(
     //       itemCount: storeVale.storeModel.data!.length,
     //         itemBuilder: (context , index){
     //         final dataValue = storeVale.storeModel.data![index];
     //         return Column(
     //           crossAxisAlignment: CrossAxisAlignment.start,
     //           children: [
     //             ListTile(
     //               leading: dataValue.imgUrl != null
     //                   ? Image.network(dataValue.imgUrl!,height: 60,width: 60,)
     //                   : Icon(Icons.store),
     //               title: Text(dataValue.storeName.toString(),style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
     //             ),
     //              Divider(
     //                height: 25,
     //              )
     //
     //           ],
     //         );
     //     });
     //  }
     // )
    );
  }
}
