class Landmark < ActiveRecord::Base

  include Slugify
  extend ClassSlugify

  belongs_to :figure
  
end
