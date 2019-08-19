class Image

    def initialize(grid) 
         @grid = grid
    end
    
    def output_image
        @grid.each do |row| 
             puts row.join(" ")
        end
    end
    
    def blur 
        arrayx = []
        arrayy = []
        @grid.each_with_index do |row, index_y|  
            subarray = @grid[index_y]
            subarray.each_index do |x|
                if subarray[x] == 1
                arrayx << x 
                arrayy << index_y 
                end
            end
        end
        arrayy.each_with_index do |data, count| 
            if @grid[0].length - 1 > arrayx[count] 
                @grid[arrayy[count]][arrayx[count] + 1] = 1 
            end
            if @grid.length - 1 > arrayy[count]
                @grid[arrayy[count] + 1][arrayx[count]] = 1
            end
            if arrayy[count] > 0 
                @grid[arrayy[count] - 1][arrayx[count]] = 1 
            end
            if arrayx[count] > 0
                @grid[arrayy[count]][arrayx[count] - 1] = 1 
            end
        end
        puts @grid.length
    end
end
    
image = Image.new([
    [0, 0, 0, 0],
    [0, 1, 0, 0],
    [0, 0, 0, 1],
    [0, 0, 0, 0]
])
image.output_image
puts 
image.blur
puts
image.output_image
