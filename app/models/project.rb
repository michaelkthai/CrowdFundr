class Project < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :rewards
  has_many :pledges, through: :rewards

  validates :title, :short_description, :long_description, :risk_description, presence: true
  validates_associated :category, :user
  validates :funding_amount, :numericality => { :greater_than => 0 }

  accepts_nested_attributes_for :rewards, reject_if: :all_blank

  def count_backers
    return self.pledges.count
  end

  def amount_pledged
    return self.pledges.sum(:amount)
  end

  def ended?
    return DateTime.now.to_date > self.end_date
  end

  def days_remaining
    return (self.end_date.to_date - self.created_at.to_date).to_i - 1
  end

  def user_name
    return "#{self.user.first_name} #{self.user.last_name}"
  end
end
