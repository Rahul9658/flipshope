class Datamodel {
  int? code;
  String? success;
  List<Data>? data;
  int? totalRecentData;
  // List<LootDealsData>? lootDealsData;

  Datamodel(
      {this.code,
        this.success,
        this.data,
        this.totalRecentData,
      //  this.lootDealsData
      });

  Datamodel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    totalRecentData = json['total_recent_data'];
    if (json['lootDealsData'] != null) {
     // lootDealsData = <LootDealsData>[];
      json['lootDealsData'].forEach((v) {
       // lootDealsData!.add(new LootDealsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['total_recent_data'] = this.totalRecentData;
    // if (this.lootDealsData != null) {
    //   data['lootDealsData'] =
    //       this.lootDealsData!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class Data {
  int? store;
  String? pID;
  String? title;
  String? imgurl;
  int? mrp;
  int? price;
  int? currentPrice;
  String? category;
  int? subCatId;
  String? brand;
  int? score;
  int? dealType;
  int? inStock;
  int? isExpired;
  int? active;
  String? time;
  String? storeImgurl;
  String? storeName;
  String? storeDomain;

  Data(
      {this.store,
        this.pID,
        this.title,
        this.imgurl,
        this.mrp,
        this.price,
        this.currentPrice,
        this.category,
        this.subCatId,
        this.brand,
        this.score,
        this.dealType,
        this.inStock,
        this.isExpired,
        this.active,
        this.time,
        this.storeImgurl,
        this.storeName,
        this.storeDomain});

  Data.fromJson(Map<String, dynamic> json) {
    store = json['Store'];
    pID = json['PID'];
    title = json['title'];
    imgurl = json['imgurl'];
    mrp = json['mrp'];
    price = json['price'];
    currentPrice = json['current_price'];
    category = json['category'];
    subCatId = json['sub_cat_id'];
    brand = json['brand'];
    score = json['score'];
    dealType = json['deal_type'];
    inStock = json['inStock'];
    isExpired = json['isExpired'];
    active = json['active'];
    time = json['time'];
    storeImgurl = json['store_imgurl'];
    storeName = json['store_name'];
    storeDomain = json['store_domain'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Store'] = this.store;
    data['PID'] = this.pID;
    data['title'] = this.title;
    data['imgurl'] = this.imgurl;
    data['mrp'] = this.mrp;
    data['price'] = this.price;
    data['current_price'] = this.currentPrice;
    data['category'] = this.category;
    data['sub_cat_id'] = this.subCatId;
    data['brand'] = this.brand;
    data['score'] = this.score;
    data['deal_type'] = this.dealType;
    data['inStock'] = this.inStock;
    data['isExpired'] = this.isExpired;
    data['active'] = this.active;
    data['time'] = this.time;
    data['store_imgurl'] = this.storeImgurl;
    data['store_name'] = this.storeName;
    data['store_domain'] = this.storeDomain;
    return data;
  }
}