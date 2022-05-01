class Model {
  String? name;
  String? flag;

  Model({this.name, this.flag});

  Model.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['flag'] = this.flag;
    return data;
  }
}
