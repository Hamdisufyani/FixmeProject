import 'package:flutter/material.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/dropdown/gf_multiselect.dart';
import 'package:getwidget/types/gf_checkbox_type.dart';
class MenuItemList extends StatelessWidget {
  const MenuItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return      Container(
     // height: 50,
     // width: 350,
      margin: EdgeInsets.all(10),
      child: GFMultiSelect(
        items: [
          'FC Barcelona',
          'Real Madrid',
          'Villareal',
          'Manchester City'
        ],
        onSelect: (value) {
          print('selected $value ');
        },
        dropdownTitleTileText: 'Installation ',
        dropdownTitleTileMargin: const EdgeInsets.only(
            top: 22, left: 18, right: 18, bottom: 5),
        dropdownTitleTilePadding: EdgeInsets.all(10),
        dropdownUnderlineBorder:
        const BorderSide(color: Colors.transparent, width: 2),
        dropdownTitleTileBorder:
        Border.all(color: Colors.grey, width: 1),
        dropdownTitleTileBorderRadius: BorderRadius.circular(5),
        expandedIcon: const Icon(
          Icons.keyboard_arrow_down,
          color: Colors.black54,
        ),
        collapsedIcon: const Icon(
          Icons.keyboard_arrow_up,
          color: Colors.black54,
        ),
        submitButton: Text('OK'),
        cancelButton: Text('Cancel'),
        dropdownTitleTileTextStyle:
        const TextStyle(fontSize: 14, color: Colors.black54),
        padding: const EdgeInsets.all(6),
        margin: const EdgeInsets.all(6),
        type: GFCheckboxType.basic,
        activeBgColor: GFColors.SUCCESS,
        activeBorderColor: GFColors.SUCCESS,
        inactiveBorderColor: Colors.grey,
      ),
    );
  }
}
