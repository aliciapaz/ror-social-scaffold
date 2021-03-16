class Friendship < ApplicationRecord
  include ActiveModel::Validations
  validate :check_uniqueness, on: :create

  belongs_to :requester, class_name: 'User'
  belongs_to :requestee, class_name: 'User'
 
  after_initialize :init

  def init
    self.status ||= 'pending'    
  end

  def check_uniqueness
    a = Friendship.where(requestee_id: self[:requestee_id], requester_id: self[:requester_id])
    b = Friendship.where(requestee_id: self[:requester_id], requester_id: self[:requestee_id])
    errors.add(:check_uniqueness, "you already have a friendship invitation with this user") unless (a.empty? and b.empty?)
  end

  def self.find_friendship(user1, user2)
      self.where(requester_id: user1[:id], requestee_id: user2[:id]).pluck(:id, :status)
  end
  
end

