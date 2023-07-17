class EventModel {
  final int id;
  final String title;
  final String subTitle;
  final String distance;
  final String image;
  final double inPlayers;
  final double totalPlayers;
  final List players;

  EventModel({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.distance,
    required this.image,
    required this.inPlayers,
    required this.totalPlayers,
    required this.players,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'],
      title: json['title'],
      subTitle: json['subTitle'],
      distance: json['distance'],
      image: json['image'],
      inPlayers: json['inPlayers'],
      totalPlayers: json['totalPlayers'],
      players: json['players'],
    );
  }
}
