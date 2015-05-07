class ReviewsController < ApplicationController
	 http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy
def create
    @article = Article.find(params[:article_id])
    @review = @article.reviews.create(review_params)
    redirect_to article_path(@article)
  end
 def destroy
    @article = Article.find(params[:article_id])
    @review = @article.reviews.find(params[:id])
    @review.destroy
    redirect_to article_path(@article)
  end
  #destroy 动作先查找当前文章，然后在 @article.comments 集合中找到对应的评论，将其从数据库中删掉，最后转向显示文章的页面。
  private
    def review_params
      params.require(:review).permit(:reviewer, :body)
    end
end
