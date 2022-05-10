def random
  rand(2)
  # indice == 0 ? '.' : '*'
end

def create_matriz(a, b)
  creating_matriz = Array.new(a) { Array.new(b) { random } }
  creating_matriz.each do |a|
    print a
    print "\n"
  end
  new_matriz = creating_matriz
  new_matriz.each_with_index.map do |array, index_array|
    array.each_with_index.map do |celula, index_celula|
      right = []
      left = []
      top = []
      bottom = []

      # index_celula.zero? ? right.push(array[index_celula + 1]) : 'none'
      # index_celula == (array.length - 1) ? left.push(array[index_celula - 1]) : 'none'
      
      if index_celula.zero?
        right.push(array[index_celula + 1])
      elsif index_celula == (array.length - 1)
        left.push(array[index_celula - 1])
      else
        right.push(array[index_celula + 1])
        left.push(array[index_celula - 1])
      end

      if index_array.zero?
        'none'
      elsif index_celula.zero?
        top.push(new_matriz[index_array - 1][index_celula], new_matriz[index_array - 1][index_celula + 1])
      elsif index_celula == array.length - 1
        top.push(new_matriz[index_array - 1][index_celula - 1], new_matriz[index_array - 1][index_celula])
      else
        top.push(new_matriz[index_array - 1][index_celula - 1], new_matriz[index_array - 1][index_celula],
                 new_matriz[index_array - 1][index_celula + 1])
      end

      if index_array == (new_matriz.length - 1)
        'none'
      elsif index_celula.zero?
        bottom.push(new_matriz[index_array + 1][index_celula], new_matriz[index_array + 1][index_celula + 1])
      elsif index_celula == (array.length - 1)
        bottom.push(new_matriz[index_array + 1][index_celula - 1], new_matriz[index_array + 1][index_celula])
      else
        bottom.push(new_matriz[index_array + 1][index_celula - 1],new_matriz[index_array + 1][index_celula], new_matriz[index_array + 1][index_celula + 1])
      end
      
      neighboors
      
    end
  end
  # first_generation = creating_matriz.map { |a| "#{a.join(' ')}\n" }
  # creating_matriz.each_with_index do |value, index|
  #   value.each_with_index do |sub_value, sub_index|
  #     puts "celula #{sub_value} index #{index} sub-indice #{sub_index}"
  #   end
  # end
end

create_matriz(3, 3)