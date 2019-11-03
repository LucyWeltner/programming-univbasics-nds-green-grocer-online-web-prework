def find_item_by_name_in_collection(name, collection)
  i = 0
  while i < collection.length
    if collection[i][:item] == name
      return collection[i]
    end
    i += 1
  end
return nil
  # Implement me first!
  #
  # Consult README for inputs and outputs
end

def consolidate_cart(cart)
  consolidated_array = []
  i = 0
  j = 0 
  moreThanOne = false
  while i < cart.length
    while j < consolidated_array.length
      if cart[i][:item] == consolidated_array[j][:item]
        consolidated_array[j][:count] += 1
        moreThanOne = true
      end
      j += 1
    end
    if i < cart.length && moreThanOne == false
      consolidated_array << cart[i]
      consolidated_array[-1][:count] = 1
    end
    i += 1
    j = 0
    moreThanOne = false
  end
  consolidated_array
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
end

def apply_coupons(cart, coupons)
  i = 0
  j = 0 
  while i < cart.length do
    while j < coupons.length do
      if cart[i][:item] == coupons[j][:item] && cart[i][:count] >= coupons[j][:num]
        cart << {:item => "#{cart[i][:item]} W/COUPON", :count => coupons[j][:num], :clearance => cart[i][:clearance], :price => coupons[j][:cost]/coupons[j][:num]}
        #if cart[i][:count] == coupons[j][:num]
          #cart[i][:count]
          #cart.delete_at(i)
        #end
        if cart[i][:count] >= coupons[j][:num]
          cart[i][:count] = cart[i][:count] - coupons[j][:num]
        end
      end
       j += 1
    end
    i += 1
    j = 0
  end
  cart
end

def apply_clearance(cart)
  i = 0 
  while i < cart.length do
    if cart[i][:clearance] == true
      cart[i][:price] = 0.8*cart[i][:price]
    end
    i += 1
  end
  cart
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  new_cart = consolidate_cart(cart)
  new_cart_with_coupons = apply_coupons(new_cart, coupons)
  final_cart = apply_clearance(new_cart_with_coupons)
  i = 0 
  total = 0
  while i < final_cart.length do
    total += final_cart[i][:price]*final_cart[i][:count]
    i += 1 
  end
  if total > 100 do
    total = total * 0.9
  end
  total
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
