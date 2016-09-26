FactoryGirl.define do
  factory :recipe do
    title Faker::Lorem.sentence 3
    kitchen Faker::Lorem.words 1
    food_type Faker::Lorem.words 1
    serving Faker::Number.number 2
    time Faker::Number.number 3
    difficulty "Fácil"
    ingredients Faker::Lorem.paragraphs 3
    directions Faker::Lorem.paragraphs 5
  end
end
