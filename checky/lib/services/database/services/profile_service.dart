import 'package:checky/model/user_profile_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<UserProfile> getUserProfileByUserId(String userId) async {
  final supabase = Supabase.instance.client;
  final Map userProfileJson =
      await supabase.from('user_profile').select().eq("user_id", userId).single();
  return UserProfile.fromJson(userProfileJson);
}