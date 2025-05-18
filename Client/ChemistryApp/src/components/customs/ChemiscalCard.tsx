import { Chemiscal } from "../../Types/Chemiscal";

interface ChemiscalCardProps {
  chemical: Chemiscal;
}

const ChemiscalCard = ({ chemical }: ChemiscalCardProps) => {
  return (
    <div className=" w-1/3 flex gap-4 justify-center items-center bg-gray-100 p-4 rounded-lg shadow-md">
        <img className="w-50 h-50" src={chemical.getImage()} alt={chemical.getName()} />
       <div className="flex flex-col gap-2">
        <p className="text-lg text-gray-500">Symbol: {chemical.getSymbol()}</p>
       <h1 className="text-lg font-bold">{chemical.getName()}</h1>
        <p className="text-sm text-gray-500">Description: {chemical.getDescription()}</p>
        <p className="text-sm text-gray-500">Hazard Information: {chemical.getHazard_infor()}</p>
        <p className="text-sm text-gray-500">Atomic Weight: {chemical.getAtomicWeight()}</p>
       </div>
    </div>
  )
}

export default ChemiscalCard