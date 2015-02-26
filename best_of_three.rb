  def highest_product_of_3(array_of_ints)
    if array_of_ints.size < 3
        puts ("Less than 3 items!")
    end

    # We're going to start at the 3rd item (at index 2)
    # so pre-populate highests and lowests based on the first 2 items.
    # The alternative is starting these as None and checking below if they're set
    # I think this is a little cleaner, but it's debatable.
    highest = [array_of_ints[0], array_of_ints[1]].max
    lowest = [array_of_ints[0], array_of_ints[1]].min

    highest_product_of_two = array_of_ints[0] * array_of_ints[1]
    lowest_product_of_two = array_of_ints[0] * array_of_ints[1]

    # Except this one--we pre-populate it for the first /3/ items.
    # This means in our first pass it'll check against itself, which is fine.
    highest_product_of_three = array_of_ints[0] * array_of_ints[1] * array_of_ints[2]

    # walk through items, starting at index 2
    (array_of_ints[2]...array_of_ints.size - 1).each do |current|

        # do we have a new highest product of 3?
        # it's either the current highest, 
        # or the current times the highest product of two
        # or the current times the lowest product of two
        highest_product_of_three = [highest_product_of_three,
                                    array_of_ints[current] * highest_product_of_two,
                                    array_of_ints[current] * lowest_product_of_two].max

        # do we have a new highest product of two?
        highest_product_of_two = [highest_product_of_two,
                                  current * highest, 
                                  array_of_ints[current] * lowest].max

        # do we have a new lowest product of two?
        lowest_product_of_two =  [lowest_product_of_two, 
                                  current * highest,
                                  array_of_ints[current] * lowest].min

        # do we have a new highest?
        highest = [highest, array_of_ints[current]].max

        # do we have a new lowest?
        lowest = [lowest, array_of_ints[current]].min
    end
   p highest_product_of_three
 end
 
 
 array_of_ints = [1, 10, -5, 1, -100]
 
 highest_product_of_3(array_of_ints)
        
        
        
