# Implement a method #stock_picker that takes in an array of stock prices, one for
# each hypothetical day. It should return a pair of days representing the best day
# to buy and the best day to sell. Days start at 0.
#
# You need to buy before you can sell
#
# Pay attention to edge cases like when the lowest day is the last day or the highest day is the first day.

price1 = [17,3,6,9,15,8,6,1,10]
price2 = [20, 9, 2, 22, 25, 18, 1, 10]
price3 = [70, 65, 60, 50, 42, 39, 20, 15, 10, 4, 1] # works for continuous loss, buy and sell on day 0 for no loss
price4 = [4, 10, 20, 25, 22, 30, 37, 31, 48, 50, 45, 60] # works for continuous gain, buy first day, sell last day

def pick(price_arr)
  largest_profit = 0
  buy_day = 0
  sell_day = 0

  price_arr.each_with_index do |price1, i|
    price_arr.each_with_index do |price2, j|
      next unless j > i                         # only compare current day with later days to keep sell date after buy date
      profit = price2 - price1
      if profit > largest_profit
        largest_profit = profit
        buy_day = i
        sell_day = j
      end
    end
  end
  return [buy_day, sell_day, "Profit = #{largest_profit}"]
end

p pick(price1)
p pick(price2)
p pick(price3)
p pick(price4)
