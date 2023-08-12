class MealRepository

  def initialize(csv_file)
    @csv_file = csv_file
    @meals = []
    load_csv if File.exist?(@csv_file)
    @next_id = @meals.empty? ? 1 : @meals.last.id + 1
  end

  def create(meal)
    meal.id = @next_id
    @next_id += 1
    @meals << meal
    save_csv
  end

  def all
    @meals
  end

  def find(id)
    @meals.find { |meal| meal.id == id }
  end

  private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      id = row[:id].to_i
      name = row[:name]
      price = row[:price].to_i

      meal = Meal.new(id:, name:, price:)

      @meals << meal
    end
  end

  def save_csv
    CSV.open(@csv_file, 'wb') do |csv|
      csv << %i[id name price]

      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end

end
