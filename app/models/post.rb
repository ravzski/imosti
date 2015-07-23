class Post < ActiveRecord::Base

  default_scope {order("id DESC")}



  attr_accessible :category,:content,:is_active,:excerpt,:slug,:posted_date,:title,:photo


  has_attached_file :photo, {
    :default_url => "/assets/missing.png",
    :path => "assets/:id/:basename.:extension"
  }

  validates_attachment :photo, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  #after_create :generate_slug

  def is_active?
    self.is_active == 1 ? "Active" : "Inactive"
  end

  def get_category
    case self.category
    when 1
      "Offerings"
    when 2
      "News"
    when 3
      "Consulting"
    when 4
      "Certification"
    when 5
      "Sliders"
    when 6
      "Philosopy"
    when 7
      "What We Do"
    when 8
      "Who We Are"
    when 9
      "Footer Left"
    when 10
      "Core Values"
    end
  end

  private
  def generate_slug
    if self.slug.blank? && self.title.present?
      self.slug = self.id.to_s+"-"+self.title.parameterize
      self.save
    end
  end



end