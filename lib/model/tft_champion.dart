class TftChampionModel {
  final String id;
  final String name;
  final int tier;
  final TftChampionImage image;

  TftChampionModel({
    required this.id,
    required this.name,
    required this.tier,
    required this.image,
  });

  factory TftChampionModel.fromMap(Map<String, dynamic> json) {
    return TftChampionModel(
      id: json["id"],
      name: json["name"],
      tier: json["tier"],
      image: TftChampionImage.fromMap(json["image"]),
    );
  }
}

class TftChampionImage {
  final String full;
  final String sprite;
  final String group;
  final int x;
  final int y;
  final int w;
  final int h;

  TftChampionImage({
    required this.full,
    required this.sprite,
    required this.group,
    required this.x,
    required this.y,
    required this.w,
    required this.h,
  });

  factory TftChampionImage.fromMap(Map<String, dynamic> json) {
    return TftChampionImage(
      full: json["full"],
      sprite: json["sprite"],
      group: json["group"],
      x: json["x"],
      y: json["y"],
      w: json["w"],
      h: json["h"],
    );
  }
}
