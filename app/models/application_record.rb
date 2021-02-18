class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def previous
    Romance.where('id < ?', id).order('id DESC').first
  end

  def next
    Romance.where('id > ?', id).order('id ASC').first
  end
end
