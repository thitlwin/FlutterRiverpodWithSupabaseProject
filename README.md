# Week 5 - APIs & Data (News App)

Flutter POC sample project for students.

## Goal

Fetch real data from Supabase and display a list of articles.

## Topics covered

- HTTP requests with `package:http`
- JSON parsing (`Map<String, dynamic>` -> model)
- Async programming with `async/await`
- Riverpod state management using `FutureProvider`

## Tech stack

- Flutter
- `flutter_riverpod`
- `http`
- `supabase_flutter` (project initialization + Supabase backend)

## Supabase setup

1. Create a project on [Supabase](https://supabase.com/).
2. Open SQL Editor and run `supabase/seed.sql` from this project.
3. The script creates table, RLS policy for anon read, and inserts sample rows.

## Run

```bash
flutter pub get
flutter run \
  --dart-define=SUPABASE_URL=https://YOUR_PROJECT_ID.supabase.co \
  --dart-define=SUPABASE_ANON_KEY=YOUR_SUPABASE_ANON_KEY
```

## Reset demo data (optional)

- Run `supabase/reset.sql` in Supabase SQL Editor before each class/demo.
- This truncates `articles`, resets IDs, and inserts the same 8 sample rows.

## Project structure

- `lib/main.dart`: app start + Supabase initialization + Riverpod `ProviderScope`
- `lib/core/config.dart`: app config from `--dart-define`
- `lib/features/news/data`: article model + HTTP API service
- `lib/features/news/presentation`: Riverpod providers + UI screen
