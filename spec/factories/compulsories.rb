FactoryGirl.define do
  factory :compulsory do
    name Faker::Lorem.word
    code { "#{['DI','MI','DP','MP','DT','MT'].sample}#{(1..10).to_a.sample}" }
  end
end
