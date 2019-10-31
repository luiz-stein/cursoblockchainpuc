pragma solidity >=0.5.11;
contract ProjetoMouse
{
    address  payable private addressEmpresa;
    address  payable private addressCliente;
    address  payable private addressTerceiro;

    string private nomeCliente; 
    string private nomeProjeto;
    uint256 private valorProjeto;
    uint256 private sinalPago;
    
    constructor () public
    {
        nomeCliente = "Empresa Mouse";
        addressCliente = 0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C;
        addressTerceiro = 0x4B0897b0513fdC7C541B6d9D7E929C4e5364D2dB;
        addressEmpresa = msg.sender;
        
        nomeProjeto = "Projeto Mouse Sem Rabo";
        valorProjeto = 2 * (1 ether);
    }
    
    /*
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
        valorProjeto = valor_em_ether * (1 ether);
    }
    
    */
    
    function DescricaoProjeto() public view returns( string memory cliente, 
                                                     string memory nome_do_projeto,
                                                     uint256 valor_do_projeto_em_ether)
    {
        return((cliente = nomeCliente), nome_do_projeto = nomeProjeto, valor_do_projeto_em_ether = ( valorProjeto/(1 ether) ) );
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
    
    function AceiteContrato(uint256 sinal_em_ether) public payable 
    {
        
    }

    
    
    
    
}
