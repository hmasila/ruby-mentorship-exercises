def minesweeper(bombs, rows, cols)
  # Step 1: Turn it into a usable board
  field = Array.new(rows) { Array.new(cols, 0) }

  incrementer =->(cell) { cell == -1 ? cell : cell+=1 }

# Step 2: Working on mine(n,n)
  bombs.each do |bomb|
    row_i = bomb[0]
    col_i = bomb[1]
    field[row_i][col_i] = -1

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
          elsif j > 1 && j < cols - 1
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
          elsif j === cols - 1
            # Top row
            if (i === 0)
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
  end

  # Step 3: Turn the "mines" into 1s
  field
end# minesweeper()

p minesweeper([[0,0], [0,1]], 3, 4)
