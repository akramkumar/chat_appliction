class Conversation < ApplicationRecord
  belongs_to :user1, class_name: "User"
  belongs_to :user2, class_name: "User"
  has_many :messages
  scope :between_user, -> (user,user1)  {where("(user1_id = ? AND user2_id = ?) OR (user1_id = ? AND user2_id = ?)", user.id, user1.id, user1.id, user.id)}
end
