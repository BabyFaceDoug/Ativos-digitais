// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.19;

import "./owner.sol";
import "./titulo.sol";

/** Contrato Duplicata: 0xc210e181Ad06f43bea39dDfD74bBfe9eFbdf2aeb */

/**
 * @title Duplicata
 * @dev Operacoes de uma dupicata
 * @author Vanusa costa
 */
 contract Duplicata is Titulo, Owner {

    string _emissor;
    string _sacado;
    uint256 immutable _dataEmissao;
    uint256 _valor;
    uint8 immutable _decimais;
    uint256 _prazoPagamento;

    constructor() {
        _emissor = "Casas Comerciais LTDA";
        _sacado = "Vanusa Costa";
        _dataEmissao = block.timestamp;
        _valor = 200000;
        _decimais = 2;
        _prazoPagamento = _dataEmissao + 30 days;
        emit NovoPrazoPagamento(_dataEmissao, _prazoPagamento);
    }

    /**
     * @dev Retorna o valor nominal.
     */
    function valorNominal() external view returns (uint256) {
        return _valor;
    }

    /**
     * @dev Retorna o nome do Emissor.
     */
    function nomeEmissor() external view returns (string memory) {
        return _emissor;
    }

    /**
     * @dev Retorna o nome do Sacado.
     */
    function nomeSacado() external view returns (string memory) {
        return _sacado;
    }

    /**
     * @dev Retorna a data da emissao.
     */
    function dataEmissao() external view returns (uint256) {
        return _dataEmissao;
    }

    /**
    * @dev muda o prazo de pagamento
    * @notice dependendo da situacao economica o prazo de pagamento pode mudar
    * @param prazoPagamento_ novo prazo de pagamentos a ser adicionado. Em segundos
    */
    function mudaDataPagamento(uint256 prazoPagamento_) external onlyOwner returns (uint256) {
        emit NovoPrazoPagamento(_prazoPagamento, _prazoPagamento + prazoPagamento_);
        _prazoPagamento = _prazoPagamento + prazoPagamento_;
        return _prazoPagamento;
    }

 }
