
import 'dart:async';

import 'package:flutter/material.dart';

mixin PaginationScrollStateMixin<T extends StatefulWidget> on State<T> {
  late final ScrollController mixinScrollController;

  /// Adds a listener to [mixinScrollController] and call [loadNextPage] when it at edge
  ///
  ///  scrollController.addListener(() {
  ///       if (scrollController.position.atEdge) {
  ///         if (scrollController.position.pixels != 0) {
  ///            function(context);
  ///        }
  ///       }
  void setScrollController(Function() function) {
    mixinScrollController.addListener(() {
      if (mixinScrollController.position.atEdge) {
        if (mixinScrollController.position.pixels != 0) {
          function();
        }
      }
    });
  }

  /// Jump at end of scrolling after short delay when new page is loading.
  ///
  ///     Timer(const Duration(milliseconds: 30), () {
  ///       scrollController.jumpTo(scrollController.position.maxScrollExtent);
  ///     });

  void jumpDownWhenLoading() {
    Timer(const Duration(milliseconds: 30), () {
      mixinScrollController.jumpTo(mixinScrollController.position.maxScrollExtent);
    });
  }
}
