# Rest API for the person class
require 'rubygems'
require 'json'
require 'sinatra'
require 'directory'

class Api
  before /.*/ do
    content_type :json
  end

  get '/person/get' do
    puts "In Person.get"
    dir = Directory.new
    dir.seed
    person =dir.get(params[:id].to_i)
    person.to_json
  end

  get '/person/list' do
    dir = Directory.new
    dir.seed

    output = ''
    dir.list.each_value { |person|
      output = output + person.to_json
    }
    output
  end
end
