class Client < ActiveRecord::Base
	has_secure_password
	has_many :prospects

	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :name, presence: true, length: { in: 2..20 }
	validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }

	before_save do 
		self.email.downcase!
	end

	# Create demo data
	def self.create_demo
		i = 1
		j = rand(10)
		while i < 6
			client = Client.create(name:"User#{i}", email:"user#{i}@gmail.com", password:"password")
			while j > 0
				prospect = Client.last
				r = Time.at(rand * Time.now.to_f)
				t = Time.new(Time.now.year-1, r.month, r.day, r.hour, r.min, r.sec, r.utc_offset)
				k = rand(10)%2
				if k == 0
					client.prospects.create(name:"Prospect#{j}", created_at: t)
				else
					client.prospects.create(name:"Prospect#{j}", phone:"#{rand(9999999999)}" , created_at: t)
				end
				j -= 1
			end
			j = rand(10)
			i += 1
		end
	end
	before_destroy do 
		self.prospects.destroy_all
	end
end
