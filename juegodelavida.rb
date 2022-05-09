@grid=[]

def create_life()
    random = Random.new.rand(0..1)
        if (random==0) 
            "."
        else
            "*"
        end
end

def create_matriz (rows,cols)
    @grid = Array.new(rows){ Array.new(cols) {create_life} }
    @grid.map {|a| "#{a.join(" ")}\n" }
end

puts create_matriz(4,8)
