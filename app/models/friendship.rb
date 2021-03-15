class Friendship < ApplicationRecord
  belongs_to :requester, class_name: 'User'
  belongs_to :requestee, class_name: 'User'

  before_create :check_uniqueness
  after_initialize :init

  def init
    self.status ||= 'pending'    
  end

  private

  def check_uniqueness
    self.where(requester_id: ? )
    params[:requester_id]
  end
end