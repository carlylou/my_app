#articles控制器的方法（动作）们

class ArticlesController < ApplicationController
http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]#要使用这个身份认证机制，
#需要在 ArticlesController 控制器的顶部调用 http_basic_authenticate_with 方法。除了 index 和 show 动作，访问其他动作都要通过认证，
	def new
		@article = Article.new
	end
	def destroy
  @article = Article.find(params[:id])
  @article.destroy
 
  redirect_to articles_path
end
	def update
  @article = Article.find(params[:id])
 
  if @article.update(article_params)
    redirect_to @article
  else
    render 'edit'
  end
end
	def edit
     @article = Article.find(params[:id])
    end

	def create
    @article = Article.new(article_params)
       if @article.save#返回一个布尔类型的值
        redirect_to @article#重新刷新页面
        #在 create 动作中，如果保存失败，调用的是 render 方法而不是 redirect_to 方法。用 render 方法才能在保存失败后把 @article 对象传给 new 动作的视图。渲染操作和表单提交在同一次请求中完成；而 redirect_to 会让浏览器发起一次新请求。
        else
        render 'new'
        end

    end

 def show
    @article = Article.find(params[:id])
    end

def index
  @articles = Article.all
end





private#这个是私有方法，别人用不了。这以下不能随便写方法了，不然就变成私有了。！！！！！！
  def article_params
    params.require(:article).permit(:title, :text)
  end

end
