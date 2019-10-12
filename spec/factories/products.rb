FactoryBot.define do

  factory :product do
    name                       {"手袋"}
    introduction               {"リボン付きの可愛い手袋です"}
    category_id                {"1"}
    size                       {"フリーサイズ"}
    state_id                   {"1"}
    delivery_cost_id           {"1"}
    delivery_method_id         {"1"}
    prefecture_id              {"1"}
    price                      {"980"} 
    brand                      {"ノーブランド"}
    delivery_date_id           {"1"}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  end


end

