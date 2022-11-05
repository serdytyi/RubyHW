# 1. Необхідно написати гем, який створює метод, який приймає контент 
# і зберігає контент, що передається в .html сторінку (всередину body).
# 2. Опціонально метод можна передавати ім'я файла (якщо не передано – index.html).
# 3. Отримуваний файл має бути валідним (https://validator.w3.org/#validate_by_upload).
# 4. Так само, за умовчанням, у переданому контенті метод повинен різати html і js код.
# Щоб передати код, потрібно передати в метод аргумент bypass_html: true.
# 5. Для гему створити новий репозиторій із довільною назвою (придумайте назву гему).

# create template.html замість body %s і %s 

class Ilona
  def content_saver(body, name = "index.html", bypass_html: false)
    File.open(name, "w") do |f| 
        html = %Q( 
        \<!DOCTYPE html\>
        \<html\>
        \<body\>
        #{body}
        \<\/body\>
        \<\/html\>
        )
      f.write html
    end    
  end
end

Ilona.new.content_saver("<h1>Hello World!<h1>")
Ilona.new.content_saver("<h1>Hello World!<h1>", "frenk.html")