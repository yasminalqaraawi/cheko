import React from 'react';
import { MenuItem } from '../types/MenuItem';

type Props = {
  item: MenuItem;
  onClose: () => void;
};

const DetailsModal = ({ item, onClose }: Props) => {
  return (
    <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
      <div className="bg-white dark:bg-gray-800 p-6 rounded-lg max-w-md w-full relative">
        <button onClick={onClose} className="absolute top-2 right-2">✖</button>
        <img src={item.image_url} alt={item.name} className="w-full h-48 object-cover rounded" />
        <h2 className="text-2xl font-bold mt-2">{item.name}</h2>
        <p className="text-sm my-2">{item.description}</p>
        <div className="text-sm">Calories: {item.calories}</div>
        <div className="text-sm">Price: ${item.price.toFixed(2)}</div>
      </div>
    </div>
  );
};

export default DetailsModal;
