get '/feed/:user_id' do
  @status_objects = Status.where(user_id: params[:user_id])
  erb :feed
end

post '/:user_id/status/new' do
  @status = Status.create(user_id: params[:user_id], status: params[:status])
  @tags = params[:status].scan(/#\w+/).flatten
  @tags.each do |tag|
    if Tag.find_by_tag(tag) != nil
      @tag = Tag.find_by_tag(tag)
    else
      @tag = Tag.create(tag: tag)
    end
    StatusesTag.create(tag_id: @tag.id, status_id: @status.id)
  end
  redirect to "/feed/#{params[:user_id]}"
end

#tag by statuses
get '/tag/:tag_id/statuses' do
  @tag = Tag.find(params[:tag_id])
  @statuses = @tag.statuses
  erb :statuses_by_tag
end

#
get '/:user_id/status/:status_id/edit' do
  @status = Status.find(params[:status_id])
  @user = User.find(params[:user_id])
  erb :statuses_update
end

post '/:user_id/status/:status_id/edit' do
  @status = Status.find(params[:status_id])
  @user = User.find(params[:user_id])
  @status.update(params[:profile])
  redirect to "/feed/#{params[:user_id]}"
end

get '/like/:status_id' do
  Like.create(user_id: session[:id], status_id: params[:status_id])
  redirect to "/feed/#{session[:id]}"
end