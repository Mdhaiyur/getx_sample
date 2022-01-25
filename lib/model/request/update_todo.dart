class UpdateTodo{
  String description;
  UpdateTodo(this.description);

  Map<String, dynamic> toJson() {
    return {
      'description': description,
    };
  }
}