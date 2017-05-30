require 'rubygems'
require 'sinatra'
require 'slim'
require 'rubygems'
require 'data_mapper'
DataMapper.setup(:default, 'sqlite:db/db1.db')
DataMapper::Logger.new($stdout, :debug)

# Alta, baja y modificacion de los elementos en la lista.
# Cada item debe tener un titulo, un cuerpo, una fecha de vencimiento,
# un campo para indicar que se ha completado, y una fecha de ultima modificacion.
# En lo posible, mantener la logica dentro de una misma vista.

class List
  include DataMapper::Resource
  property :id, Serial
  property :id, Serial
  property :id, Serial
  property :id, Serial
  property :id, Serial
  property :id, Serial
  property :id, Serial
  property :id, Serial
  property :nombre, String
  has n, :tasks

end
class Task
  include DataMapper::Resource
  property :id, Serial
  property :titulo, String
  property :cuerpo, Text
  property :fechavencimieto, Date
  property :completada, Boolean
  property :fechamodificacion, Date
  belongs_to :list

end
List.auto_upgrade!
Task.auto_upgrade!

get '/' do
#çsdkjhsvckl
#dslfkh
end

get '/lists/index' do
  @lists = List.all
  slim :lists
end

get '/lists/ver/:id' do
  @list = List.get(params[:id])
  slim :list
end  property :id, Serial
  property :id, Serial
  property :id, Serial
  property :id, Serial
  property :id, Serial
  property :id, Serial
  property :id, Serial
  property :id, Serial
  property :id, Serial
  property :id, Serial


get '/lists/nuevo' do
  slim :list_nuevo
end

post '/lists/nuevo' do
  # crea una nueva instancia de Post con los parametros obtenidos del formulario
  list = List.new(nombre: params[:nombre])
  if list.save
    redirect "/lists/ver/#{list.id}"
  else
    # si es false, el post no se guardo correctamente
    p 'Algo salio malo'
  end
end

post '/lists/tasks/:list/nuevo' do
  # Buscamos el post al cual le queremos asociar el comentario, notese que lo pasamos como parametro
  list = List.get(params[:list])

  task = Task.new(titulo: params[:titulo], cuerpo: params[:cuerpo], fechavencimieto: params[:fechavencimieto], completada: params[:completada], fechamodificacion: params[:fechamodificacion])
  list.tasks << task  property :id, Serial
  property :id, Serial
  property :id, Serial
  property :id, Serial
  property :id, Serial
  property :id, Serial
  property :id, Serial
  property :id, Serial
  property :id, Serial
  property :id, Serial
  property :id, Serial
  property :id, Serial
  property :id, Serial
  property :id, Serial

  list.save

  redirect "/lists/ver/#{list.id}"
end

get '/task_nueva/:id' do
  @list = List.get(params[:id])
  slim :task_nueva
end

get '/task_editar/:lista/:tarea' do
  @list = List.get(params[:lista])
  @task = Task.get(params[:tarea])
  slim :task_editar
end

post '/task_editar/:lista' do
  list = List.get(params[:lista])
  task = Task.update(titulo: params[:titulo], cuerpo: params[:cuerpo], fechavencimieto: params[:fechavencimieto], completada: params[:completada], fechamodificacion: params[:fechamodificacion])
  list.save

  redirect "/lists/ver/#{list.id}"
end

get '/task_borrar/:lista/:tarea' do
  list = List.get(params[:lista])
  task= Task.destroy(id: params[:tarea])
  list.save
  redirect "/lists/ver/#{list.id}"
end
