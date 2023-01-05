// ignore_for_file: prefer_typing_uninitialized_variables

class Menu {
  final String weekday;
  final String meat;
  final String fish;
  final String vegetarian;
  final String desert;
  final String image;

  Menu({
    required this.weekday,
    required this.meat,
    required this.fish,
    required this.vegetarian,
    required this.desert,
    required this.image,
  });

  factory Menu.fromJson(Map<String, dynamic> json) {
    var weekday, meat, fish, vegetarian, desert, image;

    if (json['update'] != null) {
      weekday = json['update']['weekDay'];
      meat = json['update']['meat'];
      fish = json['update']['fish'];
      vegetarian = json['update']['vegetarian'];
      desert = json['update']['desert'];
      image = json['update']['img'];
    } else {
      weekday = json['original']['weekDay'];
      meat = json['original']['meat'];
      fish = json['original']['fish'];
      vegetarian = json['original']['vegetarian'];
      desert = json['original']['desert'];
      image = json['original']['img'];
    }

    return Menu(
      weekday: weekday,
      meat: meat,
      fish: fish,
      vegetarian: vegetarian,
      desert: desert,
      image: image,
    );
  }

}
