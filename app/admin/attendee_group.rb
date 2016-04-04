ActiveAdmin.register AttendeeGroup do
  menu :parent => "Attendees"

  permit_params :name, :description
end