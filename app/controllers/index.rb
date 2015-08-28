get '/' do
  # Look in app/views/index.erb
	session[:id] = ""
	session[:name] = ""
	session[:message] = ""
	session[:message_type] = ""
  erb :'user/login'
end

post '/' do
	ret = User.authenticate(params[:input_email], params[:input_password])
	if ret.nil?
		session[:message] = "Invalid Username/Password"
		session[:message_type] = "danger"
		redirect to "/"
	end
		session[:id] = ret.id
		session[:name] = ret.name
		session[:message] = "Login Successful"
		session[:message_type] = "success"
		redirect to "/home"
end

get '/home' do
	if session[:name].nil?
		session[:message] = "Forbidden Access"
		session[:message_type] = "danger"
		redirect to "/"
	end
	erb :'property/airbnb_home'
end

get '/sign_up' do
	erb :'user/sign_up'
end

post '/sign_up' do
	ret = User.create(email: params[:sign_up_email], password: params[:sign_up_password], name: params[:sign_up_name])
	session[:name] = ret.name
	session[:message] = "Sign Up Successful"
	session[:message_type] = "success"
	#redirect to "/success"
	erb :'user/success_sign_up'
end