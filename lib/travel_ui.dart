import 'package:flutter/material.dart';

import 'hotline_data.dart';
import 'hotline_list_ui.dart';

class TravelUI extends StatelessWidget {
  const TravelUI({super.key});

  @override
  Widget build(BuildContext context) => HotlineListUI(category: travelCategory);
}
