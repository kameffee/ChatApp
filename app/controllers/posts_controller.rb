class PostsController < ApplicationController
  def index
    @posts = [
      "やっほー",
      "こんにちは"
    ]
  end
end
