import 'package:flutter/material.dart';

import '../../util/dynamic_size.dart';
import '../../util/enums.dart';

class LoadingWidget extends StatelessWidget {
  final ExecutionState executionState;
  const LoadingWidget({super.key, required this.executionState});

  @override
  Widget build(BuildContext context) {
    if (executionState == ExecutionState.loading) {
      return Container(
        width: width,
        height: height,
        color: Colors.grey.withOpacity(0.1),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return const SizedBox();
  }
}
