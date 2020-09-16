require 'pry'

# find_item_by_name_in_collection should be able to take the string name of a particular item 
# and a collection of items like we have above. 
# It should then iterate over the collection and check the value of :item in each nested hash. 
# If a match is found, the method should return that entire hash.
# If an item is not found, find_item_by_name_in_collection should return nil.

def find_item_by_name_in_collection(name, collection)
  collection.each do |hash|
    if hash[:item] == name
      return hash
    end
  end
  nil
end


# consolidate_cart should take in a 'cart', an array of hashes of individual items 
# and return a new array of hashes, but with each item containing a quantity. 
# Consult README for inputs and outputs
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
# adds a count of one to each item when there are no duplicates
# increments count when there are multiple items

def consolidate_cart(cart)
  new_array = []
  cart.each do |item_hash|                                               # iterate into array to access hashes
    item_name = item_hash[:item]                                         # item_hash[:item] will access the item name key
    find_item = find_item_by_name_in_collection(item_name, new_array)
    if find_item                                                         # if item is true/already present in new_array
      find_item[:count] += 1                                             # add 1 to the count
    else                                                                 # else,
      new_array << {                                                     # push hash with :key => values into new_array
      :item => item_name,
      :price => item_hash[:price],
      :clearance => item_hash[:clearance],
      :count => 1
      }
    end
  end
  new_array
end

