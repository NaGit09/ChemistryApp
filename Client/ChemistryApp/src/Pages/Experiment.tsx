import DragItem from "@/components/customs/DragItem";
import { DropZone } from "@/components/customs/DropZone";
import { Elemential } from "@/types/Elemential";
import { useEffect, useState } from "react";
import { DndProvider } from "react-dnd";
import { HTML5Backend } from "react-dnd-html5-backend";
import ElementialCard from "@/components/customs/ElementialCard";
import { useElementialStore } from "@/store/elementialStore";
import Plus from "@/assets/plus-large-svgrepo-com.svg";
import Equal from "@/assets/equal-sign-svgrepo-com.svg";
import { useExperimentStore } from "@/store/experimentStore";
import Header from "@/components/customs/Header";
const ExperimentPage = () => {
  // declare state
  const { elementials, fetchElementials } = useElementialStore();
  const [selectElemential1, setSelectElemential1] = useState<Elemential>();
  const [selectElemential2, setSelectElemential2] = useState<Elemential>();
  const { Experiments, fetchExperiments } = useExperimentStore();
  // declare function
  const handleItemDrop1 = (item: Elemential) => {
    setSelectElemential1(item);
  };
  const handleItemDrop2 = (item: Elemential) => {
    setSelectElemential2(item);
  };
  // declare effect
  // fetch elementials from store
  useEffect(() => {
    fetchElementials();
  });
// fetch experiments from store 
  useEffect(() => {
    if (selectElemential1 && selectElemential2) {
      const id1 = selectElemential1.getId();
      const id2 = selectElemential2.getId();
      if (id1 && id2) {
        fetchExperiments(id1, id2);
      }
    }
  }, [selectElemential1, selectElemential2]);

  return (
    <div className="bg-DarkText">
      <Header />
      {/* Drap and drop zone  */}
      <DndProvider backend={HTML5Backend}>
        <div className="flex flex-col items-center justify-center gap-7 h-screen ">
          <div className="absolute-center flex-wrap gap-3">
            {elementials.map((elemential) => (
              <DragItem key={elemential.id} elemential={elemential} />
            ))}
          </div>
          <div className="absolute-center flex-wrap gap-3">
            {/* chemical 1 */}
            <DropZone onItemDrop={handleItemDrop1}>
              <div className="flex flex-wrap gap-2">
                {selectElemential1 && <ElementialCard e={selectElemential1} />}
              </div>
            </DropZone>
            <img src={Plus} alt="Plus" className="w-16 h-16" />
            {/* chemical 2 */}
            <DropZone onItemDrop={handleItemDrop2}>
              <div className="flex flex-wrap gap-2">
                {selectElemential2 && <ElementialCard e={selectElemential2} />}
              </div>
            </DropZone>
            <img src={Equal} alt="Equal" className="w-16 h-16" />
            {/* result */}
            <div className="w-[400px] h-[100px] border-2 border-dashed rounded-lg absolute-center">
              {Experiments && (
                <div className="w-full h-full flex flex-col items-center justify-center">
                  <h1 className="text-2xl font-bold text-center text-white">
                    {Experiments.getDescription() ? Experiments.getDescription() : "No result"}
                  </h1>
                </div>
              )}
            </div>
          </div>
        </div>
      </DndProvider>
    </div>
  );
};

export default ExperimentPage;
