class UpdateTodoStatus
{
  bool completed;

  UpdateTodoStatus({required this.completed});

  Map<String, dynamic> toJson() {
    return {
      'completed': completed,
    };
  }
}