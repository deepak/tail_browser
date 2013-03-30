BUFFER = []

require "eventmachine"
require "eventmachine-tail"
require 'faye'

class BufferReader
  def incoming(message, callback)
    callback.call BUFFER.pop
  end  
end

module TailBrowser  
  class Reader < EventMachine::FileTail
    def initialize(path, startpos=-1)
      super(path, startpos)
      @buffer = BufferedTokenizer.new
    end
        
    def receive_data(data)      
      @buffer.extract(data).each do |line|
        BUFFER << "#{path}: #{line}"
      end
    end
  end
end


EventMachine.run do
  EventMachine::file_tail("production.log", TailBrowser::Reader)
  puts "started"
  
  client = Faye::Client.new('http://0.0.0.0:9001/faye')
  client.publish('/tail', text: BUFFER.pop)
end
