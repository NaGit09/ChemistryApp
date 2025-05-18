export class Chemiscal {
    private id : number ;
    private name : string ;
    private atomic_weight : number ;
    private symbol : string ;
    private type_id : number;
    private hazard_infor : string ;
    private status : string;
    private description : string;
    private image : string;
    constructor(id : number , name : string , atomic_weight : number , symbol : string , type_id : number , hazard_infor : string , status : string , description : string , image : string){
        this.id = id ;
        this.name = name ;
        this.atomic_weight = atomic_weight ;
        this.symbol = symbol ;
        this.type_id = type_id ;
        this.hazard_infor = hazard_infor ;
        this.status = status ;
        this.description = description ;
        this.image = image ;
    }
    public getId() : number {
        return this.id ;
    }
    public getName() : string {
        return this.name ;
    }
    public getAtomicWeight() : number {
        return this.atomic_weight ;
    }
    public getSymbol() : string {
        return this.symbol ;
    }
    public getType_id() : number {
        return this.type_id ;
    }
    public getHazard_infor() : string {
        return this.hazard_infor ;
    }
    public getStatus() : string {
        return this.status ;
    }
    public getDescription() : string {
        return this.description ;
    }
    public getImage() : string {
        return this.image ;
    }
}
