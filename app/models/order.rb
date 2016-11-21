class Order < ApplicationRecord::Base
#class Order < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
end
