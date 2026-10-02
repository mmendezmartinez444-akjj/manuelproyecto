import 'package:flutter/material.dart';

import '../models/lifecycle_event.dart';
import '../models/study_resource.dart';

class CategorySummary {
  const CategorySummary({
    required this.category,
    required this.total,
    required this.completed,
  });

  final ResourceCategory category;
  final int total;
  final int completed;

  double get percent => total == 0 ? 0 : completed / total;
}

/// Estado global de ExRE. Se apoya únicamente en [ChangeNotifier] e
/// [InheritedNotifier], ambos parte del SDK de Flutter.
class AppState extends ChangeNotifier {
  AppState(this.resources) {
    lifecycleHistory.add(
      LifecycleEvent(state: lastLifecycleState, timestamp: DateTime.now()),
    );
  }

  final List<StudyResource> resources;

  final Set<String> favoriteIds = <String>{};
  final Set<String> completedIds = <String>{};

  ResourceCategory? selectedCategory;
  String searchText = '';

  String? openResourceId;

  AppLifecycleState lastLifecycleState = AppLifecycleState.resumed;
  final List<LifecycleEvent> lifecycleHistory = [];

  static const int _maxHistory = 8;

  StudyResource resourceById(String id) =>
      resources.firstWhere((r) => r.id == id);

  List<StudyResource> get filteredResources {
    final query = searchText.trim().toLowerCase();
    return resources.where((resource) {
      final matchesCategory =
          selectedCategory == null || resource.category == selectedCategory;
      if (!matchesCategory) return false;
      if (query.isEmpty) return true;
      return resource.title.toLowerCase().contains(query) ||
          resource.category.label.toLowerCase().contains(query) ||
          resource.author.toLowerCase().contains(query);
    }).toList(growable: false);
  }

  List<StudyResource> get favoriteResources => resources
      .where((r) => favoriteIds.contains(r.id))
      .toList(growable: false);

  List<StudyResource> get completedResources => resources
      .where((r) => completedIds.contains(r.id))
      .toList(growable: false);

  int get totalCount => resources.length;
  int get favoritesCount => favoriteIds.length;
  int get completedCount => completedIds.length;
  int get pendingCount => totalCount - completedCount;

  double get completionPercent =>
      totalCount == 0 ? 0 : completedCount / totalCount;

  List<CategorySummary> get categorySummaries {
    return ResourceCategory.values.map((category) {
      final inCategory = resources.where((r) => r.category == category);
      final total = inCategory.length;
      final completed =
          inCategory.where((r) => completedIds.contains(r.id)).length;
      return CategorySummary(
        category: category,
        total: total,
        completed: completed,
      );
    }).toList(growable: false);
  }

  bool isFavorite(String id) => favoriteIds.contains(id);
  bool isCompleted(String id) => completedIds.contains(id);

  void toggleFavorite(String id) {
    if (!favoriteIds.add(id)) {
      favoriteIds.remove(id);
    }
    notifyListeners();
  }

  void toggleCompleted(String id) {
    if (!completedIds.add(id)) {
      completedIds.remove(id);
    }
    notifyListeners();
  }

  void setSearchText(String value) {
    searchText = value;
    notifyListeners();
  }

  void setCategory(ResourceCategory? category) {
    selectedCategory = category;
    notifyListeners();
  }

  void openResource(String id) {
    openResourceId = id;
    notifyListeners();
  }

  void clearOpenResource() {
    openResourceId = null;
    notifyListeners();
  }

  void recordLifecycle(AppLifecycleState state) {
    lastLifecycleState = state;
    lifecycleHistory.insert(
      0,
      LifecycleEvent(state: state, timestamp: DateTime.now()),
    );
    if (lifecycleHistory.length > _maxHistory) {
      lifecycleHistory.removeRange(_maxHistory, lifecycleHistory.length);
    }
    notifyListeners();
  }
}

/// Expone [AppState] a todo el árbol de widgets mediante InheritedNotifier,
/// el mecanismo de propagación de estado incluido en el SDK de Flutter.
class AppStateScope extends InheritedNotifier<AppState> {
  const AppStateScope({
    super.key,
    required AppState state,
    required super.child,
  }) : super(notifier: state);

  static AppState of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<AppStateScope>();
    assert(scope != null, 'No se encontró un AppStateScope en el árbol.');
    return scope!.notifier!;
  }
}
