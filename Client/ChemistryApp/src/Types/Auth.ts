export class User {
    private id : number ;
    private email : string  ;
    private name : string  ;
    private role : string  ;
    private password : string  ;
    constructor(id : number , email : string  , name : string  , role : string  , password : string ){
        this.id = id ;
        this.email = email ;
        this.name = name ;
        this.role = role ;
        this.password = password ;
    }
    public getEmail() : string {
        return this.email ;
    }
    public getName() : string {
        return this.name ;
    }
    public getRole() : string {
        return this.role ;
    }
    public getPassword() : string {
        return this.password ;
    }
    public getId() : number {   
        return this.id ;
    }

}