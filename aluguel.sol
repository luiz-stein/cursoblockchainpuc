pragma solidity 0.5.12;

/*

- não ha decimais em solidity
- uint256 = uint (inteiros) em bytes
- address = endereco ethereum
- constant = constante
- memory = informa o compilador para nao armazenar no blockchain
- view =  use view if your function does not modify storage

*/

contract Aluguel
{
    string public locatario;
    string public locador;
    uint256 private valor;
    
    uint8 constant numero_maximo_legal_de_alugueis_para_multa = 3;
    
    //
    
    constructor( string memory nome_do_locador, string memory nome_do_locatario, uint256 valor_do_aluguel ) public
    {
        locador = nome_do_locador;
        locatario = nome_do_locatario;
        valor = valor_do_aluguel;
    }
    
    //
    
    function ValorAtualDoAluguel() public view returns(uint256)
    {
        return valor;
    }
    
    //
    
    function SimulaMulta( uint256 meses_restantes, uint256 valor_meses_do_contrato) public view returns(uint256 valor_da_multa)
    {
        valor_da_multa = valor * numero_maximo_legal_de_alugueis_para_multa;
        valor_da_multa = valor_da_multa / valor_meses_do_contrato;
        valor_da_multa = valor_da_multa * meses_restantes;
        
        return valor_da_multa;
    }
}

