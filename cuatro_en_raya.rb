
puts "Bienvenido al Cuatro en raya construido por @Jenaru"


def crear_grid(fil,col)

  grid =[]
  for i in (1..fil)
    fila = []
    for j in (1..col)
      fila.append(0)
    end
    grid.append(fila)
  end

  return grid

end

def mostrar_grid(grid)
  print [1,2,3,4,5,6,7]
  print "\n"
  for i in (0..grid.length)
  
    print grid[i]
    print "\n"
  end
end

# Pido nombres a jugadores

puts "Ingresa tu nombre JUGADOR A"

jugador_A=gets.chomp
puts "Bienvenido '#{jugador_A}'"

puts "Ingresa tu nombre JUGADOR B"

jugador_B=gets.chomp
puts "Bienvenido '#{jugador_B}'"


fil = 6; col = 7
grid = crear_grid(fil, col)


def empate(grid)
 
  (0..6).each do |n|
     
        if grid[0][n] == 0
       
          return false
        end
      end
      return true
end

def check_columna(grid,i,j)
array =[]
  grid.each do |celda|
    #puts "celda #{celda[i]}"
    array.push(celda[i])
   
  end
  if array[5] == array[4] and array[4] == array[3] and array[3] == array[2] 
    puts "Has ganado haciendo una columna"
    return true
  else
  
    return false
    
  end
#puts "array #{array}"
end



def check_fila(grid,i,j,fil)

  if (grid[fil-1-j][i] == grid[fil-1-j][i+1] and grid[fil-1-j][i+1] == grid[fil-1-j][i+2] and grid[fil-1-j][i+2] == grid[fil-1-j][i+3]) or (grid[fil-1-j][i] == grid[fil-1-j][i-1] and grid[fil-1-j][i-1] == grid[fil-1-j][i-2] and grid[fil-1-j][i-2] == grid[fil-1-j][i-3])
    puts "Has ganado haciendo una fila"
    return true
  else
   
    return false
  end

  puts " grid #{grid[fil-1-j][i]} / #{grid[fil-1-j][i+1]}"
end



def check_diagonal(grid,fil,i,j)
     
 
    if (grid[fil-1-j][i] == grid[fil-2-j][i+1] and grid[fil-2-j][i+1] == grid[fil-3-j][i+2] and grid[fil-3-j][i+2] == grid[fil-4-j][i+3]) or 
      (grid[fil-1-j][i] == grid[(fil-1-j)+1][i-1] and grid[(fil-1-j)+1][i-1] == grid[(fil-1-j)+2][i-2] and grid[(fil-1-j)+2][i-2] == grid[(fil-1-j)+3][i-3])
     
      puts "Has hecho una Diagonal"
      return true
    else 
    
      return false

    end
  
  
end

def si_gana(grid,i,j,fil,col)
  

      if check_fila(grid,i,j,fil) == true
        return true
        
      end
      if check_columna(grid,i,j) == true
        return true
          
      end
      if j > 2 and check_diagonal(grid,fil,i,j) == true
        return true
      end
      puts "Sigue jugando..."
  
end 
 





turno = 1

jugador_activo = jugador_A 

while true
  mostrar_grid(grid)
  elige_columna = puts "Elije una columna '#{jugador_activo}'"

  i=gets.chomp.to_i - 1


 
  for j in (0..grid.length)
    if grid[fil-1-j][i] == 0
      grid[fil-1-j][i] = turno
      break
    end

  end

  if si_gana(grid,i,j,fil,col)
  
    puts "Ganador: #{jugador_activo}"
    puts "Gracias por jugar"
    break
  end

  if empate(grid)
  puts "Empate"
    break
  end
  if (turno == 1)
 
    turno = 2 
    jugador_activo = jugador_B
  
    
  else
    
    turno = 1
    jugador_activo = jugador_A
  
    
  end

end
  
mostrar_grid(grid)






