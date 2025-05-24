import { getTypesElemential } from "@/lib/utils";
import { Elemential } from "@/types/Elemential";
interface ChemiscalProps {
  e: Elemential;
  onClick?: () => void;
}

const ElementialCard = ({ e, onClick }: ChemiscalProps) => {
  const shapeClass = getTypesElemential(e.getTypeId());
  return (
    <button
      className={`w-[100px] h-[100px] relative ${shapeClass}`}
      onClick={onClick}
      draggable={true}
    >

      <div className="absolute inset-0 border-4 border-Alkali top-0">
      <div className="w-full h-full flex flex-col items-center justify-between p-1 text-Alkali text-[7px] font-semibold">
        <div className="w-full flex items-center justify-between">
          <span className="text-[8px]">{e.getId()}</span>
          <span className="">{e.getName()}</span>
        </div>
        <p className="text-xl font-bold">{e.getSymbol()}</p>
        <p className="text-start text-sm w-full">{e.getAtomicMass()}</p>
      </div>
      </div>
    </button>
  );
};

export default ElementialCard;
