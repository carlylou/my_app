class CommentsController < ApplicationController

	def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)#调用 article_path(@article) 帮助方法，转向原来的文章页面。这个帮助函数调用 ArticlesController 的 show 动作，渲染 show.html.erb 模板
  end
 
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
