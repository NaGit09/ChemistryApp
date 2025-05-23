import { useDrop } from 'react-dnd';
import { Elemential } from '@/Types/Elemential';
import { useRef } from 'react';

interface Props {
  onItemDrop: (item: Elemential) => void;
  children: React.ReactNode;
}

export const DropZone: React.FC<Props> = ({ onItemDrop, children }) => {
    const ref = useRef<HTMLDivElement>(null);
    const [{ isOver }, dropRef] = useDrop(() => ({
        accept: 'ITEM',
        drop: (item: Elemential) => onItemDrop(item),
        collect: (monitor) => ({
            isOver: !!monitor.isOver(),
        }),
    }));

    dropRef(ref);

    return (
        <div
            ref={ref}
            className={`w-[100px] h-[100px] border-2 border-dashed rounded-lg ${isOver ? 'border-blue-500' : 'border-gray-300'}`}
            
        >
            {children && (children)}
        </div>
    );
};
