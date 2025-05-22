import { getTypesElemential } from "@/lib/utils";
import { Elemential } from "@/Types/Elemential";
interface ChemiscalProps {
  e: Elemential;
  onClick?: () => void;
}
const ElementialCard = ({ e, onClick }: ChemiscalProps) => {
  const shapeClass = getTypesElemential(e.getTypeId());

  return (
    <button
      className={`w-[65px] h-[65px] relative ${shapeClass}`}
      onClick={onClick}
    >
      <div className="absolute inset-0 border-2 border-Alkali"></div>
      <div className="w-full h-full flex flex-col items-center justify-center p-1 text-Alkali text-[7px] font-semibold">
        <div className="w-full flex items-center justify-between">
          <span className="text-[8px]">{e.getAtomicNumber()}</span>
          <span>{e.getName()}</span>
        </div>
        <p className="text-3xl font-bold">{e.getSymbol()}</p>
        <p className="text-start w-full">{e.getAtomicMass()}</p>
      </div>
    </button>
  );
};

export default ElementialCard;
