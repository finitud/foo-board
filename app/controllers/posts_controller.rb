class PostsController < ApplicationController
  before_filter :correct_hash, only: [:edit, :update, :destroy]

  # GET /posts
  def index
    @posts = Post.all
  end

  # GET /posts/1
  def show
    @post = Post.find(params[:id])
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to posts_url, notice: 'Post successfully created'
    else
      render action: "new"
    end
  end

  # PUT /posts/1
  def update
    @post = Post.find(params[:id])

      if @post.update_attributes(params[:post])
        redirect_to @post, notice: 'Post successfully updated'
      else
        render action: "edit"
      end
  end

  # DELETE /posts/1
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url
  end

  private

  def correct_hash
    # ignore these actions while we implement post hashing
    redirect_to root_path
  end
end
