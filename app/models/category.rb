class Category < ActiveRecord::Base
  has_many :children, class_name: 'Category', :foreign_key => 'parent_id'
  belongs_to :parent_category, class_name: 'Category', :foreign_key => "parent_id"
  attr_accessible :title

 def as_json(options={})
   {title: title, children: children}
 end
end
