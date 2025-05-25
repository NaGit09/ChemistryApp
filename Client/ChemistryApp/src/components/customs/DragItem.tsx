import { Elemential } from "@/types/Elemential";
import { useDrag } from "react-dnd";
import { useRef } from "react";
import ElementialCard from "./ElementialCard";
interface DragItemProps {
    elemential: Elemential;
}

const DragItem = ({ elemential }: DragItemProps) => {
    // Create a reference to the DOM element for drag-and-drop functionality
    const ref = useRef<HTMLDivElement>(null); 
    // useDrag hook from react-dnd to make the item draggable
    const [, dragRef] = useDrag(() => ({
        type: 'ITEM',
        item: elemential,
        // This function is called when the item is being dragged
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
