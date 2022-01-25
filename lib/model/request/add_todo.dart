class AddTodo{
  String? description;

  AddTodo({this.description});

  Map<String, dynamic> toJson() {
    return {
      'description': description,
    };
  }
}