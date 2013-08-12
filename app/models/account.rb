class Account < ActiveRecord::Base
  belongs_to :client

  validates :balance, numericality: { only_integer: true }

  before_create :set_number
  
  def to_s
  	"[#{number}] #{balance} zł"
  end

  protected
  	def set_number
  		self.number = rand 1_000_000_000
  	end
end
