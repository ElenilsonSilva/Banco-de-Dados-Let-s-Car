-- procedure Modalidade Pagamento
CALL InserirModalidadePagamento('Dinheiro');
CALL InserirModalidadePagamento('Cartão');
CALL InserirModalidadePagamento('Prestação');

-- procedures Carro
CALL InserirCarro('Volvo', 'S60', '2022', 'Vermelho', 90.950, 1);
CALL InserirCarro('Chevrolet', 'Onix LTS 1.0', '2022', 'Prata', 79.145, 3);
CALL InserirCarro('Fiat', 'UNO', '2010', 'Branco', 30.600, 2);

CALL VerTodosCarros();
CALL VerCarrosMarca('Volvo');
CALL VerCarrosModelo('S60');
CALL VerCarrosAno(2022);
CALL VerCarrosCor('Prata');

-- procedures Adicionais
CALL InserirTiposAdicionais('Ar Condicionado');
CALL InserirTiposAdicionais('Brindado');
CALL InserirTiposAdicionais('Vidro Elétrico');
CALL VerAdicionais();

-- procedures Adicionado
CALL InserirAdicionado(1, 1); 
CALL InserirAdicionado(1, 2); 
CALL InserirAdicionado(2, 2); 
CALL InserirAdicionado(3, 3); 
CALL VerAdicionados();

-- procedures Cliente
CALL InserirCliente('Elenilson', '(91) 99999-0000');
CALL InserirCliente('Alice', '(91) 99999-0000');
CALL InserirCliente('Rodrigo', '(91) 99999-0000');
CALL InserirCliente('Júnior', '(91) 99999-0000');
CALL VerTodosClientes();
CALL VerClientesId(2);
CALL EditarDadosCliente(3, 'Carlos', '(91) 9000-0000');
-- procedures favoritar
CALL InserirFavorito(1, 1);
CALL InserirFavorito(1, 2);
CALL InserirFavorito(2, 3);
CALL InserirFavorito(2, 4);
CALL InserirFavorito(3, 2);
CALL VerFavoritos(1);

-- procedures Contato
CALL InserirContato(1, '9396-0000', 'Promoção de fim de ano desse carro');
CALL InserirContatoCliente(1, 2, 'outras formas de pagamento desse carro');
CALL VerMensagensContato();




