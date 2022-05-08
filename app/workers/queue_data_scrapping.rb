class QueueDataScrapping
  include Sidekiq::Worker

  def perform
    Plant.all.each do |plant|
      if plant.updated_at <  1.week.ago 
        PlantsSpider.process(plant.url )
      end
    end
  end
end