class Image
  def initialize(matrix) # to call this method, we use .new()
    @matrix = matrix # matrix is an array of arrays...
  end

  def find_coordinates()  #find the 1, make an array, save the pairs to it
    pair_list = []
    @matrix.each_with_index do |row, r|
      row.each_with_index do |val, c|
        if @matrix[r][c] == 1
          pair_list.push [r, c]
        end
      end
    end
    return pair_list
  end


  def blur(distance) #rename transform because that's what blur is doing
    pair_list = find_coordinates()

    pair_list.each do |r, c|

      0.upto(distance) do |x| 
        0.upto(distance - x) do |y|
      
          @matrix[r - x][c - y] = 1 unless r - x < 0 || c - y < 0  #left
          @matrix[r + x][c - y] = 1 unless r + x > @matrix.length || c - y < 0 #down
          @matrix[r - x][c + y] = 1 unless r - x < 0 || c + y >= @matrix[0].length #top right
          @matrix[r + x][c + y] = 1 unless r + x >= @matrix.length || c + y >= @matrix[0].length  #bottom right
        end
      end
    end
  end

 

  def output_image()    #show the value of the array elements in neat little rows & columns
    @matrix.each do |row|
      row.each do |c|
        print c
        print ' '
      end
      puts
    end
  end
end



one_pixel_image = Image.new(
  [
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 1, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0]
  ]
)


##one_pixel_image.output_image()
one_pixel_image.blur(3)
one_pixel_image.output_image()


