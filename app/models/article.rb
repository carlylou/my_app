class Article < ActiveRecord::Base
	#has_many :comments ,dependent: :destroy#如果删除一篇文章，也要删除文章中的评论，不然这些评论会占用数据库空间。在 Rails 中可以在关联中指定 dependent 选项达到这一目的。
	has_many :reviews,dependent: :destroy#如果删除一篇文章，也要删除文章中的评论，不然这些评论会占用数据库空间。在 Rails 中可以在关联中指定 dependent 选项达到这一目的。
	 validates :title, presence: true,
                    length: { minimum: 5 }#检查错误的语句们





end
