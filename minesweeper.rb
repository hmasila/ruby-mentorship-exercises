def minesweeper(bombs, rows, cols)
  # Step 1: Turn it into a usable board
  field = Array.new(rows) { Array.new(cols, 0) }

  # Step 1.1: set bomb locations to static -1
  bombs.each do |bomb|
    row_i = bomb[0]
    col_i = bomb[1]
    field[row_i][col_i] = -1
  end
  # Step 1.2: setup an incremi
  incrementer =->(cell) { cell == -1 ? cell : cell+=1 }

  # Step 2: Working on mine(n,n)
  0.upto(rows-1) do |i|
    row = field[i];
    0.upto(cols-1) do |j|
      cell = field[i][j]
      # Step 2.1: Check for mines and increment cells around it.
      if cell == -1

        # Handles leftmost columns.
        if j == 0
          # Top row
          if i == 0
            field[i][j+1]    = incrementer[field[i][j+1]]
            field[i+1][j]    = incrementer[field[i+1][j]]
            field[i+1][j+1]  = incrementer[field[i+1][j+1]]
          # Middle rows
          elsif i > 0 && i < rows - 1
            field[i-1][j]    = incrementer[field[i-1][j]]
            field[i-1][j+1]  = incrementer[field[i-1][j+1]]
            field[i][j+1]    = incrementer[field[i][j+1]]
            field[i+1][j]    = incrementer[field[i+1][j]]
            field[i+1][j+1]  = incrementer[field[i+1][j+1]]
          # Bottom row
          else # (i === field.length-1)
            field[i][j+1]    = incrementer[field[i][j+1]]
            field[i-1][j]    = incrementer[field[i-1][j]]
            field[i-1][j+1]  = incrementer[field[i-1][j+1]]
          end
          # leftmost

        # Handles middlemost columns
        elsif j > 0 && j < cols - 1
          # Top row
          if (i === 0)
            field[i][j-1]    = incrementer[field[i][j-1]]
            field[i][j+1]    = incrementer[field[i][j+1]]
            field[i+1][j-1]  = incrementer[field[i+1][j-1]]
            field[i+1][j]    = incrementer[field[i+1][j]]
            field[i+1][j+1]  = incrementer[field[i+1][j+1]]
          # Middle rows
          elsif i > 0 && i < rows - 1
            field[i-1][j-1]  = incrementer[field[i-1][j-1]]
            field[i-1][j]    = incrementer[field[i-1][j]]
            field[i-1][j+1]  = incrementer[field[i-1][j+1]]
            field[i][j-1]    = incrementer[field[i][j-1]]
            field[i][j+1]    = incrementer[field[i][j+1]]
            field[i+1][j-1]  = incrementer[field[i+1][j-1]]
            field[i+1][j]    = incrementer[field[i+1][j]]
            field[i+1][j+1]  = incrementer[field[i+1][j+1]]
          # Bottom row
          else # (i === field.length-1)
            field[i-1][j-1]  = incrementer[field[i-1][j-1]]
            field[i-1][j]    = incrementer[field[i-1][j]]
            field[i-1][j+1]  = incrementer[field[i-1][j+1]]
            field[i][j-1]    = incrementer[field[i][j-1]]
            field[i][j+1]    = incrementer[field[i][j+1]]
          end
          # middlemost

        # Handles rightmost columns
        elsif j == cols - 1
          # Top row
          if i == 0
            field[i][j-1]    = incrementer[field[i][j-1]]
            field[i+1][j-1]  = incrementer[field[i+1][j-1]]
            field[i+1][j]    = incrementer[field[i+1][j]]
          # Middle rows
          elsif (i > 0 && i < rows - 1)
            field[i-1][j-1]  = incrementer[field[i-1][j-1]]
            field[i-1][j]    = incrementer[field[i-1][j]]
            field[i][j-1]    = incrementer[field[i][j-1]]
            field[i+1][j-1]  = incrementer[field[i+1][j-1]]
            field[i+1][j]    = incrementer[field[i+1][j]]
          # Bottom row
          else # (i === rows-1) 
            field[i-1][j-1]  = incrementer[field[i-1][j-1]]
            field[i-1][j]    = incrementer[field[i-1][j]]
            field[i][j-1]    = incrementer[field[i][j-1]]
          end
        end # rightmost

      end # End of if cell
    end  # j
  end # i

  # Step 3: Turn the "mines" into 1s
  field
end# minesweeper()

def mine_sweeper(bombs, rows, cols)
  field = Array.new(rows) { Array.new(cols, 0) }
  bombs.each do |bomb|
    row_i, col_i = bomb
    field[row_i][col_i] = -1
    (row_i-1).upto(row_i+1) do |i|
      (col_i-1).upto(col_i+1) do |j|
        if(i>=0&&i<rows&&j>=0&&j<cols&&field[i][j]!=-1)
          field[i][j]+=1
        end
      end
    end
  end
  field
end

def minefield(field, cell)
  queue = []
  row, col = cell
  if field[row][col] == 0
    queue << cell
  else
    return field
  end

  while queue.size > 0
    current_i, current_j = queue.shift
    (current_i-1).upto(current_i+1) do |i|
      (current_j-1).upto(current_j+1) do |j|
        if i>=0&&i<field.size&&j>=0&&j<field[0].size
          if field[i][j] == 0
            queue << [i,j]
            field[i][j] = -2
          end
        end
      end
    end
  end
  field
end

p minesweeper([[0,0],[0,1]], 3, 4)
