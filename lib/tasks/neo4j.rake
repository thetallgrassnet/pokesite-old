namespace :neo4j do
  desc "Start all Neo4j environments"
  task :start_all do
    Rake::Task["neo4j:start"].invoke("development")
    Rake::Task["neo4j:start"].reenable
    Rake::Task["neo4j:start"].invoke("test")
  end

  desc "Stop all Neo4j environments"
  task :stop_all do
    Rake::Task["neo4j:stop"].invoke("development")
    Rake::Task["neo4j:stop"].reenable
    Rake::Task["neo4j:stop"].invoke("test")
  end

end
