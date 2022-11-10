arr = [621, 445, 147, 159, 430, 222, 482, 44, 194, 522, 652, 494, 14, 126, 532, 387, 441, 471, 337, 446, 18, 36, 202, 574, 556, 458, 16, 139, 222, 220, 107, 82, 264, 366, 501, 319, 314, 430, 55, 336]
p arr.length
p arr.reverse
p arr.max
p arr.min
p arr.sort
p arr.sort { |a, b| b <=> a }
p arr.delete_if(&:odd?)
p arr.select { |el| el % 3 == 0 }
p arr.uniq
p arr.map { |el| el/10.0 }
p arr.map { |el| el.positive? && el<=255 ? el.chr : el }
# – змінити місцями мінімальний і максимальний елементи масиву;
min = arr.min
arr[arr.index(min)] = arr.max
arr[arr.index(arr.max)] = min
p arr[arr.index(arr.min)-1] 
# – необхідно знайти три найменших елементи.
p arr.sort.first(3)