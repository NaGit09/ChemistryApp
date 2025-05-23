export class Elemential {
     id : number ;
     name : string ;
     symbol : string ;
     atomicNumber : number ;
     atomic_weight : number ;
     type_id : number ;
    constructor(id : number , name : string , symbol : string , atomicNumber : number , atomic_weight : number , type_id : number){
        this.id = id ;
        this.name = name ;
        this.symbol = symbol ;
        this.atomicNumber = atomicNumber ;
        this.atomic_weight = atomic_weight ;
        this.type_id = type_id ;
    }
    public getId() : number {
        return this.id ;
    }
    public getName() : string {
        return this.name ;
    }
    public getSymbol() : string {
        return this.symbol ;
    }
    public getAtomicNumber() : number {
        return this.atomic_weight ;
    }
    public getAtomicMass() : number {
        return this.atomic_weight ;
    }
    public getTypeId() : number {
        return this.type_id ;
    }
    
    
    
    
    
}