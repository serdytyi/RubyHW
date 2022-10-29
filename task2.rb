class Pet
  attr_accessor :mood, :health_scale, :hunger_scale, :toilet_patient, :alertness, :asleep
  attr_writer  :name
  attr_reader :animal_type

  def initialize(name)
      @name = name
      @animal_type = ' собака'
      @health_scale = 10
      @mood = 2
      @asleep = false 
      @hunger_scale = 10 
      @toilet_patient = 0 
      @alertness = 3
      @comfort = 5
      @food_likes = ['meat', 'candy', 'cake']
  end

  def greetings
      puts "Привіт,покидьки,я #{@name} - #{@animal_type},  забирайтесь звідси!"
  end

  def feed(type = 'coffee')
      p ' Дайте побільше корму, ' + @name + ' полюбляє ласувати! '
      @mood +=5
      if @food_likes.include?(type)
        p 'thanks that is my favorite food'
        @mood =+ 10 
      end
      @toilet_patient +=4
      @hunger_scale +=3
      @toilet_pat
  end

  def dog_bit_door
      p '  ' + @name + ' полюбляє ласувати! '
      @alertness +=1
      @health_scale -=1
      some_time
  end

  def eat_dessert
        p ' Дайте побільше корму, ' + @name + ' полюбляє ласувати! '
  end

  def toiletOutside
      p ' Дайте побільше корму, ' + @name + ' полюбляє ласувати! '
  end

  def toiletInside
      p ' Дайте побільше корму, ' + @name + ' полюбляє ласувати! '
  end

  def someoneComesIn
      p ' Дайте побільше корму, ' + @name + ' полюбляє ласувати! '
  end

  def training
      p ' Дайте побільше корму, ' + @name + ' полюбляє ласувати! '
  end

  def playWithToy
      p ' Привіт,покидьки,я ' + @name + ' -' + @animal_type + ', забирайтесь звідси!'
  end

  def grab_Paw
      p ' забери свої пальці,інакше я тебе просто розірву на шматки...!!! '
  end

  def go_swimming
      p ' забери свої пальці,інакше я тебе просто розірву на шматки...!!! '
  end

  def sniff_with_friend
      p ' забери свої пальці,інакше я тебе просто розірву на шматки...!!! '
  end

  def pick_food_away
      case @mood
      when 0...3
          p ' тобі кінець,хазяїне ' + 'ГАВ-ГАВ-ГАВ-ГАВ!!!'
      when 4...6
          p ' останнє попередження ' + 'ГАВ-ГАВ-ГАВ-ГАВ!!!'
      when 7...10
          p ' УРРРРРРРРРР,кхе ' + 'ГАВ-ГАВ-ГАВ-ГАВ!!!'    
      else
          p 'я все рівно тебе їм'  
      end
  end

  def walk
      p ' Ви вигулюєте ' + @name 
  end

  def go_rest
      p @name + ' відправляється на відпочинок '
  end

  def help
      p 'Привіт, ви граєте з злою собацюрою - Френком.
      Ви можете : пограти з ним - pet.playWithToy '
  end
  
  def menu 
    puts "\n======================Menu========================"
    p '1. \'walk\' go let me go outside'
    p '2. \'help\' to lern how to use this program'
    p '3. \'exit\' to return to console'
    p '=================================================='
  end
  private

  def some_time
    @toilet_patient -= 3
    @hunger_scale +=3
    if @toilet_patient == 0
      p @name + 'напудив здоровенну калюжу...' 
    end
  end

end

pet = Pet.new 'Турбо Френкє'

loop do
  pet.menu
  command = gets.chomp
  return if command.include?('exit')
  
  pet.public_send(command)
rescue NoMethodError
  next p 'wrong command try again' 
end

  # case command
  # when 'exit'
  #   return
  # else
  #   begin
  #     pet.public_send(command)
  #   rescue NoMethodError
  #     next p 'wrong command try again' 
  #   end
  # end

# help ( метод з текстом )
# menu (буде виводитись кожен раз після ткожного кроку циклу ( після виконання якогось методу))
