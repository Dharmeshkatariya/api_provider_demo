import 'package:flutter/material.dart';

class ScrollWidget extends StatefulWidget {
  final Widget child;

  const ScrollWidget({super.key, required this.child});

  @override
  State<ScrollWidget> createState() => _ScrollWidgetState();
}

class _ScrollWidgetState extends State<ScrollWidget> {
  final ScrollController _verticalController = ScrollController();
  final ScrollController _horizontalController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool showHorizontalScrollbar = constraints.maxWidth < 1100;

        return Scrollbar(
          thickness: 12.0,
          trackVisibility: true,
          interactive: true,
          controller: _verticalController,
          scrollbarOrientation: ScrollbarOrientation.right,
          thumbVisibility: true,
          child: Scrollbar(
            thickness: 12.0,
            trackVisibility: showHorizontalScrollbar,
            interactive: showHorizontalScrollbar,
            controller: _horizontalController,
            scrollbarOrientation: ScrollbarOrientation.bottom,
            thumbVisibility: showHorizontalScrollbar,
            notificationPredicate: (ScrollNotification notif) => notif.depth == 1,
            child: SingleChildScrollView(
              controller: _verticalController,
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                primary: false,
                controller: _horizontalController,
                scrollDirection: Axis.horizontal,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: constraints.maxWidth,

                  ),
                  child: widget.child,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
