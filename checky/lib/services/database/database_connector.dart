import 'package:supabase_flutter/supabase_flutter.dart';

initialiseDatabase() async {
  await Supabase.initialize(
      url: 'https://utsfcrktsuruvqcqfvpz.supabase.co',
      anonKey:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InV0c2Zjcmt0c3VydXZxY3FmdnB6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTMzMDU3MzksImV4cCI6MjAwODg4MTczOX0.rvpazmJEAX5enEYq2rgATBcTeQImlNSGBmSfhpvM8b8");
}
