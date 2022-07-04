# frozen_string_literal: true

namespace :dev do
  desc "Sample data for local development environment"
  task prime: "db:setup" do
    Rake::Task["dev:seed"].execute
  end

  desc "Sample data for local development environment"
  task seed: :environment do
    include TikTok

    Dir.glob(Rails.root.join("db/seeds/dev/*.rb")).each do | file|
      tik
      require file
      puts "#{file.delte_prefix('/srv/db/seeds')} (#{tok}s)"
    end
  end

  namespace :seed do
    Dir[Rails.root.join("db/seeds/dev/*.rb")].each do | filename|
      task_name = File.basename(filename, ".*").split(".")[0]
      desc "Seed #{task_name}, based on the file with the same name in 'db/seeds/dev/*.rb'"
      task task_name.to_sym => :environment do
        load(filename) if File.exist?(filename)
      end
    end
  end
end
