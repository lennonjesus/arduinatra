require 'sinatra'
require "serialport"

#params for serial port
port_str = "/dev/ttyACM0"
baud_rate = 9600
data_bits = 8
stop_bits = 1
parity = SerialPort::NONE

sp = nil



set :haml, :format => :html5



get '/' do
  haml :index
end

get '/connect' do
  sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)
  redirect back
end

get '/disconnect' do
  sp.close()
  sp = nil
  redirect back
end

get '/led/turn_on' do
  sp.putc 1
  redirect back
end

get '/led/turn_off' do
  sp.putc 0
  redirect back
end

get '/test' do
  arduino_connected?
end
