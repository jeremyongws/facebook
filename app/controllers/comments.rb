post '/:status_id/comments/new' do
  Comment.create(comment: params[:comment], status_id: params[:status_id], user_id: session[:id])
  redirect to "/feed/#{session[:id]}"
end

get '/:status_id/comment/:comment_id/edit' do
  @comment = Comment.find(params[:comment_id])
  @status = Status.find(params[:status_id])
  erb :edit_comment
end

put '/:status_id/comment/:comment_id/edit' do
  @comment = Comment.find(params[:comment_id])
  @comment.update(comment: params[:comment])
  redirect to "/feed/#{session[:id]}"
end

delete '/comment/:comment_id/edit' do
  @comment = Comment.find(params[:comment_id])
  @comment.destroy
  redirect to "/feed/#{session[:id]}"
end