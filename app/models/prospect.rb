class Prospect < ActiveRecord::Base
  belongs_to :client

  validates :name, presence: true, length: {in: 2..20}
end
