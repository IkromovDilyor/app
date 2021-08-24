class BottomNavBarItemModel {
  bool isActive;
  String title;
  String iconPath;
  String activeIconPath;

  BottomNavBarItemModel({
    required this.activeIconPath,
    required this.title,
    required this.iconPath,
    required this.isActive,
  });
}
