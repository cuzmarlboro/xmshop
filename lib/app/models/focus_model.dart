class FocusModel {
  List<FocusItemModel>? result;

  FocusModel({this.result});

  /// FocusModel.fromJson() 是一个命名构造函，FocusModel.xxx 这是 dart 定义命名构造函数的方法
  /// fromJson 本身没有显式地 return，但它确实在创建并返回一个新的对象实例，这是构造函数的默认行为
  FocusModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <FocusItemModel>[];
      json['result'].forEach((v) {
        result?.add(FocusItemModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FocusItemModel {
  String? sId;
  String? title;
  String? status;
  String? pic;
  String? url;

  FocusItemModel({this.sId, this.title, this.status, this.pic, this.url});

  FocusItemModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    status = json['status'];
    pic = json['pic'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['status'] = status;
    data['pic'] = pic;
    data['url'] = url;
    return data;
  }
}
