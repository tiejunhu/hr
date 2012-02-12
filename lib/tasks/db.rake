namespace :db do
  
  # def update_human_id
  #   print "Updating humen id...\n"
  #   col = Human.where("id > 10").order("board_date")
  #   id = Human.where("id <= 10").order("id").last.id
  #   col.each do |h|
  #     id = id + 1
  #     update_sql = "update humen set id = #{id} where id = '#{h.id}';"
  #     ActiveRecord::Base.connection.execute(update_sql)
  #   end
  #   print "Updating seq...\n"
  #   id = Human.order("id").last.id
  #   update_seq_sql = "update sqlite_sequence set seq = #{id} where name = 'humen';"
  #   ActiveRecord::Base.connection.execute(update_seq_sql)
  # end
  
  desc "This loads the development data."
  task :seed => :environment do
    require 'active_record/fixtures'
    Dir.glob(Rails.root + 'db/fixtures/*.yml').each do |file|
      base_name = File.basename(file, '.*')
      print "Loading #{base_name}...\n"
      ActiveRecord::Fixtures.create_fixtures('db/fixtures', base_name)
    end
    print "Rebuilding dept tree...\n"
    Dept.rebuild!
  end

  desc "This drops the db, builds the db, and seeds the data."
  task :reseed => [:environment, 'db:reset', 'db:seed']
end