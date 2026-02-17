/// Represents a variation of a component (e.g., different sizes, colors, styles).
class ComponentVariation {
  final String id;
  final String name;
  final String description;
  final Map<String, dynamic> properties;

  const ComponentVariation({
    required this.id,
    required this.name,
    required this.description,
    required this.properties,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ComponentVariation &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
