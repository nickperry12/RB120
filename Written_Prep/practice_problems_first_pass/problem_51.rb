# The following is a short description of an application that lets a customer
# place an order for a meal:

# - A meal always has three meal items: a burger, a side, and drink.
# - For each meal item, the customer must choose an option.
# - The application must compute the total cost of the order.

# 1. Identify the nouns and verbs we need in order to model our classes and
#    methods.
# 2. Create an outline in code (a spike) of the structure of this application.
# 3. Place methods in the appropriate classes to correspond with various verbs.

=begin
Identify nouns and verbs

Nouns:
Meal
Meal item
Customer
Option
Total cost
Order

Verbs:
compute
choose
place order

Organize nouns with verbs:
Compute total cost
- Order

Choose
- Customer

Place order
- Order
=end

class Order
  def find_order_total
  end
end

class Customer
  def place_order
  end
end

class MealItem
end

class Burger < MealItem
end

class Drink < MealItem
end

class Side < MealItem
end
