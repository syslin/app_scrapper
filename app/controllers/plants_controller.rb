class PlantsController < ApplicationController
  def index
    @plants = Plant.all
  end

  def scrape
    # url = 'https://hamrobazaar.com/garden-outdoor/jade-plant-dollar-plant-in-kathmandu/301821a0265c43b09be83fe2785db7c7'
    url = 'https://www.amazon.com/Costa-Farms-Money-Tree-10-Inches/dp/B08BX96DW9/ref=zg_bs_3744981_1/145-3528207-0217444?pd_rd_i=B09VL8853S&th=1'
    response = PlantsSpider.process(url)
    if response[:status] == :completed && response[:error].nil?
      flash.now[:notice] = "Successfully scraped url"
    else
      flash.now[:alert] = response[:error]
    end
  rescue StandardError => e
    flash.now[:alert] = "Error: #{e}"
  end
end
