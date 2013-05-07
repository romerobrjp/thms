ActiveAdmin.register Syndic do

    form do |f|
      f.inputs "Details" do
        f.input :email
        f.input :name
        f.input :cpf
        f.input :password
        f.input :password_confirmation
      end
      f.has_many :phones do |add_f|
        add_f.inputs "Phone" do
          add_f.input :number
          add_f.input :description
        end
      end
      f.actions
    end

end
