class Pet
  attr_accessor :mood, :health_scale, :hunger_scale, :toilet_patient, :alertness, :asleep, :alertness,:comfort
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
  end

  def greetings
      puts "Привіт,покидьки,я #{@name} - #{@animal_type},  забирайтесь звідси!"
      @alertness +=1
  end

  def feed
      puts " Дайте побільше корму, #{@name} полюбляє ласувати! "
      @mood +=5
      @toilet_patient -=3
      @hunger_scale -=3
      some_time
  end    

  def dog_bit_door
      puts "Хм...який цікавий смак...Але #{@name} подобається!"
      @alertness +=1
      @health_scale -=1
      some_time
  end

  def eat_dessert
      puts "  боже,дайте мені ще одну штуку... краще усю пачку!!! "
      @hunger_scale -=2
      some_time
  end

  def toilet_outside
      puts "Сонце світить,вітер віє,собаче життя чудове..."
      @toilet_patient +=3
      some_time
  end

  def toilet_inside
      puts "Сталась невеличка аварія,схоже доведеться замінити новенький паркет..."
      @toilet_patient +=2
      some_time
  end

  def someone_comes_in
      puts "Ти хто в чорта такий,я ж тебе не знаю...!!!ГАВГАВГАВ"
      @alertness +=5
      some_time
  end

  def training
      puts "знову???....Добре, я ще раз принесу цю гілку,але це вже востаннє..."
      @mood -=5
      @health_scale +=2
      @comfort -=2
      some_time
  end

  def play_with_toy
      puts "супер, це моя улюблена іграааашка...Нікому її не віддам!!!"
      @mood +=2
      @alertness +=4
      some_time
  end

  def grab_paw
      puts "забери свої пальці,інакше я тебе просто розірву на шматки...!!! "
      @mood -=2
      @alertness +=2
      some_time
  end

  def go_swimming
      puts " чооооорт,я ж боюююсь водии.... ніііііі...Вам про це не казали??? "
      @mood -=3
      @health_scale -=2
      @comfort -=3
      some_time
  end

  def sniff_with_friend
      puts " привіт,друже,чим тебе сьогодні годували, що бачив? "
      @alertness =+1
      some_time
  end

  def pick_food_away
      case @mood
      when 0...3
          puts "тобі кінець,хазяїне, ГАВ-ГАВ-ГАВ-ГАВ!!!"
      when 4...6
          puts " останнє попередження - ГАВ-ГАВ-ГАВ-ГАВ!!!"
      when 7...10
          puts "кхе,кхе ГАВ-ГАВ-ГАВ-ГАВ!!!"    
      else
          puts "я все рівно тебе їм"  
      end
  end

  def walk
      puts "вухууууу, пішли в парк, там сьогодні усі мої друзі !!!"
  end

  def go_rest
      puts " хууууух, мабуть піду я вже відпочивати..." 
      @alertness -=5
      @comfort +=5
      @asleep = true
  end

  def help
      p 'Привіт, ви граєте з злою собацюрою - Френком.Крок вліво чи вправо - відкушені пальці. Маєте питання - пишіть на antonserdytyi@gmail.com '
  end
  
  def menu 
    puts "\n======================Menu========================"
    p '1. \'greetings\' привітайтесь з малим'
    p '2. \'feed\' спробуйте вдало нагодувати цього розбійника'
    p '3. \'dog_bit_door\' Френк намагатиметься прогризти двері!'
    p '4. \'eat_dessert\' Френк отримає вкусняху'
    p '5. \'toilet_outside\' Відправте собацюру напудити на вулицю!'
    p '6. \'toilet_inside\' Влаштуйте "аварію" в квартирі...'
    p '7. \'someone_comes_in\' Хтось прийшов до Френка додому '
    p '8. \'training\' Потренуйте малого!'
    p '9. \'play_with_toy\' Пограйтесь з улюбленою іграшкою Ф'
    p '10. \'grab_paw\' Френку, дай лапу! '
    p '11. \'go_swimming\' Поплаваємо разом? '
    p '12. \'sniff_with_friend\' Понюхаємось з іншими чотирилапими? '
    p '13. \'pick_food_away\' Спробуйте забрати в Ф їжу '
    p '14. \'walk\' Вигуляйте Френка! '
    p '15. \'go_rest\' Відправте цуцика відпочити '
    p '16. \'help\' Підтримка'
    p '17. \'exit\' Повернутись до консолі'
    p '=================================================='
  end
  private

  def some_time
    @toilet_patient -= 3
    @hunger_scale +=3
    if @toilet_patient == 0
      puts " #{@name} напудив здоровенну калюжу..."
    end
    if @hunger_scale == 10
        puts " #{@name} помирає...Вже настали часи Голодомору?"
    end
    if @alertness >= 10
        puts " #{@name} вже більше схожий на бійця ЗСУ,ніж на миле цуценя.Постійні візити та тренування зробили його злим та агресивним"
    end
    if @health_scale == 0
        puts " #{@name} помирає...Втопили,замордували.заганяли? Ці слова будуть написані на його надгробку."
    end
  end

end

pet = Pet.new 'Френк'

loop do
  pet.menu
  command = gets.chomp
  return if command.include?('exit')
  
  pet.public_send(command)
rescue NoMethodError
  next puts "wrong command try again" 
end