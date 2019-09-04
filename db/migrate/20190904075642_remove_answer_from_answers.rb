class RemoveAnswerFromAnswers < ActiveRecord::Migration[5.2]
  def change
    remove_column :answers, :answer
  end
end
