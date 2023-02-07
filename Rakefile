# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative "config/application"

Rails.application.load_tasks
Rake::Task[:default].prerequisites.clear if Rake::Task.task_defined?(:default)
task :default do
  raise unless system("bin/rubocop -a") &
    system("bin/brakeman") &
    system("bin/erblint --lint-all -a ") &
    system("pnpm lint")
  sh "bin/rails spec"
  sh "bin/rails cucumber"
end
