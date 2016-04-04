ActiveAdmin.register Attendee do
  permit_params :attendee_category_id, :attendee_group_id

  index do
    column :first_name
    column :last_name
    column :contact_no
    column :email
    column :age 
    column :gender
    column :category 
    column :attendee_category
    column :group
    column :attendee_group
    actions
  end

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :contact_no
      f.input :email
      f.input :age 
      f.input :gender
      f.input :category
      f.input :attendee_category
      f.input :group
      f.input :attendee_group
    end
    f.actions
  end
end