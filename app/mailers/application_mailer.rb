class ApplicationMailer < ActionMailer::Base
  default from: 'raulsantiago@id.uff.br' #email padrão de envio para usuario
  layout 'mailer'
end
