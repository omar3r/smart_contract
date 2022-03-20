pragma solidity ^0.4.11;

contract SAVD_Contract {
    uint public _p_id =0;
    uint public _u_id =0;
    
   
   
    
    struct product {
        string _product_name;
        uint _product_cost;
        string _product_specs;
        
        address _product_owner;
        uint _manufacture_date;
      
    }
    
    mapping(uint => product) public products;
    
    struct participant {
        string _userName;
        
        address _address;
        string _userType;
       
    }
    mapping(uint => participant) public participants;
    
    function createParticipant(string name  ,address u_add ,string utype) public returns (uint){
        uint user_id = _u_id++;
        participants[user_id]._userName = name ;
        
        participants[user_id]._address = u_add;
        participants[user_id]._userType = utype;
        
        return user_id;
    }
    
    function newProduct(uint own_id, string name ,uint p_cost ,string p_specs ) returns (uint) {
        if(keccak256(participants[own_id]._userType) == keccak256("Manufacturer")) {
            uint product_id = _p_id++;
           
            
            products[product_id]._product_name = name;
            products[product_id]._product_cost = p_cost;
            products[product_id]._product_specs =p_specs;
            
            products[product_id]._product_owner = participants[own_id]._address;
            products[product_id]._manufacture_date = now;
            
           
            
            return product_id;
        }
        
       return 0;
    }
    function getParticipant(uint p_id) returns (string,address,string) {
        return (participants[p_id]._userName,participants[p_id]._address,participants[p_id]._userType);
    }
    function getProduct_details(uint prod_id) public returns (string,uint,string,address){
        return (products[prod_id]._product_name,products[prod_id]._product_cost,products[prod_id]._product_specs,products[prod_id]._product_owner);
    }

 
 
   

}