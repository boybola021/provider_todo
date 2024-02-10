

class Todo{
  String id;
  String title;
  String description;
  bool isComplete;

  Todo({
    required this.id,
    required this.title,
    required this.description,
    required this.isComplete
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Todo &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          description == other.description &&
          isComplete == other.isComplete;

  @override
  int get hashCode => Object.hash(id.hashCode,title.hashCode,description.hashCode,isComplete.hashCode);

  @override
  String toString() {
    return 'Todo{id: $id, title: $title, description: $description, isComplate: $isComplete}';
  }
}