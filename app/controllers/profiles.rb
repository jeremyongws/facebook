get '/profile/:user_id' do
  @profile = Profile.where(user_id: params[:user_id])[0]
  erb :profile
end

get '/profile/:user_id/edit' do
  @profile = Profile.where(user_id: params[:user_id])[0]
  erb :edit_profile
end

post '/profile/:user_id/edit' do
  @profile = Profile.where(user_id: params[:user_id])[0]
  @profile.update(params[:profile])
  redirect to "/profile/#{params[:user_id]}"
end