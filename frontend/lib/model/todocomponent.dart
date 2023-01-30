class ToDoComponent {
  int? id;
  String title;
  String description;
  String priority;
  String imageUrl;

  ToDoComponent(
      {this.id,
      required this.title,
      required this.description,
      required this.priority,
      required this.imageUrl});

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'priority': priority,
        'image_url': imageUrl
      };

  static ToDoComponent fromSnap(Map<String, dynamic> json) {
    return ToDoComponent(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        priority: json['priority'],
        imageUrl: json['image_url']);
  }
}
