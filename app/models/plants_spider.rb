class PlantsSpider < Kimurai::Base
  @name= 'plants_spider'
  @enginer = :selenium_chrome

  def self.process(url)
    @start_urls = [url]
    self.crawl!
  end

  def  parse(response, url: ,data: {})
    response.css('.centerColAlign').each do |plant|
      item={}
      item[:url] = url
      item[:title] = plant.css('span#productTitle').inner_text
      item[:description] = plant.css('span.a-list-item').inner_text
      item[:size] = plant.css('.dimension-text').css('span.a-text-bold')&.text
      item[:rating] =  plant.css('span#acrCustomerReviewText').inner_text
      Plant.where(item).first_or_create
    end
  end
end 