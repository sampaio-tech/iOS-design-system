/// Represents a state of a component (e.g., enabled, disabled, selected, hovered).
class ComponentState {
  final String id;
  final String name;
  final bool enabled;
  final bool selected;
  final bool hovered;
  final bool focused;

  const ComponentState({
    required this.id,
    required this.name,
    this.enabled = true,
    this.selected = false,
    this.hovered = false,
    this.focused = false,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ComponentState &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
