class Site::WhoPassedController < SiteController


  def index
    @students = Student.order("id DESC").group_by(&:course)
  end

  
end