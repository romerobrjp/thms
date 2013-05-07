class TenantMailer < ActionMailer::Base
  default from: "from@example.com"

  def tenement_association_email(tenement, syndic)
    @tenant   = tenement.tenant
    @tenement = tenement
    @syndic   = syndic
    mail(to: @tenant.email, subject: "Townhouse registration - #{@tenement.townhouse.name}")
  end

  def new_bulletin_email(townhouse, bulletin, syndic)
    to = townhouse.tenements.map{|t| t.tenant.email }
    @townhouse = townhouse
    @bulletin  = bulletin
    @syndic    = syndic
    mail(to: to, subject: "Townhouse bulletin - #{townhouse.name}")
  end

end
