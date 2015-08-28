post '/add_property' do
  p "run again"
  @details = params[:new]
  @details[:user_id] = session[:id]
  @tags = params[:tag]

  #@tag = params[:tag]
  arr = []
  @new_property = Property.create(@details)

  arr = @tags.split(", ")
  arr.each do |tag|
    @current_tags = Tag.find_or_create_by(tag_name: tag)
    @new_property.tags << @current_tags
  end
  redirect '/home'
end

get '/advertisement' do
  # Look in app/views/index.erb
  erb :'property/manage_advertisement'
end
