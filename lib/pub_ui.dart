import 'package:flutter/material.dart';

import 'hotline_data.dart';
import 'hotline_list_ui.dart';

class PubUI extends StatelessWidget {
  const PubUI({super.key});

  @override
  Widget build(BuildContext context) =>
      HotlineListUI(category: utilityCategory);
}
