class AddOrderToLineItem < ActiveRecord::Migration[7.0]
  def change
    add_reference :line_items, :order, null: true, foreign_key: true
    change_column :line_items, :cart_id, :integer, null: true

    reversible do |dir|
      dir.up do
        LineItem.reset_column_information
        LineItem.find_each do |line_item|
          line_item.update(price: line_item.product.price)
        end
      end
    end
  end
end
