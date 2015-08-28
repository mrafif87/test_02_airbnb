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
  redirect '/advertisement'
end

get '/advertisement' do
  # Look in app/views/index.erb
  @edit = false
  @all_properties = Property.where(user_id: session[:id])
  erb :'property/manage_advertisement'
end

get '/edit/:id' do
  @edit = true
  @all_properties = Property.where(user_id: session[:id])
  @property_to_edit = Property.find(params[:id])
  erb :'property/manage_advertisement'
end
