ActiveAdmin.register AttendeeCategory do
  menu :parent => "Attendees"

  permit_params :name, :description
end