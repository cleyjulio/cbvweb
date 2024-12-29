object DM: TDM
  Height = 413
  Width = 484
  object q1: TUniQuery
    Connection = UniMainModule.Conexao
    Left = 48
    Top = 32
  end
  object qUsuarios: TUniQuery
    Connection = UniMainModule.Conexao
    SQL.Strings = (
      'select * from usuario'
      'where status = 1'
      'order by nome')
    Left = 48
    Top = 112
    object qUsuarioscod: TIntegerField
      FieldName = 'cod'
    end
    object qUsuariosnome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 100
    end
    object qUsuariosemail: TStringField
      FieldName = 'email'
      Required = True
      Size = 200
    end
    object qUsuariossenha: TStringField
      FieldName = 'senha'
      Required = True
      Size = 100
    end
    object qUsuariosstatus: TSmallintField
      FieldName = 'status'
      Required = True
    end
    object qUsuariosadm: TSmallintField
      FieldName = 'adm'
      Required = True
    end
  end
  object qConta: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO conta'
      
        '  (cod, nome, status, cpf_cnpj, rg, uf_rg, nacionalidade, tipo, ' +
        'sexo, nascimento, cod_escolaridade, cod_estado_civil, cod_profis' +
        'sao, endereco, complemento, cep, cod_cidade, fone, fone2, email)'
      'VALUES'
      
        '  (:cod, :nome, :status, :cpf_cnpj, :rg, :uf_rg, :nacionalidade,' +
        ' :tipo, :sexo, :nascimento, :cod_escolaridade, :cod_estado_civil' +
        ', :cod_profissao, :endereco, :complemento, :cep, :cod_cidade, :f' +
        'one, :fone2, :email)')
    SQLDelete.Strings = (
      'DELETE FROM conta'
      'WHERE'
      '  cod = :Old_cod')
    SQLUpdate.Strings = (
      'UPDATE conta'
      'SET'
      
        '  cod = :cod, nome = :nome, status = :status, cpf_cnpj = :cpf_cn' +
        'pj, rg = :rg, uf_rg = :uf_rg, nacionalidade = :nacionalidade, ti' +
        'po = :tipo, sexo = :sexo, nascimento = :nascimento, cod_escolari' +
        'dade = :cod_escolaridade, cod_estado_civil = :cod_estado_civil, ' +
        'cod_profissao = :cod_profissao, endereco = :endereco, complement' +
        'o = :complemento, cep = :cep, cod_cidade = :cod_cidade, fone = :' +
        'fone, fone2 = :fone2, email = :email'
      'WHERE'
      '  cod = :Old_cod')
    SQLLock.Strings = (
      'SELECT * FROM conta'
      'WHERE'
      '  cod = :Old_cod'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      
        'SELECT cod, nome, status, cpf_cnpj, rg, uf_rg, nacionalidade, ti' +
        'po, sexo, nascimento, cod_escolaridade, cod_estado_civil, cod_pr' +
        'ofissao, endereco, complemento, cep, cod_cidade, fone, fone2, em' +
        'ail FROM conta'
      'WHERE'
      '  cod = :cod')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM conta'
      ''
      ') t')
    Connection = UniMainModule.Conexao
    SQL.Strings = (
      'select * from conta'
      'where status = 1'
      'order by nome')
    SpecificOptions.Strings = (
      'PostgreSQL.KeySequence=conta_cod_seq')
    Left = 48
    Top = 200
    object qContacod: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'cod'
    end
    object qContanome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 100
    end
    object qContastatus: TSmallintField
      FieldName = 'status'
      Required = True
    end
    object qContacpf_cnpj: TStringField
      FieldName = 'cpf_cnpj'
    end
    object qContarg: TStringField
      FieldName = 'rg'
    end
    object qContauf_rg: TIntegerField
      FieldName = 'uf_rg'
    end
    object qContanacionalidade: TStringField
      FieldName = 'nacionalidade'
      Size = 25
    end
    object qContatipo: TStringField
      FieldName = 'tipo'
      Size = 1
    end
    object qContasexo: TStringField
      FieldName = 'sexo'
      Size = 1
    end
    object qContanascimento: TDateField
      FieldName = 'nascimento'
    end
    object qContacod_escolaridade: TIntegerField
      FieldName = 'cod_escolaridade'
    end
    object qContacod_estado_civil: TIntegerField
      FieldName = 'cod_estado_civil'
    end
    object qContacod_profissao: TIntegerField
      FieldName = 'cod_profissao'
    end
    object qContaendereco: TStringField
      FieldName = 'endereco'
      Size = 150
    end
    object qContacomplemento: TStringField
      FieldName = 'complemento'
      Size = 50
    end
    object qContacep: TStringField
      FieldName = 'cep'
      Size = 10
    end
    object qContacod_cidade: TIntegerField
      FieldName = 'cod_cidade'
    end
    object qContafone: TStringField
      FieldName = 'fone'
      Size = 25
    end
    object qContafone2: TStringField
      FieldName = 'fone2'
      Size = 25
    end
    object qContaemail: TStringField
      FieldName = 'email'
      Size = 255
    end
  end
  object qAgendamentos: TUniQuery
    Connection = UniMainModule.Conexao
    SQL.Strings = (
      'select a.*, m.nome, m.celular, v.placa, p.nome as produto'
      'from agendamento a '
      'inner join motorista m on (m.cod = a.cod_motorista)'
      'inner join veiculo v on (v.cod = a.cod_veiculo)'
      'left join produtos p on (p.cod = a.cod_produto)'
      
        'where (a."data" between :d1 and :d2) and a.status = 1 and m.stat' +
        'us = 1'
      'order by a."data" , a.hora')
    CachedUpdates = True
    Filtered = True
    Left = 152
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'd1'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'd2'
        Value = nil
      end>
    object qAgendamentoscod: TIntegerField
      FieldName = 'cod'
    end
    object qAgendamentospedido: TIntegerField
      FieldName = 'pedido'
      Required = True
    end
    object qAgendamentoscod_motorista: TIntegerField
      FieldName = 'cod_motorista'
      Required = True
    end
    object qAgendamentoscod_veiculo: TIntegerField
      FieldName = 'cod_veiculo'
      Required = True
    end
    object qAgendamentosdata: TDateField
      FieldName = 'data'
      Required = True
    end
    object qAgendamentoshora: TTimeField
      FieldName = 'hora'
      Required = True
    end
    object qAgendamentossituacao: TSmallintField
      FieldName = 'situacao'
      Required = True
    end
    object qAgendamentosstatus: TSmallintField
      FieldName = 'status'
      Required = True
    end
    object qAgendamentosnome: TStringField
      FieldName = 'nome'
      ReadOnly = True
      Required = True
      Size = 100
    end
    object qAgendamentoscelular: TStringField
      FieldName = 'celular'
      ReadOnly = True
      Required = True
    end
    object qAgendamentosplaca: TStringField
      FieldName = 'placa'
      ReadOnly = True
      Required = True
      Size = 10
    end
    object qAgendamentoscod_produto: TIntegerField
      FieldName = 'cod_produto'
    end
    object qAgendamentosproduto: TMemoField
      FieldName = 'produto'
      ReadOnly = True
      Required = True
      BlobType = ftMemo
    end
    object qAgendamentosfeito_por: TMemoField
      FieldName = 'feito_por'
      BlobType = ftMemo
    end
    object qAgendamentoscriado: TDateTimeField
      FieldName = 'criado'
    end
    object qAgendamentoscancelado_por: TMemoField
      FieldName = 'cancelado_por'
      BlobType = ftMemo
    end
    object qAgendamentoscancelado: TDateTimeField
      FieldName = 'cancelado'
    end
    object qAgendamentosverificado_por: TMemoField
      FieldName = 'verificado_por'
      BlobType = ftMemo
    end
    object qAgendamentosverificado: TDateTimeField
      FieldName = 'verificado'
    end
  end
  object qMotorista: TUniQuery
    Connection = UniMainModule.Conexao
    SQL.Strings = (
      'select * from motorista'
      'where status = 1'
      'order by nome')
    Left = 144
    Top = 112
    object qMotoristacod: TIntegerField
      FieldName = 'cod'
    end
    object qMotoristacpf: TStringField
      FieldName = 'cpf'
      Required = True
      EditMask = '999.999.999-99;0;_'
      Size = 15
    end
    object qMotoristanome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 100
    end
    object qMotoristasenha: TStringField
      FieldName = 'senha'
      Required = True
      Size = 100
    end
    object qMotoristacelular: TStringField
      FieldName = 'celular'
      Required = True
    end
    object qMotoristastatus: TSmallintField
      FieldName = 'status'
      Required = True
    end
  end
  object qFuncionamento: TUniQuery
    Connection = UniMainModule.Conexao
    SQL.Strings = (
      'select f.*,'
      '    case '
      '       WHEN dia_semana = 1 THEN '#39'DOMINGO'#39
      '       WHEN dia_semana = 2 THEN '#39'SEGUNDA-FEIRA'#39
      '       WHEN dia_semana = 3 THEN '#39'TER'#199'A-FEIRA'#39
      '       WHEN dia_semana = 4 THEN '#39'QUARTA-FEIRA'#39
      '       WHEN dia_semana = 5 THEN '#39'QUINTA-FEIRA'#39
      '       WHEN dia_semana = 6 THEN '#39'SEXTA-FEIRA'#39
      '       WHEN dia_semana = 7 THEN '#39'S'#193'BADO'#39
      '    END AS DIA_DA_SEMANA'
      'from funcionamento f '
      'where status = 1'
      'order by dia_semana')
    Left = 144
    Top = 200
    object qFuncionamentocod: TIntegerField
      FieldName = 'cod'
    end
    object qFuncionamentodia_semana: TSmallintField
      FieldName = 'dia_semana'
      Required = True
    end
    object qFuncionamentohora_inicio: TTimeField
      FieldName = 'hora_inicio'
    end
    object qFuncionamentohora_fim: TTimeField
      FieldName = 'hora_fim'
    end
    object qFuncionamentointervalo_inicio: TTimeField
      FieldName = 'intervalo_inicio'
    end
    object qFuncionamentointervalo_fim: TTimeField
      FieldName = 'intervalo_fim'
    end
    object qFuncionamentosituacao: TSmallintField
      FieldName = 'situacao'
      Required = True
    end
    object qFuncionamentostatus: TSmallintField
      FieldName = 'status'
      Required = True
    end
    object qFuncionamentodia_da_semana: TMemoField
      FieldName = 'dia_da_semana'
      ReadOnly = True
      BlobType = ftMemo
    end
    object qFuncionamentohora_inicio2: TTimeField
      FieldName = 'hora_inicio2'
    end
    object qFuncionamentohora_fim2: TTimeField
      FieldName = 'hora_fim2'
    end
    object qFuncionamentohora_inicio3: TTimeField
      FieldName = 'hora_inicio3'
    end
    object qFuncionamentohora_fim3: TTimeField
      FieldName = 'hora_fim3'
    end
  end
  object qVeiculos: TUniQuery
    Connection = UniMainModule.Conexao
    SQL.Strings = (
      
        'select v.cod, v.cod_motorista, v.placa, v.placa || '#39' - Eixos: '#39' ' +
        '|| v.eixos || '#39' - '#39' || v.modelo as descricao, v.modelo, v.eixos,' +
        ' v.status from veiculo v'
      'where v.status = 1 and v.cod_motorista = :cod '
      'order by placa ')
    Left = 248
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cod'
        Value = nil
      end>
    object qVeiculoscod: TIntegerField
      FieldName = 'cod'
    end
    object qVeiculosplaca: TStringField
      FieldName = 'placa'
      Required = True
      Size = 10
    end
    object qVeiculosdescricao: TMemoField
      FieldName = 'descricao'
      ReadOnly = True
      BlobType = ftMemo
    end
    object qVeiculosmodelo: TStringField
      FieldName = 'modelo'
      Required = True
      Size = 50
    end
    object qVeiculoseixos: TSmallintField
      FieldName = 'eixos'
      Required = True
    end
    object qVeiculosstatus: TSmallintField
      FieldName = 'status'
      Required = True
    end
    object qVeiculoscod_motorista: TIntegerField
      FieldName = 'cod_motorista'
      Required = True
    end
  end
  object qAgendamentoM: TUniQuery
    Connection = UniMainModule.Conexao
    SQL.Strings = (
      'select a.* from agendamento a')
    Left = 272
    Top = 32
    object qAgendamentoMcod: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'cod'
    end
    object qAgendamentoMpedido: TIntegerField
      FieldName = 'pedido'
      Required = True
    end
    object qAgendamentoMcod_motorista: TIntegerField
      FieldName = 'cod_motorista'
      Required = True
    end
    object qAgendamentoMcod_veiculo: TIntegerField
      FieldName = 'cod_veiculo'
      Required = True
    end
    object qAgendamentoMdata: TDateField
      FieldName = 'data'
      Required = True
    end
    object qAgendamentoMhora: TTimeField
      FieldName = 'hora'
      Required = True
    end
    object qAgendamentoMsituacao: TSmallintField
      FieldName = 'situacao'
      Required = True
    end
    object qAgendamentoMstatus: TSmallintField
      FieldName = 'status'
      Required = True
    end
    object qAgendamentoMcod_produto: TIntegerField
      FieldName = 'cod_produto'
    end
    object qAgendamentoMfeito_por: TMemoField
      FieldName = 'feito_por'
      BlobType = ftMemo
    end
    object qAgendamentoMcriado: TDateTimeField
      FieldName = 'criado'
    end
    object qAgendamentoMcancelado_por: TMemoField
      FieldName = 'cancelado_por'
      BlobType = ftMemo
    end
    object qAgendamentoMcancelado: TDateTimeField
      FieldName = 'cancelado'
    end
  end
  object qRelCarregamentos: TUniQuery
    Connection = UniMainModule.Conexao
    SQL.Strings = (
      'select ag.data, ag.hora, ag.pedido, m.nome, v.placa,'
      'case '
      '  when ag.situacao = 2 then '#39'Cancelado'#39' '
      '  else '#39'Realizado'#39' end as tipo,'
      '  ag.feito_por, ag.criado '
      'from agendamento ag'
      'inner join motorista m on (ag.cod_motorista = m.cod)'
      'inner join veiculo v on (ag.cod_veiculo = v.cod)'
      'where '
      '    case when :d1::date is null and :d2::date is null '
      '      then ag.situacao in(2,3) and ag.status = 1'
      
        '    else (ag."data" between :d1 and :d2) and ag.situacao in(2,3)' +
        ' and ag.status = 1'
      '    end'
      'order by ag.situacao desc, ag.data, ag.hora')
    Left = 248
    Top = 192
    ParamData = <
      item
        DataType = ftDate
        Name = 'd1'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftDate
        Name = 'd2'
        ParamType = ptInput
        Value = nil
      end>
    object qRelCarregamentosdata: TDateField
      FieldName = 'data'
      Required = True
    end
    object qRelCarregamentoshora: TTimeField
      FieldName = 'hora'
      Required = True
    end
    object qRelCarregamentospedido: TIntegerField
      FieldName = 'pedido'
      Required = True
    end
    object qRelCarregamentosnome: TStringField
      FieldName = 'nome'
      ReadOnly = True
      Required = True
      Size = 100
    end
    object qRelCarregamentosplaca: TStringField
      FieldName = 'placa'
      ReadOnly = True
      Required = True
      Size = 10
    end
    object qRelCarregamentostipo: TMemoField
      FieldName = 'tipo'
      ReadOnly = True
      BlobType = ftMemo
    end
    object qRelCarregamentosfeito_por: TMemoField
      FieldName = 'feito_por'
      BlobType = ftMemo
    end
    object qRelCarregamentoscriado: TDateTimeField
      FieldName = 'criado'
    end
  end
  object qProdutos: TUniQuery
    Connection = UniMainModule.Conexao
    SQL.Strings = (
      'select * from produtos '
      'where status = 1'
      'order by nome ')
    Left = 344
    Top = 112
    object qProdutoscod: TIntegerField
      FieldName = 'cod'
    end
    object qProdutosnome: TMemoField
      FieldName = 'nome'
      Required = True
      BlobType = ftMemo
    end
    object qProdutosmaximo: TSmallintField
      FieldName = 'maximo'
      Required = True
    end
    object qProdutosstatus: TSmallintField
      FieldName = 'status'
      Required = True
    end
    object qProdutosdisponivel: TSmallintField
      FieldName = 'disponivel'
      Required = True
    end
  end
  object qRelAgendaDia: TUniQuery
    Connection = UniMainModule.Conexao
    SQL.Strings = (
      'select ag.data, ag.hora, ag.pedido, m.nome, v.placa,'
      '  case when ag.situacao = 2 then '#39'Cancelado'#39' else '
      
        '    case when ag.situacao = 3 then '#39'Realizado'#39' else '#39'Agendado'#39' e' +
        'nd '
      '  end as tipo,'
      '  ag.feito_por, ag.criado '
      'from agendamento ag'
      'inner join motorista m on (ag.cod_motorista = m.cod)'
      'inner join veiculo v on (ag.cod_veiculo = v.cod)'
      'where ag."data" = :d1 and ag.status = 1'
      'order by ag.situacao desc, ag.data, ag.hora')
    Left = 248
    Top = 280
    ParamData = <
      item
        DataType = ftDate
        Name = 'd1'
        ParamType = ptInput
        Value = nil
      end>
    object DateField1: TDateField
      FieldName = 'data'
      Required = True
    end
    object TimeField1: TTimeField
      FieldName = 'hora'
      Required = True
    end
    object IntegerField1: TIntegerField
      FieldName = 'pedido'
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'nome'
      ReadOnly = True
      Required = True
      Size = 100
    end
    object StringField2: TStringField
      FieldName = 'placa'
      ReadOnly = True
      Required = True
      Size = 10
    end
    object MemoField1: TMemoField
      FieldName = 'tipo'
      ReadOnly = True
      BlobType = ftMemo
    end
    object qRelAgendaDiafeito_por: TMemoField
      FieldName = 'feito_por'
      BlobType = ftMemo
    end
    object qRelAgendaDiacriado: TDateTimeField
      FieldName = 'criado'
    end
  end
  object qParametros: TUniQuery
    Connection = UniMainModule.Conexao
    SQL.Strings = (
      'select * from parametros'
      'where cod = 1')
    Left = 144
    Top = 280
    object qParametrosintervalo_agenda: TSmallintField
      FieldName = 'intervalo_agenda'
      Required = True
    end
    object qParametrosagenda_antecipa: TSmallintField
      FieldName = 'agenda_antecipa'
    end
    object qParametroscod: TIntegerField
      FieldName = 'cod'
    end
    object qParametrosversao: TStringField
      FieldName = 'versao'
      Required = True
      Size = 10
    end
    object qParametrosmsg_ver: TStringField
      FieldName = 'msg_ver'
      Size = 255
    end
    object qParametrosforca_updt: TSmallintField
      FieldName = 'forca_updt'
      Required = True
    end
    object qParametrosagenda_no_dia: TSmallintField
      FieldName = 'agenda_no_dia'
      Required = True
    end
    object qParametroshoras_agenda_no_dia: TTimeField
      FieldName = 'horas_agenda_no_dia'
    end
  end
  object qRelAdendaDetalhado: TUniQuery
    Connection = UniMainModule.Conexao
    SQL.Strings = (
      
        'select ag.data, ag.hora, ag.pedido, m.nome, v.placa, p.nome as p' +
        'roduto,'
      '  case when ag.situacao = 2 then '#39'Cancelado'#39' else '
      
        '    case when ag.situacao = 3 then '#39'Realizado'#39' else '#39'Agendado'#39' e' +
        'nd '
      '  end as tipo,'
      '  ag.feito_por, ag.criado '
      'from agendamento ag'
      'inner join motorista m on (ag.cod_motorista = m.cod)'
      'inner join veiculo v on (ag.cod_veiculo = v.cod)'
      'inner join produtos p on (p.cod = ag.cod_produto)'
      'where  '
      '  case when :situacao::int is null then'
      '      case when :produto::int is null then '
      '        (ag."data" between :d1 and :d2) and ag.status = 1  '
      
        '        else (ag."data" between :d1 and :d2) and ag.status = 1 a' +
        'nd p.cod = :produto end '
      '     else'
      
        '       case when :produto::int is null then (ag."data" between :' +
        'd1 and :d2) and ag.status = 1 and ag.situacao = :situacao'
      
        '       else (ag."data" between :d1 and :d2) and ag.status = 1 an' +
        'd ag.situacao = :situacao and p.cod = :produto  end '
      '   end '
      'order by produto, ag.data, ag.hora')
    Left = 248
    Top = 344
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'situacao'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'produto'
        Value = nil
      end
      item
        DataType = ftDate
        Name = 'd1'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'd2'
        Value = nil
      end>
    object qRelAdendaDetalhadodata: TDateField
      FieldName = 'data'
      Required = True
    end
    object qRelAdendaDetalhadohora: TTimeField
      FieldName = 'hora'
      Required = True
    end
    object qRelAdendaDetalhadopedido: TIntegerField
      FieldName = 'pedido'
      Required = True
    end
    object qRelAdendaDetalhadonome: TStringField
      FieldName = 'nome'
      ReadOnly = True
      Required = True
      Size = 100
    end
    object qRelAdendaDetalhadoplaca: TStringField
      FieldName = 'placa'
      ReadOnly = True
      Required = True
      Size = 10
    end
    object qRelAdendaDetalhadoproduto: TMemoField
      FieldName = 'produto'
      ReadOnly = True
      Required = True
      BlobType = ftMemo
    end
    object qRelAdendaDetalhadotipo: TMemoField
      FieldName = 'tipo'
      ReadOnly = True
      BlobType = ftMemo
    end
    object qRelAdendaDetalhadofeito_por: TMemoField
      FieldName = 'feito_por'
      BlobType = ftMemo
    end
    object qRelAdendaDetalhadocriado: TDateTimeField
      FieldName = 'criado'
    end
  end
end
