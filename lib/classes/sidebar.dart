import 'dart:convert';

Sidebar sidebarFromJson(String str) => Sidebar.fromJson(json.decode(str));

String sidebarToJson(Sidebar data) => json.encode(data.toJson());

class Sidebar {
  Sidebar({
    required this.entitys,
  });

  List<Entity> entitys;

  factory Sidebar.fromJson(Map<String, dynamic> json) => Sidebar(
        entitys:
            List<Entity>.from(json["entitys"].map((x) => Entity.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "entitys": List<dynamic>.from(entitys.map((x) => x.toJson())),
      };
}

class Entity {
  Entity({
    required this.index,
    required this.image,
    required this.color,
  });

  int index;
  String image;
  String color;

  factory Entity.fromJson(Map<String, dynamic> json) => Entity(
        index: json["index"],
        image: json["image"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "index": index,
        "image": image,
        "color": color,
      };
}
