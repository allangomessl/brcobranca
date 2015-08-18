# -*- encoding: utf-8 -*-
require 'spec_helper'

RSpec.describe Brcobranca::Remessa::Cnab400::Base do
  let(:pagamento) do
    Brcobranca::Remessa::Pagamento.new(valor: 199.9,
                                       data_vencimento: Date.today,
                                       nosso_numero: 123,
                                       documento_sacado: '12345678901',
                                       nome_sacado: 'nome',
                                       endereco_sacado: 'endereco',
                                       bairro_sacado: 'bairro',
                                       cep_sacado: '12345678',
                                       cidade_sacado: 'cidade',
                                       uf_sacado: 'SP')
  end
  let(:params) do
    { empresa_mae: 'teste',
      agencia: '123',
      conta_corrente: '1234',
      digito_conta: '1',
      pagamentos: [pagamento] }
  end
  let(:cnab400) { subject.class.new(params) }

  context 'sobrescrita dos metodos' do
    it 'mostrar aviso sobre sobrecarga de métodos padrões' do
      expect { cnab400.monta_detalhe(Brcobranca::Remessa::Pagamento.new, 1) }.to raise_error(Brcobranca::NaoImplementado, 'Sobreescreva este método na classe referente ao banco que você esta criando')
      expect { cnab400.info_conta }.to raise_error(Brcobranca::NaoImplementado, 'Sobreescreva este método na classe referente ao banco que você esta criando')
      expect { cnab400.cod_banco }.to raise_error(Brcobranca::NaoImplementado, 'Sobreescreva este método na classe referente ao banco que você esta criando')
      expect { cnab400.nome_banco }.to raise_error(Brcobranca::NaoImplementado, 'Sobreescreva este método na classe referente ao banco que você esta criando')
      expect { cnab400.complemento }.to raise_error(Brcobranca::NaoImplementado, 'Sobreescreva este método na classe referente ao banco que você esta criando')
    end
  end
end
