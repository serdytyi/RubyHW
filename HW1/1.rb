# Дан целочисленный массив. Необходимо вывести вначале его элементы с четными индексами, а затем - с нечетными.	
arr = (1..10).map { |el| rand(100) * el }
p "initial arr: #{arr}"
p 'even numbers'
arr.each_with_index { |el, i| puts el if i.even? }
p 'odd numbers'
arr.each_with_index { |el, i| puts el if i.odd? }
