class ModelDeal {
  int? code;
  String? message;
  Data? data;

  ModelDeal({this.code, this.message, this.data});

  ModelDeal.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? sId;
  int? sid;
  String? pid;
  int? price;
  String? time;
  int? stock;
  String? brand;
  String? cat;
  int? category;
  String? imgurl;
  int? mrp;
  String? pFamily;
  int? subCategory;
  String? title;
  int? rating;
  int? ratingCount;

  Data({
    this.sId,
    this.sid,
    this.pid,
    this.price,
    this.time,
    this.stock,
    this.brand,
    this.cat,
    this.category,
    this.imgurl,
    this.mrp,
    this.pFamily,
    this.subCategory,
    this.title,
    this.rating,
    this.ratingCount,
  });

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    sid = json['sid'];
    pid = json['pid'];
    price = json['price'];
    time = json['time'];
    stock = json['stock'];
    brand = json['brand'];
    cat = json['cat'];
    category = json['category'];
    imgurl = json['imgurl'];
    mrp = json['mrp'];
    pFamily = json['p_family'];
    subCategory = json['sub_category'];
    title = json['title'];
    rating = json['rating'];
    ratingCount = json['rating_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['sid'] = sid;
    data['pid'] = pid;

    data['price'] = price;
    data['time'] = time;
    data['stock'] = stock;
    data['brand'] = brand;
    data['cat'] = cat;
    data['category'] = category;
    data['imgurl'] = imgurl;
    data['mrp'] = mrp;
    data['p_family'] = pFamily;
    data['sub_category'] = subCategory;
    data['title'] = title;
    data['rating'] = rating;
    data['rating_count'] = ratingCount;
    return data;
  }
}
