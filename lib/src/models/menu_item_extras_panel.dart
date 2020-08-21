class MenuItemExtrasPanelItem {
  MenuItemExtrasPanelItem({this.headerValue, this.collapsedValues, this.isExpanded = false});
  List<MenuExtraItem> collapsedValues;
  String headerValue;
  bool isExpanded = true;
}

class MenuExtraItem {
  double price;
  String name;
  bool isChecked = false;
  MenuExtraItem({this.name, this.price});
}
