class SongsWorker
  require 'csv'
  include Sidekiq::Worker

  def perform(leads_file)
    CSV.foreach(leads_file, headers: true) do |song|
      Customer.create(email: song[0])
    end
  end
end
