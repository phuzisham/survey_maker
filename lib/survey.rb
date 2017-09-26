class Survey < ActiveRecord::Base
  has_many(:questions)
  validates(:title, {:presence => true, :length => {:maximum => 40}})
  before_save(:upcase_title)

private

  def upcase_title
  array = self.title.split
  array.each do |t|
      t.capitalize!
    end
    self.title = array.join(' ')
  end
end
