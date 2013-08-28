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


post '/post' do 
 
  params[:post][:secret_url] = SecureRandom.base64
  post = Post.create(params[:post])
  #post_id = params[:post][:id]
  redirect to ("/success/#{post.id}")
end 

get '/post/:id' do   
 
  @post= Post.find(params[:id])
  erb :post
end

get '/post/edit/:secret_url' do   
 
  @post= Post.find_by_secret_url(params[:secret_url])
  erb :post
end

get '/success/:post_id' do 
  @post = Post.find(params[:post_id])
  erb :success
end

