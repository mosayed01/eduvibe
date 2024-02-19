import 'package:flutter/material.dart';

MaterialPageRoute<T> wrapWithPage<T>({
  required Widget child,
  bool maintainState = true,
  bool fullscreenDialog = false,
  bool allowSnapshotting = true,
}) {
  return MaterialPageRoute(
    fullscreenDialog: fullscreenDialog,
    maintainState: maintainState,
    allowSnapshotting: allowSnapshotting,
    builder: (_) => child,
  );
}
