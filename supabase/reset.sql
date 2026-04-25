-- Week 5 News App reset script
-- Run this in Supabase SQL Editor before class/demo.

truncate table public.articles restart identity;

insert into public.articles (title, summary, author, published_at) values
('Flutter 3.29 Released', 'Flutter 3.29 introduces performance and tooling improvements for faster developer feedback loops.', 'Tech Desk', now() - interval '1 day'),
('Riverpod Simplifies Async State', 'Students can use FutureProvider to model loading, error, and data states with minimal boilerplate.', 'Mobile Mentor', now() - interval '2 days'),
('Supabase for Classroom Backends', 'Supabase offers quick setup for tables, policies, and REST APIs, making it ideal for learning projects.', 'Backend Weekly', now() - interval '3 days'),
('Understanding JSON Parsing in Dart', 'Using fromJson factories helps map API responses into strongly typed models for safer UI rendering.', 'Dart Digest', now() - interval '4 days'),
('Async/Await Best Practices', 'Handle network calls with async/await and surface errors clearly to improve app resilience.', 'Code Academy', now() - interval '5 days'),
('HTTP Package Basics', 'The http package provides a straightforward API for GET and POST requests in Flutter applications.', 'API Journal', now() - interval '6 days'),
('Designing a Clean List UI', 'A simple ListView with title, summary, author, and date is enough for a clear news-reading experience.', 'UI Notes', now() - interval '7 days'),
('Build, Analyze, Test Workflow', 'Running flutter analyze and flutter test before demo day helps avoid surprises in class.', 'Dev Workflow', now() - interval '8 days');
