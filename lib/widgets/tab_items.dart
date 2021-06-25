import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum TabItem { Anasayfa, Sahiplen, Kayiplar }

class TabItemData {
  final String title;
  final IconData icon;

  TabItemData(this.title, this.icon);

  static Map<TabItem, TabItemData> tumTablar = {
    TabItem.Anasayfa: TabItemData("Anasayfa", Icons.home),
    TabItem.Sahiplen: TabItemData("Sahiplen", Icons.emoji_people),
    TabItem.Kayiplar: TabItemData("Kayıplar", Icons.pets),
  };
}
