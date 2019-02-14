class PostsController < ApplicationController
    



    def create
        if post = Post.new(post_params)
        post.save
        redirect_to post_path(post.id)
        flash[:notice] = "Book was successfully updated."
      end
    end


    def index
        @post = Post.new
       
        @posts = Post.all
    end


    def show
        @post = Post.find(params[:id])
    end


    def edit
        @post = Post.find(params[:id])
    end


    def update
        post = Post.find(params[:id])
        if post.update(post_params)
        redirect_to post_path(post.id)
        flash[:notice] = "Book was successfully updated."
         else  render("posts")
        end
    end



    def destroy

        post = Post.find(params[:id])
        
        if post.destroy
        redirect_to posts_path
         flash[:notice] = "Book was successfully destroyed."
         else  render("posts")
         end
    end








 
    private
    def post_params
        params.require(:post).permit(:title, :body, :image)
    end
end