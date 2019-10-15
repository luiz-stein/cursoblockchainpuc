pragma solidity ^0.5.11;

contract AbatimentoAnual
{
    int256 private valorDividaAtual = 1000000;
    uint[] private anoPagamento;
    int[] private valorPagoAno;
    uint8 private abatimento = 10;

    // informa ano do pagamento Pagamento
    
    function pagamentoAnual(uint ano, int valorPago) public
    {
        anoPagamento.push( ano );
        valorPagoAno.push( valorPago );
    }
    
    
    
    // ver a divida atual
    function dividaAtual() public view returns(int256)
    {
        return valorDividaAtual;
    }
    
    //
    
    function atualizarDividaAnual() public
    {
        require( anoPagamento.length > 0, "informar os anos de pagamento");

        int256 dividaCorrigida =  valorDividaAtual;
        uint256 anoAtual = anoPagamento[ 0 ];
        
        for (uint8 i = 0; i < anoPagamento.length; i++)
        {
            if ( anoAtual == anoPagamento[ i ] )
            {
                dividaCorrigida = dividaCorrigida - valorPagoAno[ i ];
                
                if ( dividaCorrigida <= 0 )
                {
                    dividaCorrigida = 0;
                    break;
                }
                
                dividaCorrigida = dividaCorrigida - ( (dividaCorrigida * abatimento) / 100);
                
                 if ( dividaCorrigida <= 0 )
                {
                    dividaCorrigida = 0;
                    break;
                }
            }
            
            anoAtual++;
        }
        
        valorDividaAtual = dividaCorrigida;
    }
}
