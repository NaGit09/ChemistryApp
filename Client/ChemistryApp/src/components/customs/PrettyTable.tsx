import { Elemential } from '@/types/Elemential'

interface PrettyTableProps {
  data: Elemential[],
  onClick?: (e: Elemential) => void
}

const PrettyTable = ({ data, onClick }: PrettyTableProps) => {
  return (
    <table className="w-full border-collapse">
      <tbody>
        {data.map((element, index) => (
          <tr 
            key={index}
            onClick={() => onClick?.(element)}
            className="cursor-pointer hover:bg-gray-100"
          >
            <td>{element.getName()}</td>
            <td>{element.getSymbol()}</td>
          </tr>
        ))}
      </tbody>
    </table>
  )
}

export default PrettyTable