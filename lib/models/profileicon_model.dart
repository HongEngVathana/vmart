import 'package:flutter/material.dart';

class ProfileiconModel {
  final String title;
  final IconData icon;

  ProfileiconModel({required this.title, required this.icon});

  factory ProfileiconModel.fromJson(Map<String, dynamic> json) {
    return ProfileiconModel(
      title: json['title'],
      icon: getIconFromString(json['icon']),
    );
  }

  // Convert string icon name to IconData
  static IconData getIconFromString(String iconName) {
    switch (iconName) {
      case 'Icons.account_balance_wallet':
        return Icons.account_balance_wallet;
      case 'Icons.card_giftcard':
        return Icons.card_giftcard;
      case 'Icons.group':
        return Icons.group;
      case 'Icons.location_pin':
        return Icons.location_pin;
      case 'Icons.person':
        return Icons.person;
      case 'Icons.shopping_cart':
        return Icons.shopping_cart;
      case 'Icons.star':
        return Icons.star;
      case 'Icons.notifications':
        return Icons.notifications;
      case 'Icons.help':
        return Icons.help;
      case 'Icons.favorite':
        return Icons.favorite;
      default:
        return Icons.error; // Fallback icon
    }
  }
}
