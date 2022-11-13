require 'erb'
require_relative 'pet'

class Program
  attr_reader :request, :path
  attr_accessor :pet

  def call(env)
    @request = Rack::Request.new(env)
    @path = request.path

    response.finish
  end

  def response
    case path
    when '/'
      rack_response('auth.html.erb')
    when '/create_pet'
      name = request.params['name']

      return rack_response_redirect if name.nil? || name.length.zero?

      @pet = Pet.new(name)
      rack_response_redirect('/game')
    when '/game'
      return rack_response_redirect if pet.nil?

      rack_response('game.html.erb')
    when '/feed'
      return rack_response_redirect if pet.nil?

      if pet.died
       rack_response_redirect('/game_over')
      else
        pet.feed
        rack_response('game.html.erb')
      end
    when '/toilet_outside'
       return rack_response_redirect if pet.nil?

       if pet.died
        rack_response_redirect('/game_over')
       else
         pet.toilet_outside
         rack_response('game.html.erb')
       end
    when '/training'
       return rack_response_redirect if pet.nil?

       if pet.died
        rack_response_redirect('/game_over')
       else
         pet.training
         rack_response('game.html.erb')
       end
     when '/play_with_toy'
       return rack_response_redirect if pet.nil?

       if pet.died
        rack_response_redirect('/game_over')
       else
         pet.play_with_toy
         rack_response('game.html.erb')
       end
     when '/walk'
       return rack_response_redirect if pet.nil?

       if pet.died
        rack_response_redirect('/game_over')
       else
         pet.walk
         rack_response('game.html.erb')
       end
     when '/go_rest'
       return rack_response_redirect if pet.nil?

       if pet.died
        rack_response_redirect('/game_over')
       else
         pet.go_rest
         rack_response('game.html.erb')
       end
     when '/sniff_with_friend'
       return rack_response_redirect if pet.nil?

       if pet.died
        rack_response_redirect('/game_over')
       else
         pet.sniff_with_friend
         rack_response('game.html.erb')
       end
    when '/game_over'
      @pet = nil

      rack_response('game_over.html.erb')
    else
      rack_response_redirect
    end
  end

  def rack_response(filename)
    Rack::Response.new(render(filename))
  end

  def render(filename)
    ERB.new(File.read("./views/#{filename}")).result(binding)
  end

  def rack_response_redirect(new_path = '/')
    Rack::Response.new do |response|
      response.redirect(new_path)
    end
  end
end