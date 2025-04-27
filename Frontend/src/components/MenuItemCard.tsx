import React, { useState } from 'react';
import { MenuItem } from '../types/MenuItem';

type Props = {
  item: MenuItem;
  onClick: () => void;
};

const MenuItemCard = ({ item, onClick }: Props) => {
  const [count, setCount] = useState(0);

  return (
    <div className="border rounded-lg p-4 shadow cursor-pointer hover:shadow-md" onClick={onClick}>
      <img src={item.image_url} alt={item.name} className="w-full h-40 object-cover rounded" />
      <h2 className="font-bold text-lg mt-2">{item.name}</h2>
      <p className="text-sm text-gray-500">{item.description}</p>
      <div className="flex justify-between items-center mt-2">
        <span>${item.price.toFixed(2)}</span>
        <div className="flex items-center gap-2">
          <button onClick={e => { e.stopPropagation(); setCount(Math.max(0, count - 1)); }} className="px-2 bg-gray-300 rounded">-</button>
          <span>{count}</span>
          <button onClick={e => { e.stopPropagation(); setCount(count + 1); }} className="px-2 bg-gray-300 rounded">+</button>
        </div>
      </div>
    </div>
  );
};

export default MenuItemCard;
