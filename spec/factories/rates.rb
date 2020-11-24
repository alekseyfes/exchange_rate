FactoryBot.define do
  factory :rate do
    value { 1 }
    from { 'usd' }
    to { 'rub' }

    trait :not_manual do
      is_manual { false }
      expired_date { nil }
    end

    trait :manual do
      is_manual { true }
    end

    trait :expiry_date_expired do
      expired_date { DateTime.now - 30.minutes }
    end

    trait :expiry_date_not_expired do
      expired_date { DateTime.now + 30.minutes }
    end
  end
end
