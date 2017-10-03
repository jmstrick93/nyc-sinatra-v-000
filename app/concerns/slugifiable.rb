module Slugify
  def slug
    name = self.name
    slug = name.downcase.gsub(' ', '-')
  end
end
