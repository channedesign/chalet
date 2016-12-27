FactoryGirl.define do
  factory :week do
    from '12/1/2016'
    to '12/7/2016'
    self_catered '1000'
    weekend '500'
    month
  end
end
