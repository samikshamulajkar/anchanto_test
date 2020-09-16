class Weather < ApplicationRecord

  # scope :filter_by_city, lambda { |city|
  #   where('lower(city) = ?', city.downcase)
  # }

  # scope :filter_by_date, lambda { |date|
  #   where(date: date)
  # }
  
  # scope :sort_by_date, lambda { |sort_params|
  #   sorting_type = sort_params == 'date' ? :asc : :desc
  #   order(date: sorting_type)
  # }

  def temperatures
    super.map(&:to_f) rescue []
  end
end
