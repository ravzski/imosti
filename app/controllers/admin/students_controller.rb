class Admin::StudentsController < AdminController


  def index
    @students = Student.order("id")
    @student = Student.new
    lookups
  end

  def create


    @student = Student.new(params[:student])
    if @student.save
       redirect_to "/admin/students"
    else
       redirect_to "/admin/students"
    end

  end

  def edit
    @student = Student.find(params[:id])
    lookups
  end

  def new
    @student = Student.new
    lookups
  end
  
  def update

 
    @student = Student.find(params[:id])

    if @student.update_attributes(params[:student])
       redirect_to "/admin/students"
    else
       redirect_to "/admin/students"
    end


  end


  def destroy
    @student = Student.find(params[:id])
    if @student
      Student.destroy(params[:id]) 
      redirect_to "/admin/students"
    end
  end

  private
  def lookups
    @status = [['Active','1'],['Inactive','0']]
  end

end