part of 'resource.dart';

// class WText extends StatelessWidget {
//   final String data;

//   const WText(this.data, {Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final resource = Resource();
//     return ValueListenableBuilder(
//       valueListenable: resource.listenable(keys: [data]),
//       builder: (_, __, widget) {
//         // print('object: $data');
//         return Text(resource.getResource(data) ?? data);
//       },
//     );
//   }
// }
