class Usuario < ApplicationRecord
  has_secure_password #para usar descripiton

  mount_uploader :avatar, AvatarUploader

  has_many :posts, dependent: :destroy

  validates_presence_of :avatar # exigir foto obrigatoria
  validates :nome, presence: true, length: { in: 2..20 }
  validates :sobrenome, presence: true, length: { in: 2..50 }
  validates :email, presence: true, length: { in: 5..50 }, uniqueness: true #uniqueness: true não pode dados em duplicidade
  validates :telefone, presence: true, numericality: { only_integer: true },
  length: { in: 8..15 }
  validates :data_nascimento, presence: true
  validates :password, length: { in: 6..12 }, allow_nil:true #allow_nil serve pra não ficar vaxia a senha
  validate :data_correta_maioridade # validate sem plura diferancair funcção aqui e não en outra aba/arquivo
  validate :data_correta_passado

  def data_correta_maioridade
    if data_nascimento && data_nascimento > (DateTime.now + 18.years) #data_nascimento em duplicidade para se for nulla sair da função e não vai tarvar o sistema
      errors.add(:data_nascimento, "Não pode ter menos de 18 anos")
    end
  end

  def data_correta_passado
    if data_nascimento && data_nascimento < (DateTime.now - 150.years)
      errors.add(:data_nascimento, "Voĉe é uma múmia")
    end
  end

  def tamanho_foto
    if avatar.size > 5.megabytes
      errors.add(:avatar, "Muito grande, não pode possuir mais de 5 MB")
    end
  end


end
