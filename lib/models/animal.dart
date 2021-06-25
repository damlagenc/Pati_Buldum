class Animal {
  int id;
  String name;
  String title;
  String body;
  String url;

  Animal({this.name, this.id, this.title, this.body, this.url});

  factory Animal.fromJson(Map<String, dynamic> json) {
    return Animal(
      id: json['id'],
      name: json['name'],
      title: json['title'],
      body: json['body'],
      url: json['url'],
    );
  }
}
