def random
  rand(2)
  # indice == 0 ? '.' : '*'
end

def create_matriz(a, b)
  new_matriz = Array.new(a) { Array.new(b) {  } }

  print "Generacion 1 \n"
  creating_matriz = Array.new(a) { Array.new(b) { random } }
  creating_matriz.each do |a|
    print a
    print "\n"
  end

 creating_matriz.each_with_index.map do |array, index_array|
    array.each_with_index.map do |celula, index_celula|
      right = []
      left = []
      top = []
      bottom = []
      
      #Check left to right
      if index_celula.zero?
        right.push(array[index_celula + 1])
      elsif index_celula == (array.length - 1)
        left.push(array[index_celula - 1])
      else
        left.push(array[index_celula - 1])
        right.push(array[index_celula + 1])
      end

      #Check top
      if index_array.zero?
        'none'
      elsif index_celula.zero?
        top.push(creating_matriz[index_array - 1][index_celula], creating_matriz[index_array - 1][index_celula + 1])
      elsif index_celula == array.length - 1
        top.push(creating_matriz[index_array - 1][index_celula - 1], creating_matriz[index_array - 1][index_celula])
      else
        top.push(creating_matriz[index_array - 1][index_celula - 1], creating_matriz[index_array - 1][index_celula],
          creating_matriz[index_array - 1][index_celula + 1])
      end
      

      #Check bottom
      if index_array == (creating_matriz.length - 1)
        'none'
      elsif index_celula.zero?
        bottom.push(creating_matriz[index_array + 1][index_celula], creating_matriz[index_array + 1][index_celula + 1])
      elsif index_celula == (array.length - 1)
        bottom.push(creating_matriz[index_array + 1][index_celula - 1], creating_matriz[index_array + 1][index_celula])
      else
        bottom.push(creating_matriz[index_array + 1][index_celula - 1],creating_matriz[index_array + 1][index_celula], creating_matriz[index_array + 1][index_celula + 1])
      end
      
      neighboors=left+right+top+bottom
      total_neighboors = neighboors.sum

      #Rules implementation
      if celula==1
        if  total_neighboors<2 || total_neighboors>3
          new_matriz[index_array][index_celula]=0
        elsif total_neighboors==2 || total_neighboors==3
          new_matriz[index_array][index_celula]=1
        end
      else #celula==0
        if total_neighboors==3
          new_matriz[index_array][index_celula]=1
        else
          new_matriz[index_array][index_celula]=0
        end
      end
      
    end
    
  end

  #Print new matriz (Generation 2)s
  print "Generacion 2 \n"
  new_matriz.each do |a|
    print a
    print "\n"
  end
   
end

create_matriz(4, 4)