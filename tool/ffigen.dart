import 'dart:io';
import 'package:ffigen/ffigen.dart';

void main(List<String> args) {
  final packageRoot = Platform.script.resolve('../');

  final generator = FfiGenerator(
    output: Output(dartFile: packageRoot.resolve('lib/ffi.g.dart')),
    headers: Headers(
      entryPoints: [packageRoot.resolve('ios/Runner/MyProtocol.h')],
      compilerOptions: [
        '-isysroot',
        '/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk',
      ],
    ),
    objectiveC: ObjectiveC(
      protocols: Protocols(
        include: Declarations.includeSet({'MyProtocol', 'MyProtocol2'}),
      ),
    ),
  );
  generator.generate();
}
