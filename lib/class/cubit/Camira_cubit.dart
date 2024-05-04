// // camera_bloc.dart
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:camera/camera.dart';
//
// enum CameraEvent { initialize, capture }
//
// class CameraBloc extends Bloc<CameraEvent, CameraState> {
//   CameraBloc() : super(CameraInitial());
//
//   @override
//   Stream<CameraState> mapEventToState(CameraEvent event) async* {
//     if (event == CameraEvent.initialize) {
//       try {
//         List<CameraDescription> cameras = await availableCameras();
//         yield CameraReady(cameras);
//       } catch (_) {
//         yield CameraError();
//       }
//     } else if (event == CameraEvent.capture) {
//       // Implement capturing logic here
//       yield ImageCaptured();
//     }
//   }
// }
//
// abstract class CameraState {}
//
// class CameraInitial extends CameraState {}
//
// class CameraReady extends CameraState {
//   final List<CameraDescription> cameras;
//   CameraReady(this.cameras);
// }
//
// class CameraError extends CameraState {}
//
// class ImageCaptured extends CameraState {}
