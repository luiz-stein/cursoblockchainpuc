pragma solidity >=0.5.11;
contract ProjetoMouse
{
    address  payable private addressEmpresa;
    address  payable private addressCliente;
    address  payable private addressTerceiro;

    string private nomeCliente; 
    string private nomeProjeto;
    uint256 private valorProjeto;
    
    uint256 private saldoTerceiro;
    bool private sinalPago;
    bool private produtoFoiAprovado;

    constructor ( string memory cliente, 
                  address payable conta_cliente,
                  string memory nome_do_projeto,
                  uint256 valor_em_ether,
                  address payable conta_terceiro) public
    {
        nomeCliente = cliente;
        addressCliente = conta_cliente;
        addressTerceiro = conta_terceiro;
        addressEmpresa = msg.sender;
        
        nomeCliente = nome_do_projeto;
        valorProjeto = valor_em_ether * 1 ether;
    }
    
     /* liberar para teste
    constructor () public
    {
        nomeCliente = "Empresa Mouse";
        addressCliente = 0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C;
        addressTerceiro =0x4B0897b0513fdC7C541B6d9D7E929C4e5364D2dB;
        addressEmpresa = msg.sender;
        
        nomeProjeto = "Projeto Mouse Sem Rabo";
        valorProjeto = 2 ether;
    }
    */
    
    //funcoes admninistrativas
    function DescricaoProjeto() public view returns( string memory cliente, 
                                                     string memory nome_do_projeto,
                                                     uint256 valor_do_projeto_em_ether)
    {
        return(
                cliente = nomeCliente, 
                nome_do_projeto = nomeProjeto, 
                valor_do_projeto_em_ether = ( valorProjeto/(1 ether) ) );
    }
    
    function ContaCliente() public view returns(address conta)
    {
        return(conta=addressCliente);
    }
     
     function Contratado() public view returns( string memory empresa,
                                                address conta )
    {
        return(empresa="Empresa Faz Tudo", conta=addressCliente);
    }
    
    function SaldoTercerizado() view public returns( uint256 )
    {
        return saldoTerceiro;
    }

    // Aceitar e Produzir
    
    function AceiteContrato() public payable somenteTransacaoCliente
    {   
        require( sinalPago == false, "ja foi feito o adiantamento de 50% do valor do contrato" );

        saldoTerceiro = msg.value / 2;
        
        sinalPago = true;

    }
    
    function IniciarProducao() public payable sinalFoiDepositado
    {
        addressEmpresa.transfer( address(this).balance / 2 );
        addressTerceiro.transfer( address(this).balance / 2 );
    }
    
    // aprovacao e encerraamento de contrato
    
    function ProdutoAprovado() public payable somenteTransacaoCliente sinalFoiDepositado
    {
        addressEmpresa.transfer( msg.value );
        
        produtoFoiAprovado = true;
    }
    
    function EncerrarContrato() public somenteTransacaoEmpresa
    {
        require( produtoFoiAprovado, "o cliente ainda não aprovou o produto" );
        
        selfdestruct(addressEmpresa);
    }
    
    
    
    // Modificadores
    modifier somenteTransacaoCliente 
    {
        require(msg.sender == addressCliente, "somente o cliente podera efetuar o aceite do contrato" );
        require( 2 * (valorProjeto -  msg.value  ) == valorProjeto, "O valor transferido deve ser a metade do valor do contrato");
        _;
    }

    modifier somenteTransacaoEmpresa 
    {
       require( msg.sender == addressEmpresa, "somente a empresa podera fazer esta transacao");
       _;
    }
    
    modifier sinalFoiDepositado
    {
        require( sinalPago, "nao foi feito o adiantamento de 50% do valor do contrato" );
        _;
    }
    
    //

}
