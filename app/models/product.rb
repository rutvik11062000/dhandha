class Product < ApplicationRecord
  # set default value when reading as title
  def name
    title
  end
end
