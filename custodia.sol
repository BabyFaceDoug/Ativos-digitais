SPDX-License-Identificador: GPL-3.0
Solidez Pragma 0.8.19;

importar "./owner.sol";
importação "./titulo.sol";

/**
 * @title Custódia
 * @dev Armazena e controla a custódia de vários títulos do proprietário
 * @author Jeff Prestes
 */
 contrato Custodia é Proprietário {

  endereço[] títulos particulares;

  /**
 * @dev Adiciona um título à custódia
 * @param título endereco do título a ser adicionado
   */
  function adicionaTitulo(address titulo) external onlyOwner {
 titulos. empurrar (titulo);
  }

  /**
 * @dev Retorna a quantidade de títulos na custódia
   */
  função quantidadeTitulos() external view returns (uint256) {
    retorno titulos. comprimento;
  }

  /**
 * @dev Retorna o endereço de um título na custódia
 * @param Index posição do título na custódia
   */
  função enderecoTitulo(uint256 index)  public view retorna (endereço) {
    títulos de retorno[índice];
  }

  /**
 * @dev Retorna dados de um título na custódia
 * @param Index posição do título na custódia
   * @return valorNominal, nomeEmissor, dataEmissao
   */
  função detalheTitulo(uint256 index) external view retorna (uint256, string memory, uint256) {
 Titulo titulo = Titulo(enderecoTitulo(index));
    retorno (titulo.valorNominal(), titulo. nomeEmissor(), titulo. dataEmissao());
  }
 }
 53 alterações: 53 adições e 0 exclusões53  
nuclea-aula07/debêntures.sol
@@ -0,0 +1,53 @@
SPDX-License-Identificador: GPL-3.0
Solidez Pragma 0.8.19;

importar "./owner.sol";
importação "./titulo.sol";

/**
 * @title Custódia
 * @dev Armazena e controla a custódia de vários títulos do proprietário
 * @author Jeff Prestes
 */
 contrato Custodia é Proprietário {

  endereço[] títulos particulares;

  evento NovoTituloEmCustodia(endereço enderecoNovoTitulo, string emissor);

  /**
 * @dev Adiciona um título à custódia
 * @param _enderecoTitulo endereço do título a ser adicionado
   */
  função adicionaTitulo(address _enderecoTitulo) external onlyOwner {
 Titulo titulo = Titulo(_enderecoTitulo);
    require(titulo.valorNominal() > 1000, "Valor muito baixo para ser custodiado");
 titulos. empurrar(_enderecoTitulo);
    emitir NovoTituloEmCustodia(endereço(titulo), titulo.nomeEmissor());
  }

  /**
 * @dev Retorna a quantidade de títulos na custódia
   */
  função quantidadeTitulos() external view returns (uint256) {
    retorno titulos. comprimento;
  }

  /**
 * @dev Retorna o endereço de um título na custódia
 * @param Index posição do título na custódia
   */
  função enderecoTitulo(uint256 index)  public view retorna (endereço) {
    títulos de retorno[índice];
  }

  /**
 * @dev Retorna dados de um título na custódia
 * @param Index posição do título na custódia
   * @return valorNominal, nomeEmissor, dataEmissao
   */
  função detalheTitulo(uint256 index) external view retorna (uint256, string memory, uint256) {
 Titulo titulo = Titulo(enderecoTitulo(index));
    retorno (titulo.valorNominal(), titulo. nomeEmissor(), titulo. dataEmissao());
  }
 }
