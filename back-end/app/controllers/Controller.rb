class Controller 

    def initialize(env)
        @req = Rack::Request.new(env)
        @path = @req.path 
        @data = JSON.parse @req.body.read
        @verb = env["REQUEST_METHOD"]
        send(@verb.downcase)
    end
#C
    def post
        
    end  
#R
    def get 
        
    end  

#U 
    def patch 
    
    end
#D      
    def delete 
    
    end  

end