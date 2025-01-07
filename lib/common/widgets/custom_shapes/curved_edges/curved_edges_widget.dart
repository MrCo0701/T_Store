
import 'package:flutter/material.dart';

import 'TCustomCurvedEdges.dart';

class TCurvedEdgeWidget extends StatelessWidget {
  const TCurvedEdgeWidget({
    super.key, this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath( // * ==> Cat 1 widget theo y muon
        clipper: TCustomCurvedEdges(),
        child: child
    );
  }
}
