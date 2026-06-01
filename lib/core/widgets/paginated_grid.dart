import 'package:flutter/material.dart';

class PaginatedGrid<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(T item) itemBuilder;

  const PaginatedGrid({
    super.key,
    required this.items,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350, // adjust based on your AppCard height
      child: PageView.builder(
        itemCount: (items.length / 3).ceil(),
        itemBuilder: (context, pageIndex) {
          final start = pageIndex * 3;
          final end =
              (start + 3 > items.length) ? items.length : start + 3;

          final pageItems = items.sublist(start, end);

          return Row(
            children: List.generate(3, (index) {
              if (index >= pageItems.length) {
                return const Expanded(child: SizedBox());
              }

              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: index != 2 ? 20 : 0, // spacing between cards
                  ),
                  child: itemBuilder(pageItems[index]),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}