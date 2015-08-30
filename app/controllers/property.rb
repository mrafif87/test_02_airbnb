post '/add_property' do
  @details = params[:new]
  @details[:user_id] = session[:id]
  @tag = params[:tag]

  #@tag = params[:tag]
  arr = []
  @new_property = Property.create(@details)

  arr = @tag.split(",")
  arr.each do |tag|
    @current_tags = Tag.find_or_create_by(tag_name: tag)
    @new_property.tags << @current_tags
  end
  redirect '/manage'
end

post '/edit_update' do
  @details = params[:new]
  #@details[:user_id] = session[:id]
  @tag = params[:tag]
  @delete_tag = PropertyTag.find_by_property_id(session[:edit_id])

  until (@delete_tag.nil?) do
    p "TRY"
    @delete_tag.delete
    @delete_tag = PropertyTag.find_by_property_id(session[:edit_id])
  end

  arr = []
  @property_to_edit = Property.find(session[:edit_id])
  @property_to_edit.update(@details)

  arr = @tag.split(",")
  arr.each do |tag|
    @current_tags = Tag.find_or_create_by(tag_name: tag)
    @property_to_edit.tags << @current_tags
  end
  redirect '/manage'
end

get '/manage' do
  # Look in app/views/index.erb
  @edit = false
  @all_properties = Property.where(user_id: session[:id])
  erb :'property/manage_advertisement'
end

get '/edit/:id' do
  session[:edit_id] = params[:id]
  @edit = true
  @all_properties = Property.where(user_id: session[:id])
  @property_to_edit = Property.find(session[:edit_id])
  p @property_to_edit
  erb :'property/manage_advertisement'
end

get '/edit_cancel' do
  #@property_to_edit = nil
  redirect '/manage'
end

get '/delete/:id' do
  @property_delete = Property.delete(params[:id])
  redirect '/manage'
end