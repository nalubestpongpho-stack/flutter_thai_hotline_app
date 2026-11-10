import 'package:flutter/material.dart';

import 'hotline_data.dart';
import 'hotline_list_ui.dart';

class EmgUI extends StatelessWidget {
  const EmgUI({super.key});

  @override
  Widget build(BuildContext context) =>
      HotlineListUI(category: emergencyCategory);
}
