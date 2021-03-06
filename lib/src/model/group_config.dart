import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import './group_style.dart';
import './group_sort.dart';

/// Choices configuration
@immutable
class S2GroupConfig with Diagnosticable {

  /// Whether the choices list is grouped or not, based on [S2Choice.group]
  final bool enabled;

  /// Whether the group header displays the choices selector toggle or not, if [enabled] is `true`
  final bool useSelector;

  /// Whether the group header displays the choices counter or not, if [enabled] is `true`
  final bool useCounter;

  /// Comparator function to sort the group keys, if [enabled] is `true`
  ///
  /// Defaults to `null`, and it means disabled the sorting
  final S2GroupSort sortBy;

  /// Configure choices group header theme
  final S2GroupHeaderStyle headerStyle;

  /// Create choices configuration
  const S2GroupConfig({
    this.enabled = false,
    this.useSelector = false,
    this.useCounter = true,
    this.sortBy,
    this.headerStyle = const S2GroupHeaderStyle(),
  }) :
    assert(enabled != null),
    assert(headerStyle != null);

  /// Creates a copy of this [S2GroupConfig] but with
  /// the given fields replaced with the new values.
  S2GroupConfig copyWith({
    bool enabled,
    bool useSelector,
    bool useCounter,
    S2GroupSort sortBy,
    S2GroupHeaderStyle headerStyle,
  }) {
    return S2GroupConfig(
      enabled: enabled ?? this.enabled,
      useSelector: useSelector ?? this.useSelector,
      useCounter: useCounter ?? this.useCounter,
      sortBy: sortBy ?? this.sortBy,
      headerStyle: this.headerStyle?.merge(headerStyle) ?? headerStyle,
    );
  }

  /// Creates a copy of this [S2GroupConfig] but with
  /// the given fields replaced with the new values.
  S2GroupConfig merge(S2GroupConfig other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      enabled: other.enabled,
      useSelector: other.useSelector,
      useCounter: other.useCounter,
      sortBy: other.sortBy,
      headerStyle: other.headerStyle,
    );
  }
}