export class Experiment {
  id: number;
  chemiscal_1: number;
  chemiscal_2: number;
  description: string;
  constructor(
    id: number,
    chemiscal_1: number,
    chemiscal_2: number,
    description: string
  ) {
    this.id = id;
    this.chemiscal_1 = chemiscal_1;
    this.chemiscal_2 = chemiscal_2;
    this.description = description;
  }
  getId(): number {
    return this.id;
  }
  getChemiscal1(): number {
    return this.chemiscal_1;
  }
  getChemiscal2(): number {
    return this.chemiscal_2;
  }
  getDescription(): string {
    return this.description;
  }
}
