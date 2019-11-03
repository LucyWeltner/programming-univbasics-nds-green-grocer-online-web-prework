
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
end


p consolidate_cart([
  {:item => "AVOCADO", :price => 3.00, :clearance => true },
  {:item => "AVOCADO", :price => 3.00, :clearance => true },
  {:item => "KALE", :price => 3.00, :clearance => false},
  {:item => "RHUBARB", :price => 2.50, :clearance => false},
])

def apply_coupons(cart, coupons)
  i = 0
  j = 0 
  cartWithCoupons = []
  p cart[0]
  while i < cart.length do
    while j < coupons.length do
      if cart[i][:item] == coupons[j][:item] && cart[i][:count] >= coupons[j][:num]
        cartWithCoupons << {:item => "#{cart[i][:item]} W/ COUPON", :count => coupons[j][:num], :clearance => cart[i][:clearance], :price => coupons[j][:cost]/coupons[j][:num]}
        if cart[i][:count] > coupons[j][:num]
          cartWithCoupons << cart[i]
          cartWithCoupons[-1][:count] = cart[i][:count] - coupons[j][:num]
        end
      else
        cartWithCoupons << cart[i]
      end
       j += 1
    end
    i+=1
    j = 0
  end
  cartWithCoupons
end

def apply_coupons_new(cart, coupons)
  i = 0
  j = 0 
  while i < cart.length do
    while j < coupons.length do
      if cart[i][:item] == coupons[j][:item] && cart[i][:count] >= coupons[j][:num]
        cart << {:item => "#{cart[i][:item]} W/ COUPON", :count => coupons[j][:num], :clearance => cart[i][:clearance], :price => coupons[j][:cost]/coupons[j][:num]}
        if cart[i][:count] == coupons[j][:num]
          cart.delete_at(i)
        end
        if cart[i][:count] > coupons[j][:num]
          cart[i][:count] = cart[i][:count] - coupons[j][:num]
        end
      end
       j += 1
    end
    i+=1
    j = 0
  end
  cart
end

p apply_coupons([
  {:item => "AVOCADO", :price => 3.00, :clearance => true, :count => 2},
  {:item => "KALE",    :price => 3.00, :clearance => false, :count => 1}], [{:item => "AVOCADO", :num => 2, :cost => 5.00}])