class QueueDataScrapping
  include Sidekiq::Worker

  def perform
    Plant.all.each do |plant|
      if plant.expiration_date <  1.week.ago
        PlantsSpider.process(plant.url )
      end
    end
  end
end