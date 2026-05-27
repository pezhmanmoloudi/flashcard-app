class FlashcardPolicy < ApplicationPolicy
  def manage?
    record.deck.user_id == user.id
  end
end
