if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_JcSthL4QymM09zpTBP40Ianv',
    :secret_key => 'sk_test_RTDDap8O9wmyJ1PG198arefi'
  }
end

#Sripe.api_key = Rails.configuration.stripe[:secret_key]
