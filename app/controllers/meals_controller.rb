require_relative '../views/meals_view'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = MealsView.new
  end

  def add
    # Mandar a view perguntar o nome da meal
    name = @view.ask_name

    # Mandar a view perguntar o preço da meal
    price = @view.ask_price

    # Instanciar uma nova meal
    new_meal = Meal.new(name:, price:)

    # Mandar o meal_repository criar a meal
    @meal_repository.create(new_meal)

  end

  def list
    # pegar todos os meals do repositório
    meals = @meal_repository.all

    # Mandar a view listar os meals
    @view.list(meals)
  end
end
