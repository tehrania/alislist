get '/' do
  erb :index
end

get '/create_post' do 
  erb :create_post
end

post '/category' do 
 
  category_id = params[:post][:category_id] 
  Post.create(params[:post])
  redirect to ("/category/#{params[:post][:category_id]}")
end 

get '/category/:id' do   
  p params
  category = Category.find(params[:id])
  @posts = category.posts 
  erb :category
end
