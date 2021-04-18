require 'pry'
require 'json'

class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
  
    if req.path.match(/in/)      
      && req.get?
      return [200, { 'Content-Type' => 'application/json' }, [ {tasks: tasks}.to_json ]]
        tasks = Task.all.map do |t| 
        {id: t.id, text: t.text, category: t.category.name}
      end


    elsif req.path.match(/tasks/) && req.post?
         # read and parse the request body & save it to a variable
         # The body will clear if you don't. save it to that variable
      binding.pry
      data = JSON.parse req.body.read
         # create a new instance using the data from the front-end
      task = Task.create(data)
         # send that new instance back in a response to the fron-end
      return [200, { 'Content-Type' => 'application/json' }, [ {:task => task}.to_json ]]
  
     elsif req.delete?
      tasks = req.path
      task = req.path.split("/tasks/").last
      binding.pry

    else
      resp.write "Path Not Found"
    end

    resp.finish
  end

end


  # if req.path.match(/songs/)

  #     song_title = req.path.split("/songs/").last #strip path info to capture just the title
  #     song = @@songs.find{|s| s.title == song_title}

  #     resp.write song.artist
  #   end

