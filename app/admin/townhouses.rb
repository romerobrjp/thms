ActiveAdmin.register Townhouse do
  form do |f|
    f.inputs 'Information' do
      f.input :name
      f.input :information
    end
    f.inputs 'Syndics' do
      f.input :syndics
    end
    f.actions
  end
end
