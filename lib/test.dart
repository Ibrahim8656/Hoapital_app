// // camera_screen.dart
// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'class/cubit/Camira_cubit.dart';
//
// class CameraScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => CameraBloc()..add(CameraEvent.initialize),
//       child: Scaffold(
//         appBar: AppBar(title: Text('Camera')),
//         body: BlocBuilder<CameraBloc, CameraState>(
//           builder: (context, state) {
//             if (state is CameraReady) {
//               return CameraPreview(state.cameras[0] as CameraController);
//             } else {
//               return Center(child: CircularProgressIndicator());
//             }
//           },
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             BlocProvider.of<CameraBloc>(context).add(CameraEvent.capture);
//           },
//           child: Icon(Icons.camera_alt),
//         ),
//       ),
//     );
//   }
// }
