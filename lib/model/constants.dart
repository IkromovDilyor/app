import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ibilling/model/translations/locale_keys.g.dart';
import 'package:ibilling/pages/add_constract.dart';
import 'package:ibilling/pages/add_invoce_page.dart';

import 'package:ibilling/pages/feed_page.dart';
import 'package:ibilling/pages/history_page.dart';
import 'package:ibilling/pages/profile_page.dart';
import 'package:ibilling/pages/saved_page.dart';



import 'bottom_nav_bar_item_model.dart';

class Constants {
  static List<Widget> pagesList({bool? isAddContractPage}) {
    return [
      ContractPage(),
      HistoryPage(),
      isAddContractPage!? AddConstractPage(): AddInvoicePage(),
      SavedPage(),
      ProfilePage(),

    ];
  }

  static List<Widget> pages = [];
  static List<BottomNavBarItemModel> bottomNavBarItems = [
    BottomNavBarItemModel(
        activeIconPath: 'assets/icons/nav_bar_contract_selected.svg',
        title: LocaleKeys.contract,
        iconPath: 'assets/icons/nav_bar_contract_unselected.svg',
        isActive: true),
    BottomNavBarItemModel(
        activeIconPath: 'assets/icons/history_icon_select.svg',
        title: LocaleKeys.history,
        iconPath: 'assets/icons/history_icon_unselect.svg',
        isActive: false),
    BottomNavBarItemModel(
        activeIconPath: 'assets/icons/uload_icon_select.svg',
        title: LocaleKeys.new_contract,
        iconPath: 'assets/icons/uload_icon_unselect.svg',
        isActive: false),
    BottomNavBarItemModel(
        activeIconPath: 'assets/icons/saved_icon_select.svg',
        title:LocaleKeys.saved,
        iconPath: 'assets/icons/saved_icon_unselect.svg',
        isActive: false),
    BottomNavBarItemModel(
        activeIconPath: 'assets/icons/profile_icon_select.svg',
        title: LocaleKeys.profile,
        iconPath: 'assets/icons/profile_icon_unselect.svg',
        isActive: false),
  ];
}
