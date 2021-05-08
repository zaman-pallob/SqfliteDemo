class Model {
  String name;
  String age;
  String height;

  Model({this.name, this.age, this.height});

  Model.fromMap(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    height = json['height'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['age'] = this.age;
    data['height'] = this.height;
    return data;
  }
}
