namespace :neo4j do
  def get_environment(args)
    args[:environment] || ENV["RAILS_ENV"] || "development"
  end

  desc "Start Neo4j development and test environments"
  task :start_all do
    Rake::Task["neo4j:start"].invoke("development")
    Rake::Task["neo4j:start"].reenable
    Rake::Task["neo4j:start"].invoke("test")
  end

  desc "Stop Neo4j development and test environments"
  task :stop_all do
    Rake::Task["neo4j:stop"].invoke("development")
    Rake::Task["neo4j:stop"].reenable
    Rake::Task["neo4j:stop"].invoke("test")
  end

  desc "Set up a Neo4j environment"
  task :setup, :environment do |_, args|
    n4j_v = "2.2.0-M01"
    environment = get_environment(args)

    Rake::Task["neo4j:install"].reenable
    Rake::Task["neo4j:install"].invoke("community-#{n4j_v}", environment)

    if environment == "test"
      Rake::Task["neo4j:config"].reenable
      Rake::Task["neo4j:config"].invoke(environment, "7475")
    end

    Rake::Task["neo4j:start"].reenable
    Rake::Task["neo4j:start"].invoke(environment)
  end

  desc "Set up Neo4j development and test environments"
  task :setup_all do
    Rake::Task["neo4j:setup"].invoke("development")
    Rake::Task["neo4j:setup"].reenable
    Rake::Task["neo4j:setup"].invoke("test")
  end

end
