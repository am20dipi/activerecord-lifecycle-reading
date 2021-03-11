class Post < ActiveRecord::Base

  belongs_to :author
  validate :is_title_case 

  #before_save :make_title_case
  # a lifecycle callback: will make sure our posts are always title-cased. 
  # before_save is called after validation occurs, so we have to change it to: before_validation

  before_validation :make_title_case
  # use before_validation when you are modifying an attribute of the model.

  before_save :email_author_about_post
  # use before_save for actions that need to occur that DO NOT modify the model itself. 

  private

  def is_title_case
    if title.split.any?{|w|w[0].upcase != w[0]}
      errors.add(:title, "Title must be in title case")
    end
  end


  def email_author_about_post
  

  end

  def make_title_case
    self.title = self.title.titlecase
  end
end
