class PostsController < ApplicationController
  def index
    page = params[:page] || 1
    page_size = params[:page_size] && Integer(params[:page_size]) <= 100 ? params[:page_size] : 10

    posts = Post.page(page).per(page_size)
    render json: { posts: posts, total_pages: posts.total_pages, current_page: posts.current_page,
                   prev_page: posts.prev_page, next_page: posts.next_page, out_of_range: posts.out_of_range? }
  end
end
