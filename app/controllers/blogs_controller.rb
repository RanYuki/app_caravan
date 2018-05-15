class BlogsController < ApplicationController
  def index  #記事を全件取得
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new #投稿を表示
  	@blog = Blog.new
  end

  def create #投稿を保存
    @blog = Blog.new(blog_params) #blogインスタンスを定義＋ストロングパラメータを使用
    @blog.save
    redirect_to blogs_path
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    blog = Blog.find(params[:id])
    blog.update(blog_params)
    redirect_to blog_path(blog)
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path
  end

  private

  def blog_params
    	params.require(:blog).permit(:title, :category, :body)
  end
end
