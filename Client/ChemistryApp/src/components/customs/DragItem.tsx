import { Elemential } from "@/Types/Elemential";
import { useDrag } from "react-dnd";
import { useRef } from "react";
import ElementialCard from "./ElementialCard";
interface DragItemProps {
    elemential: Elemential;
}

const DragItem = ({ elemential }: DragItemProps) => {
    const ref = useRef<HTMLDivElement>(null);
    const [, dragRef] = useDrag(() => ({
        type: 'ITEM',
        item: elemential,
        collect: (monitor) => ({
            isDragging: !!monitor.isDragging(),
        }),
    }), [elemential]);

    dragRef(ref);
    
    return (
        <div
            ref={ref}
            className="cursor-move flex items-center justify-center"
        >
            <ElementialCard e={elemential} />
        </div>
    );
};

export default DragItem;
