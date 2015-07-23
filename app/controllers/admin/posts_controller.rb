class Admin::PostsController < AdminController


  def index
    @posts = Post.where(:category=>params[:category])
    @post = Post.new
    lookups
  end

  def create


    @post = Post.new(params[:post])
    if @post.save
       redirect_to "/admin/posts?category=#{@post.category}"
    else
       redirect_to "/admin/posts?category=#{@post.category}"
    end

  end

  def edit
    @post = Post.find(params[:id])
    lookups
  end

  def new
    @post = Post.new
    lookups
  end
  
  def update

 
    @post = Post.find(params[:id])

    if @post.update_attributes(params[:post])
       redirect_to "/admin/posts?category=#{@post.category}"
    else
       redirect_to "/admin/posts?category=#{@post.category}"
    end


  end


  def destroy
    @post = Post.find(params[:id])
    if @post
      Post.destroy(params[:id]) 
      redirect_to "/admin/posts?category=#{@post.category}"
    end
  end

  private
  def lookups
    @status = [['Active','1'],['Inactive','0']]
  end

end