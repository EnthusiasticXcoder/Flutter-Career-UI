import 'package:flutter/material.dart';
import 'package:fluttercareerui/constants/constants.dart';
import 'package:fluttercareerui/models/blog_model.dart';

class TabularView extends StatelessWidget {
  const TabularView({
    super.key,
    required this.item,
  });
  final ContantItem item;

  @override
  Widget build(BuildContext context) {
    bool colour = true;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 8.0),
      child: Table(
        border: TableBorder.all(color: Colors.black),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: item.contant.map<TableRow>(
          (row) {
            colour = !colour;
            return TableRow(
                decoration: BoxDecoration(
                  color: (colour) ? Colors.grey.shade300 : Colors.black12,
                ),
                children: row
                    .map<TableCell>(
                      (cell) => TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '$cell',
                            textAlign: TextAlign.justify,
                            style: tagStyles[item.tag],
                          ),
                        ),
                      ),
                    )
                    .toList());
          },
        ).toList(),
      ),
    );
  }
}
