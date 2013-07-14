class Category
  def initialize(translated_name)
    @name = translated_name
  end

  def translate
    @name
  end

  def self.instance_of(original_name)
    INSTANCES[original_name] || Category.new(original_name)
  end

  INSTANCES = {
    'Alimentacao'                                => Category.new('Personal:Groceries')  ,
    'Alimentacao:Supermercado'                   => Category.new('Personal:Groceries')  ,
    'Alimentacao:Restaurantes'                   => Category.new('Personal:Restaurant') ,

    'Animal de estimacao'                        => Category.new('Pet Care'),
    'Animal de estimacao:Alimentacao'            => Category.new('Pet Care:Food'),
    'Animal de estimacao:Suprimentos'            => Category.new('Pet Care:Supplies'),
    'Animal de estimacao:Veterinario'            => Category.new('Pet Care:Veterinarian'),

    'Automovel'                                  => Category.new('Automotive'),
    'Automovel:Estacionamento'                   => Category.new('Automotive:Parking'),
    'Automovel:Gasolina'                         => Category.new('Automotive:Fuel'),
    'Automovel:Impostos'                         => Category.new('Automotive:Taxes'),
    'Automovel:Manutencao'                       => Category.new('Automotive:Service'),
    'Automovel:Multa'                            => Category.new('Automotive:Tickets'),
    'Automovel:Seguro'                           => Category.new('Automotive:Insurance'),

    'Beleza'                                     => Category.new('Personal:Personal Care'),

    'Contas'                                     => Category.new('Bills'),
    'Contas:Agua e Esgoto'                       => Category.new('Bills:Water/Sewer'),
    'Contas:Aluguel'                             => Category.new('Bills:Rent'),
    'Contas:Condominio'                          => Category.new('Bills:Homeowners Dues'),
    'Contas:Eletricidade'                        => Category.new('Bills:Electric'),
    'Contas:Gas'                                 => Category.new('Bills:Gas'),
    'Contas:Juros do financ. imobiliario'        => Category.new('Bills:Mortgage Interest'),
    'Contas:Lixo e reciclagem'                   => Category.new('Bills:Garbage'),
    'Contas:Principal do financ. imobiliario'    => Category.new('Bills:Mortgage Interest'),
    'Contas:Telefone'                            => Category.new('Bills:Phone'),
    'Contas:Televisao a cabo'                    => Category.new('Bills:Cable'),

    'Despesas com filhos'                        => Category.new('Childcare'),

    'Despesas de casa'                           => Category.new('Home'),
    'Despesas de casa:Gas'                       => Category.new('Bills:Gas'),
    'Despesas de casa:Luz'                       => Category.new('Bills:Electric'),
    'Despesas de casa:TV + internet'             => Category.new('Bills:Cable'),

    'Despesas de trabalho'                       => Category.new('Business'),
    'Despesas de trabalho:Nao-reembolsado'       => Category.new('Business:Non-Reimbursed Expense'),
    'Despesas de trabalho:Reembolsado'           => Category.new('Business:Reimbursed Expense'),

    'Diversos'                                   => Category.new('Miscellaneous'),
    'Diversos:Mudanca'                           => Category.new('Home:Moving'),

    'Doacoes de caridade'                        => Category.new('Charity'),

    'Educacao'                                   => Category.new('Education'),
    'Educacao:Comissoes'                         => Category.new('Education:Fees'),
    'Educacao:congresso'                         => Category.new('Education:Conferences'),
    'Educacao:Curso'                             => Category.new('Education:Courses'),
    'Educacao:jornal'                            => Category.new('Personal:Books/Magazines'),
    'Educacao:Livros'                            => Category.new('Personal:Books/Magazines'),
    'Educacao:Material Escolar'                  => Category.new('Education:Supplies'),
    'Educacao:Mensalidade escolar'               => Category.new('Education:Fees'),
    'Educacao:revistas'                          => Category.new('Personal:Books/Magazines'),

    'Empresa'                                    => Category.new('Personal Company'),
    'Empresa:Contador'                           => Category.new('Personal Company:Accountant'),
    'Empresa:Impostos'                           => Category.new('Personal Company:Taxes'),
    'Empresa:Sindicato'                          => Category.new('Personal Company:Union'),

    'Emprestimo'                                 => Category.new('Loan'),
    'Emprestimo:Juros do emprestimo'             => Category.new('Loan:Interest'),
    'Emprestimo:Principal do emprestimo'         => Category.new('Loan:Payment'),

    'Esporte'                                    => Category.new('Personal:Sports'),

    'Ferias'                                     => Category.new('Vacation'),
    'Ferias:Acomodacao'                          => Category.new('Vacation:Lodging'),
    'Ferias:Viagens'                             => Category.new('Vacation:Travel'),

    'Impostos'                                   => Category.new('Tax'),
    'Impostos:Imposto de renda'                  => Category.new('Tax:IRPF'),
    'Impostos:IPVA'                              => Category.new('Automotive:Tax'),
    'Impostos:Outros impostos'                   => Category.new('Tax:Misc Tax'),

    'Informatica'                                => Category.new('Personal:Computer'),
    'Informatica:Laptop Dell'                    => Category.new('Personal:Computer'),
    'Informatica:Laptop IBM'                     => Category.new('Personal:Computer'),

    'Itens de decoracao'                         => Category.new('Home:Furnishing'),

    'lavanderia'                                 => Category.new('Personal:Laundry'),

    'Lazer'                                      => Category.new('Personal:Entertainment'),
    'Lazer:Artigos esportivos'                   => Category.new('Personal:Sporting Goods'),
    'Lazer:Brinquedos e jogos'                   => Category.new('Personal:Toys'),
    'Lazer:Cinema e locacao de video'            => Category.new('Personal:Theatre'),
    'Lazer:Diversao'                             => Category.new('Personal:Entertainment'),
    'Lazer:Eventos culturais'                    => Category.new('Personal:Cultural Events'),
    'Lazer:Eventos esportivos'                   => Category.new('Personal:Sports Events'),
    'Lazer:Fitas e CDs'                          => Category.new('Personal:Music'),
    'Lazer:Livros e revistas'                    => Category.new('Personal:Books/Magazines'),

    'luz'                                        => Category.new('Bills:Electric'),

    'Pagamento de cartao de credito'             => Category.new('Personal:Credit Card'),

    'passagem'                                   => Category.new('Airline Tickets'),
    'passagem:taxa de embarque'                  => Category.new('Airline Tickets:Tax'),

    'Presentes'                                  => Category.new('Personal:Gifts'),
    'Presentes:Flores'                           => Category.new('Personal:Gifts'),

    'Retirada de dinheiro'                       => Category.new('ATM Withdrawal:Cash'),

    'Roupas'                                     => Category.new('Personal:Clothing'),

    'Saude'                                      => Category.new('Healthcare'),
    'Saude:Dentista'                             => Category.new('Healthcare:Dental'),
    'Saude:Hospital'                             => Category.new('Healthcare:Hospital'),
    'Saude:Medico'                               => Category.new('Healthcare:Physician'),
    'Saude:Oculista'                             => Category.new('Healthcare:Vision'),
    'Saude:Remedios'                             => Category.new('Healthcare:Prescriptions'),

    'Seguro'                                     => Category.new('Insurance'),
    'Seguro:Automovel'                           => Category.new('Automotive:Insurance'),
    'Seguro:do Locatario/do Locador'             => Category.new('Home:Insurance'),
    'Seguro:Laptop'                              => Category.new('Personal:Computer:Insurance'),
    'Seguro:Saude'                               => Category.new('Healthcare:Insurance'),
    'Seguro:Vida'                                => Category.new('Insurance:Life'),

    'Taxas bancarias'                            => Category.new('Bank Charge'),
    'Taxas bancarias:Anuidade Cartao de Credito' => Category.new('Bank Charge:Service Charges'),
    'Taxas bancarias:Juros'                      => Category.new('Bank Charge:Interest Paid'),
  }
end
