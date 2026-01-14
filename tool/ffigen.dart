import 'dart:io';
import 'package:ffigen/ffigen.dart';

void main(List<String> args) {
  final packageRoot = Platform.script.resolve('../');

  final generator = FfiGenerator(
    output: Output(dartFile: packageRoot.resolve('lib/ffi.g.dart')),
    headers: Headers(
      entryPoints: [packageRoot.resolve('ios/Runner/CustomUIView.h')],
      compilerOptions: [
        '-Fios/.build/MapLibre.xcframework/ios-arm64/',
        '-Iios/.build/MapLibre.xcframework/ios-arm64/MapLibre.framework/Headers',
        '-isysroot',
        '/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk',
      ],
    ),
    objectiveC: ObjectiveC(interfaces: Interfaces(
      include: Declarations.includeSet({'CustomUIView'}),
      includeMember: (declaration, member) => false,
    )),
  );
  generator.generate();
}
