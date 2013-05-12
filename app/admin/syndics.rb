ActiveAdmin.register Syndic do

    form do |f|
      f.inputs "Details" do
        f.input :email
        f.input :name
        f.input :cpf
        f.input :password
        f.input :password_confirmation
      end
      f.inputs "Address", for: [:address, f.object.address || Address.new] do |address_form|
        address_form.input :street
        address_form.input :number
        address_form.input :district
        address_form.input :city
        address_form.input :state
        address_form.input :zip_code
        address_form.input :complement
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
