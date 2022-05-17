class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  
  #READ
  get '/tasks' do
    tasks = Task.all
    tasks.to_json
  end

  get '/tasks/superhero' do
    superhero_tasks = List.first.tasks
    superhero_tasks.to_json
  end

  get '/tasks/alterego' do
    alterego_tasks = List.second.tasks
    alterego_tasks.to_json
  end

  #CREATE
  post '/tasks' do
    new_task = Task.create(name:params[name], list_id:params[:list_id], complete:params[:complete])
  end
  
  #UPDATE
  patch '/tasks/:id' do
    task = Task.find(params[:id])
    task.update(
      complete: params[:complete]
    )
    task.to_json
  end

  #DELETE
  delete '/tasks/:id' do
    task = Task.find(params[:id])
    task.destroy
    task.to_json
  end

end
