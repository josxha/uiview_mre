import 'package:code_assets/code_assets.dart';
import 'package:hooks/hooks.dart';
import 'package:native_toolchain_c/native_toolchain_c.dart';

void main(List<String> args) async {
  await build(args, (input, output) async {
    if (!input.config.buildCodeAssets) return;
    if (input.config.code.targetOS != OS.iOS) return;
    if (input.config.code.linkModePreference == LinkModePreference.static) {
      throw UnsupportedError('Static linking not supported.');
    }

    final builder = CBuilder.library(
      name: 'my_ffi',
      assetName: 'ffi.g.dart',
      sources: ['lib/ffi.g.dart.m'],
      language: Language.objectiveC,
      includes: [],
      flags: ['-fobjc-arc'],
      frameworks: ['Foundation'],
    );

    await builder.run(input: input, output: output);
  });
}
