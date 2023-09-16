import 'package:intl/intl.dart';

class Fighter {
  final String objectID;
  final String name;
  final String description;
  final dynamic rate;
  final String price;
  final String downloads;
  final String imageURL;
  final String universe;

  Fighter(
      {required this.objectID,
      required this.name,
      required this.description,
      required this.rate,
      required this.price,
      required this.downloads,
      required this.imageURL,
      required this.universe});

  String get downloadsFormatted {
    NumberFormat numberFormat = NumberFormat("#,##,000", "en_US");
    return numberFormat.format(downloadsToDouble);
  }

  double get downloadsToDouble {
    return double.tryParse(downloads) ?? 0.0;
  }

  double get rateToDouble {
    return double.tryParse(rate.toString()) ?? 0.0;
  }
}
