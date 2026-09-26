# Working on lita-image-fetcher

`lib/lita/handlers/` contains the image handler and Bing, Google CSE, and Pixabay
adapters. `spec/lita/handlers/` contains RSpec coverage. The gemspec requires Lita
4.6+ and legacy Bundler ~> 1.3; use a compatible isolated Ruby environment.

Install with `bundle install`. `bundle exec rake` runs the RSpec task;
`bundle exec rspec spec/lita/handlers/image_fetcher_spec.rb` selects handler
coverage. No separate lint/typecheck task is declared. Keep providers mocked in
unit tests. Real provider keys and a running Lita adapter are prerequisites for
live testing, not a reason to print configuration or send chat messages.

## Completing changes

Follow existing patterns and carry authorized work through the relevant checks,
repairing failures caused by the change. Choose routine implementation details
directly; ask only when missing information materially changes scope or outcome.
For documentation-only edits, check the diff, referenced paths, and command
accuracy rather than starting application runtimes. If a prerequisite blocks a
check, report the exact blocker and continue independent authorized work. Close
with changed paths, checks actually run and results, and remaining unverified
behavior; distinguish commands inspected from commands executed.
