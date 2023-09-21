namespace :pnpm do
  desc "Install JavaScript dependencies using pnpm"
  task :install do
    unless system("pnpm install")
      raise "pnpm-rails: Command install failed, ensure pnpm is installed"
    end
  end

  desc "Build JavaScript bundle"
  build_task = task :build do
    unless system("pnpm run build")
      raise "pnpm-rails: Command build failed, ensure `pnpm run build` runs without errors"
    end
  end

  build_task.prereqs << :install unless ENV["SKIP_PNPM_INSTALL"]

  desc "Remove JavaScript builds"
  task :clobber do
    rm_rf Dir["app/assets/builds/**/[^.]*.{js,js.map}"], verbose: false
  end
end

unless ENV["SKIP_JS_BUILD"]
  if Rake::Task.task_defined?("assets:precompile")
    Rake::Task["assets:precompile"].enhance(["pnpm:build"])
  end

  if Rake::Task.task_defined?("test:prepare")
    Rake::Task["test:prepare"].enhance(["pnpm:build"])
  elsif Rake::Task.task_defined?("spec:prepare")
    Rake::Task["spec:prepare"].enhance(["pnpm:build"])
  elsif Rake::Task.task_defined?("db:test:prepare")
    Rake::Task["db:test:prepare"].enhance(["pnpm:build"])
  end
end

if Rake::Task.task_defined?("assets:clobber")
  Rake::Task["assets:clobber"].enhance(["pnpm:clobber"])
end