class Album < ApplicationRecord
  scope :rock, -> { where genre: "Rock" } # search function specifically to find rock genre
  has_and_belongs_to_many :artists
  has_many :songs, dependent: :destroy
  validates :name, presence: true
  validates_length_of :name, maximum: 100
  before_save(:titleize_album)

  private
    def titleize_album
      self.name = self.name.titleize
    end
end

# ------ scopes ------

# search function to find whatever album name the user intputs:
  # scope :name, -> (name_parameter) { where name: name_parameter }

# search function to display all of the albums name containing a specific set of letters the user entered // case senstivtive use lower method?:
  # scope :search, -> (name_parameter) { where("name like ?", "%#{name_parameter}%")} 