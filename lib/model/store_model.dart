class StoreModel {
  int? code;
  String? success;
  List<Data>? data;

  StoreModel({this.code, this.success, this.data});

  StoreModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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
    return data;
  }
}

class Data {
  int? siteId;
  String? storeDomain;
  String? storeName;
  String? imgUrl;

  Data({this.siteId, this.storeDomain, this.storeName, this.imgUrl});

  Data.fromJson(Map<String, dynamic> json) {
    siteId = json['site_id'];
    storeDomain = json['store_domain'];
    storeName = json['store_name'];
    imgUrl = json['img_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['site_id'] = this.siteId;
    data['store_domain'] = this.storeDomain;
    data['store_name'] = this.storeName;
    data['img_url'] = this.imgUrl;
    return data;
  }
}