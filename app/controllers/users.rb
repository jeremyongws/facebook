enable :sessions

post '/login' do
  if User.authenticate(params[:username], params[:password]) != nil
    user = User.find_by(username: params[:username])
    # "session_id = " << session[:session_id]
    session[:id] = user.id
    session[:username] = user.username
    # byebug
    redirect to("/profile/#{user.id}")
  else
    redirect to('/')
  end
end

get '/users/signup' do
  erb :signup
end

post '/users/signup' do
  @user = User.new(username: params[:username], password: params[:password])
  if @user.save
    Profile.create(user_id: @user.id, name: params[:name], age: params[:age], description: params[:description])
    redirect to "/profile/#{@user.id}"
  else
    redirect to "/"
  end
end
