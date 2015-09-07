goods = {
	"batteries" => 34,
	"phones" => 12,
	"books" => 90,
	"pens" => 10
}

# сортировка по ключам
p goods.sort # => [["batteries", 34], ["books", 90], ["pens", 10], ["phones", 12]]

# сортировка по ключам с возвращением хэша
p Hash[goods.sort] # => {"batteries"=>34, "books"=>90, "pens"=>10, "phones"=>12}

# сортировка в обратном направлении
p Hash[goods.sort.reverse] # => {"phones"=>12, "pens"=>10, "books"=>90, "batteries"=>34}

# сортировка хэша по значениям в обратном порядке
p Hash[goods.sort_by { |k, v| v }.reverse] # => {"books"=>90, "batteries"=>34, "phones"=>12, "pens"=>10}
# или
p Hash[goods.sort_by { |k, v| -v }]

# Добавление в хэш с изменением существующих совпадающих ключей
goods.merge!({ "head_phones" => 156, "phones" => 3 })
p goods # => {"batteries"=>34, "phones"=>3, "books"=>90, "pens"=>10, "head_phones"=>156}

# Удаление пары с определенным ключом
goods.tap { |hs| hs.delete("books") } # => {"batteries"=>34, "phones"=>3, "pens"=>10, "head_phones"=>156}
p goods

require 'active_support/core_ext/hash' # подключаем для добавления в хэш новых методов

# исключает переданные ключи
goods.except!("phones", "pens")
p goods # => {"batteries"=>34, "head_phones"=>156}

goods.merge!({ "mice" => 29, "bottles" => 52 })
p goods # => {"batteries"=>34, "head_phones"=>156, "mice"=>29, "bottles"=>52}

# возвращает хэш с указанными ключами
p goods.slice!("batteries", "mice")
p goods # => {"batteries"=>34, "mice"=>29}

p goods.delete("mice") # => 29
p goods # => {"batteries"=>34}

goods.merge!({ "cables" => 435, "cameras" => 32, "resistors" => 143})
# Извлечение хэша без определенного элемента, текущий хэш не меняется
p goods.select{ |item| item != "cables" } # => {"batteries"=>34, "cameras"=>32, "resistors"=>143}
p goods # => {"batteries"=>34, "cables"=>435, "cameras"=>32, "resistors"=>143}

p goods.select { |item| !["cables", "cameras"].include?(item) } # => {"batteries"=>34, "resistors"=>143}
p goods # => {"batteries"=>34, "cables"=>435, "cameras"=>32, "resistors"=>143}

p goods.delete_if{ |k, _| ["resistors", "cables"].include?(k) }
p goods