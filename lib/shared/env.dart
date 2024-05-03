import 'package:envied_flutter/envied.dart';

part 'env.g.dart';

@Envied(path: '.env.secret')
final class Env {
  @EnviedField(varName: 'supabase_public_key')
  static const String supabasePublicKey = _Env.supabasePublicKey;
}
