class Client < ApplicationRecord
    has_many :loans
    
    validates :first_name, :last_name, :email, :document, :birthdate, presence: true
    validates :email, uniqueness: true, format: {with: /\b[A-Z0-9._%a-z\-]+@+[a-z]+.[a-z]{2,4}\z/, message: "wrong format"}
    validates :document, format: {with: /\b\d{3}\.\d{3}\.\d{3}-\d{2}\z/, message: "wrong format"}
    validate :majority
    before_create {email.downcase}

    def full_name
        "#{self.first_name} #{self.last_name}"
    end
    def majority
        if age < 18
            errors.add :age, "you can't make a loan with this age"
        end
    end
    def age
        ((Date.today - birthdate.to_date) / 365.25).to_i
    end
end
