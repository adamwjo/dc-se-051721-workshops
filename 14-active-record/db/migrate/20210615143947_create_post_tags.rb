class CreatePostTags < ActiveRecord::Migration[5.2]
  def change
    # add references below to both of the tables that post_tags should join.
    create_table :post_tags do |t|
    end
  end
end
