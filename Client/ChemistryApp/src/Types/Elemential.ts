export class Elemential {
    private id : number ;
    private name : string ;
    private symbol : string ;
    private atomicNumber : number ;
    private atomicMass : number ;
    private type_id : number ;
    constructor(id : number , name : string , symbol : string , atomicNumber : number , atomicMass : number , type_id : number){
        this.id = id ;
        this.name = name ;
        this.symbol = symbol ;
        this.atomicNumber = atomicNumber ;
        this.atomicMass = atomicMass ;
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
        return this.atomicNumber ;
    }
    public getAtomicMass() : number {
        return this.atomicMass ;
    }
    public getTypeId() : number {
        return this.type_id ;
    }
    
    
    
    
    
}