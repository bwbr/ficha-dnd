class HeroModel {
  String name;
  List<Slots> slots;

  HeroModel(this.name, this.slots);

  HeroModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['slots'] != null) {
      slots = new List<Slots>();
      json['slots'].forEach((v) {
        slots.add(new Slots.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.slots != null) {
      data['slots'] = this.slots.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Slots {
  String slotType;
  String showPosition;
  String itemReference;

  Slots({this.slotType, this.showPosition, this.itemReference});

  Slots.fromJson(Map<String, dynamic> json) {
    slotType = json['slot_type'];
    showPosition = json['show_position'];
    itemReference = json['item_reference'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slot_type'] = this.slotType;
    data['show_position'] = this.showPosition;
    data['item_reference'] = this.itemReference;
    return data;
  }
}