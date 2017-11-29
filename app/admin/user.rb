ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
       d = User.new.password_genrator
        p d
       f.input :password, :as => :hidden, :input_html => {:value => d}
       f.input :password_confirmation, :as => :hidden, :input_html => {:value => d}
    end
    f.actions
  end

end
