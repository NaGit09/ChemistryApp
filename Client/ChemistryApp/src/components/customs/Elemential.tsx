const getTypes = (type: number) => {
  switch (type) {
    case 1:
      return "rounded-br-lg"; // Bo tròn góc dưới bên phải
    case 2:
      return "clip-polygon"; // Hình polygon custom
    default:
      return "";
  }
};

interface ChemiscalProps {
  type: number;
  name: string;
  symbol: string;
  atomicNumber: number;
  atomicMass: number;
  onClick?: () => void;
}
const Elemential = ({
  type,
  name,
  symbol,
  atomicNumber,
  atomicMass,
  onClick,
}: ChemiscalProps) => {
  const shapeClass = getTypes(type);

  return (
    <button
      className={`w-[65px] h-[65px] relative ${shapeClass}`}
      onClick={onClick}
    >
      <div className="absolute inset-0 border-2 border-Alkali"></div>
      <div className="w-full h-full flex flex-col items-center justify-center p-1 text-Alkali text-[7px] font-semibold">
        <div className="w-full flex items-center justify-between">
          <span className="text-[8px]">{atomicNumber}</span>
          <span>{name}</span>
        </div>
        <p className="text-3xl font-bold">{symbol}</p>
        <p className="text-start w-full">{atomicMass}</p>
      </div>
    </button>
  );
};

export default Elemential;
