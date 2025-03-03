import 'package:flutter_riverpod/flutter_riverpod.dart';

class IconEditorState {
  final String selectedTab;
  final String iconText;

  IconEditorState({required this.selectedTab, required this.iconText});

  IconEditorState copyWith({String? selectedTab, String? iconText}) {
    return IconEditorState(
        selectedTab: selectedTab ?? this.selectedTab,
        iconText: iconText ?? this.iconText);
  }

  factory IconEditorState.initial() {
    return IconEditorState(selectedTab: 'Text', iconText: 'Aa');
  }
}

class IconEditorNotifier extends Notifier<IconEditorState> {
  @override
  IconEditorState build() {
    return IconEditorState.initial();
  }

  void setSelectedTab(String selectedTab) {
    state = state.copyWith(selectedTab: selectedTab);
  }

  void setIconText(String iconText) {
    state = state.copyWith(iconText: iconText);
  }
}

final iconEditorProvider =
    NotifierProvider<IconEditorNotifier, IconEditorState>(
        () => IconEditorNotifier());
