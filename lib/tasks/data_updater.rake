namespace :data_updater do
  desc 'Load country and currency data'
  task :load_data => :environment do
    # First cleanup existing data
    Country.delete_all
    Currency.delete_all
    UserCountry.delete_all

    # Load data from remote services
    DataUpdater.instance.update

    # To speedup development
    #if Rails.env.development?
    #  [Country, Currency].each do |klass|
    #    klass.all[15..(klass.all.size - 1)].each(&:destroy)
    #  end
    #end

    puts "Generated #{Country.count} countries and #{Currency.count} currencies"
  end
end
