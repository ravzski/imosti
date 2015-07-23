class Site::HomeController < SiteController


  def index
   @sliders = Post.select("id,photo_file_name,photo_updated_at,title").
   where(:category=>4).where("is_active=1").all

   @galleries = Post.select("id,photo_file_name,photo_updated_at,title").
   where(:category=>1).where("is_active=1")

   @consumables = Post.select("id,photo_file_name,photo_updated_at,title").
   where(:category=>2).where("is_active=1")

   @news = Post.select("content,id,photo_file_name,photo_updated_at,title").
   where(:category=>3).where("is_active=1")

  end

  
end