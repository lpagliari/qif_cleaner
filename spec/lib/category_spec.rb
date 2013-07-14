require 'spec_helper'

describe Category do
  PAIRS = [
    ['Alimentacao'                                , 'Personal:Groceries']              ,
    ['Alimentacao:Supermercado'                   , 'Personal:Groceries']              ,
    ['Alimentacao:Restaurantes'                   , 'Personal:Restaurant']             ,

    ['Animal de estimacao'                        , 'Pet Care']                        ,
    ['Animal de estimacao:Alimentacao'            , 'Pet Care:Food']                   ,
    ['Animal de estimacao:Suprimentos'            , 'Pet Care:Supplies']               ,
    ['Animal de estimacao:Veterinario'            , 'Pet Care:Veterinarian']           ,

    ['Automovel'                                  , 'Automotive']                      ,
    ['Automovel:Estacionamento'                   , 'Automotive:Parking']              ,
    ['Automovel:Gasolina'                         , 'Automotive:Fuel']                 ,
    ['Automovel:Impostos'                         , 'Automotive:Taxes']                ,
    ['Automovel:Manutencao'                       , 'Automotive:Service']              ,
    ['Automovel:Multa'                            , 'Automotive:Tickets']              ,
    ['Automovel:Seguro'                           , 'Automotive:Insurance']            ,

    ['Beleza'                                     , 'Personal:Personal Care']          ,

    ['Contas'                                     , 'Bills']                           ,
    ['Contas:Agua e Esgoto'                       , 'Bills:Water/Sewer']               ,
    ['Contas:Aluguel'                             , 'Bills:Rent']                      ,
    ['Contas:Condominio'                          , 'Bills:Homeowners Dues']           ,
    ['Contas:Eletricidade'                        , 'Bills:Electric']                  ,
    ['Contas:Gas'                                 , 'Bills:Gas']                       ,
    ['Contas:Juros do financ. imobiliario'        , 'Bills:Mortgage Interest']         ,
    ['Contas:Lixo e reciclagem'                   , 'Bills:Garbage']                   ,
    ['Contas:Principal do financ. imobiliario'    , 'Bills:Mortgage Interest']         ,
    ['Contas:Telefone'                            , 'Bills:Phone']                     ,
    ['Contas:Televisao a cabo'                    , 'Bills:Cable']                     ,

    ['Despesas com filhos'                        , 'Childcare']                       ,

    ['Despesas de casa'                           , 'Home']                            ,
    ['Despesas de casa:Gas'                       , 'Bills:Gas']                       ,
    ['Despesas de casa:Luz'                       , 'Bills:Electric']                  ,
    ['Despesas de casa:TV + internet'             , 'Bills:Cable']                     ,

    ['Despesas de trabalho'                       , 'Business']                        ,
    ['Despesas de trabalho:Nao-reembolsado'       , 'Business:Non-Reimbursed Expense'] ,
    ['Despesas de trabalho:Reembolsado'           , 'Business:Reimbursed Expense']     ,

    ['Diversos'                                   , 'Miscellaneous']                   ,
    ['Diversos:Mudanca'                           , 'Home:Moving']                     ,

    ['Doacoes de caridade'                        , 'Charity']                         ,

    ['Educacao'                                   , 'Education']                       ,
    ['Educacao:Comissoes'                         , 'Education:Fees']                  ,
    ['Educacao:congresso'                         , 'Education:Conferences']           ,
    ['Educacao:Curso'                             , 'Education:Courses']               ,
    ['Educacao:jornal'                            , 'Personal:Books/Magazines']        ,
    ['Educacao:Livros'                            , 'Personal:Books/Magazines']        ,
    ['Educacao:Material Escolar'                  , 'Education:Supplies']              ,
    ['Educacao:Mensalidade escolar'               , 'Education:Fees']                  ,
    ['Educacao:revistas'                          , 'Personal:Books/Magazines']        ,

    ['Empresa'                                    , 'Personal Company']                ,
    ['Empresa:Contador'                           , 'Personal Company:Accountant']     ,
    ['Empresa:Impostos'                           , 'Personal Company:Taxes']          ,
    ['Empresa:Sindicato'                          , 'Personal Company:Union']          ,

    ['Emprestimo'                                 , 'Loan']                            ,
    ['Emprestimo:Juros do emprestimo'             , 'Loan:Interest']                   ,
    ['Emprestimo:Principal do emprestimo'         , 'Loan:Payment']                    ,

    ['Esporte'                                    , 'Personal:Sports']                 ,

    ['Ferias'                                     , 'Vacation']                        ,
    ['Ferias:Acomodacao'                          , 'Vacation:Lodging']                ,
    ['Ferias:Viagens'                             , 'Vacation:Travel']                 ,

    ['Impostos'                                   , 'Tax']                             ,
    ['Impostos:Imposto de renda'                  , 'Tax:IRPF']                        ,
    ['Impostos:IPVA'                              , 'Automotive:Tax']                  ,
    ['Impostos:Outros impostos'                   , 'Tax:Misc Tax']                    ,

    ['Informatica'                                , 'Personal:Computer']               ,
    ['Informatica:Laptop Dell'                    , 'Personal:Computer']               ,
    ['Informatica:Laptop IBM'                     , 'Personal:Computer']               ,

    ['Itens de decoracao'                         , 'Home:Furnishing']                 ,

    ['lavanderia'                                 , 'Personal:Laundry']                ,

    ['Lazer'                                      , 'Personal:Entertainment']          ,
    ['Lazer:Artigos esportivos'                   , 'Personal:Sporting Goods']         ,
    ['Lazer:Brinquedos e jogos'                   , 'Personal:Toys']                   ,
    ['Lazer:Cinema e locacao de video'            , 'Personal:Theatre']                ,
    ['Lazer:Diversao'                             , 'Personal:Entertainment']          ,
    ['Lazer:Eventos culturais'                    , 'Personal:Cultural Events']        ,
    ['Lazer:Eventos esportivos'                   , 'Personal:Sports Events']          ,
    ['Lazer:Fitas e CDs'                          , 'Personal:Music']                  ,
    ['Lazer:Livros e revistas'                    , 'Personal:Books/Magazines']        ,

    ['luz'                                        , 'Bills:Electric']                  ,

    ['Pagamento de cartao de credito'             , 'Personal:Credit Card']            ,

    ['passagem'                                   , 'Airline Tickets']                 ,
    ['passagem:taxa de embarque'                  , 'Airline Tickets:Tax']             ,

    ['Presentes'                                  , 'Personal:Gifts']                  ,
    ['Presentes:Flores'                           , 'Personal:Gifts']                  ,

    ['Retirada de dinheiro'                       , 'ATM Withdrawal:Cash']             ,

    ['Roupas'                                     , 'Personal:Clothing']               ,

    ['Saude'                                      , 'Healthcare']                      ,
    ['Saude:Dentista'                             , 'Healthcare:Dental']               ,
    ['Saude:Hospital'                             , 'Healthcare:Hospital']             ,
    ['Saude:Medico'                               , 'Healthcare:Physician']            ,
    ['Saude:Oculista'                             , 'Healthcare:Vision']               ,
    ['Saude:Remedios'                             , 'Healthcare:Prescriptions']        ,

    ['Seguro'                                     , 'Insurance']                       ,
    ['Seguro:Automovel'                           , 'Automotive:Insurance']            ,
    ['Seguro:do Locatario/do Locador'             , 'Home:Insurance']                  ,
    ['Seguro:Laptop'                              , 'Personal:Computer:Insurance']     ,
    ['Seguro:Saude'                               , 'Healthcare:Insurance']            ,
    ['Seguro:Vida'                                , 'Insurance:Life']                  ,

    ['Taxas bancarias'                            , 'Bank Charge']                     ,
    ['Taxas bancarias:Anuidade Cartao de Credito' , 'Bank Charge:Service Charges']     ,
    ['Taxas bancarias:Juros'                      , 'Bank Charge:Interest Paid']       ,
  ]

  PAIRS.each do |pair|
    origin = pair[0]
    target = pair[1]
    it "should translate '#{origin}' to '#{target}' category" do
      Category.instance_of(origin).translate.should eq target
    end
  end

  it 'should not change the category name when translating an unmapped category origin' do
    Category.instance_of('Category not Found').translate.should eq 'Category not Found'
  end
end
