class Studentmode {
  int? _id;

  int? get id => _id;

  set id(int? value) {
    _id = value;
  }

  String? _name;

  String? get name => _name;

  set name(String? value) {
    _name = value;
  }

  String? _roll;

  String? get roll => _roll;

  set roll(String? value) {
    _roll = value;
  }

  Studentmode({int? id, String? name, String? roll})
    : _roll = roll,
      _id = id,
      _name = name;

  Map<String, dynamic> toMap() {
    return {'name': name, 'roll': roll};
  }

  factory Studentmode.fromMap(Map<String, dynamic> map) {
    return Studentmode(id: map['id'], name: map['name'], roll: map['roll']);
  }
}
