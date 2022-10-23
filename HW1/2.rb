# Дан целочисленный массив. Необходимо вывести вначале его элементы с нечетными индексами, а затем - четными.																									
arr = (1..10).map { |el| rand(100) * el }
p "initial arr: #{arr}"
p 'odd numbers'
arr.each_with_index { |el, i| puts el if i.odd? }
p 'even numbers'
arr.each_with_index { |el, i| puts el if i.even? }
