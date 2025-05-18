import { useEffect, useState } from "react";
import ChemiscalCard from "@/components/customs/ChemiscalCard";
import SearchFild from "@/components/customs/SearchFild";
import { Chemiscal as ChemiscalType } from "@/Types/Chemiscal";
import useChemiscalStore from "@/Store/chemiscalStore";

const Chemiscal = () => {
  const { chemicals , fetchChemicals } = useChemiscalStore();
  const [searchText, setSearchText] = useState("");
  const [filteredChemicals, setFilteredChemicals] = useState<ChemiscalType[]>([]);


  // Gọi API mỗi lần người dùng thay đổi searchText
  useEffect(() => {
    fetchChemicals();
    const filteredChemicals = chemicals.filter((chemical) => chemical.getName().includes(searchText));
    setFilteredChemicals(filteredChemicals);
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [ searchText]);


  return (
    <div className="w-full flex flex-col items-center justify-start h-screen p-4 gap-4">
      <SearchFild
        onChange={(e: React.ChangeEvent<HTMLInputElement>) =>
          setSearchText(e.target.value)
        }
      />

        <div className="w-full flex flex-wrap gap-4 justify-center items-center">
        {searchText.length > 0 ? filteredChemicals.map((chemical) => (
            <ChemiscalCard key={chemical.getId()} chemical={chemical} />
          )) : chemicals.map((chemical) => (
            <ChemiscalCard key={chemical.getId()} chemical={chemical} />
          ))}        
      </div>
    </div>
  );
};

export default Chemiscal;
