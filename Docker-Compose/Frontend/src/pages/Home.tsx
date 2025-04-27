import React, { useEffect, useState } from 'react';
import FilterBar from '../components/FilterBar';
import MenuItemCard from '../components/MenuItemCard';
import DetailsModal from '../components/DetailsModal';
import { MenuItem } from '../types/MenuItem';
import { Categories } from '../types/Categories';
import { fetchMenuItems, fetchCategories } from '../api/services';

const Home = () => {
    const [search, setSearch] = useState('');
    const [typeFilter, setTypeFilter] = useState('All');
    const [menuItems, setMenuItems] = useState<MenuItem[]>([]);
    const [categories, setCategories] = useState<Categories[]>([]);
    const [selectedItem, setSelectedItem] = useState<MenuItem | null>(null);

    useEffect(() => {
        async function loadData() {
            try {
                const [items, cat] = await Promise.all([
                    fetchMenuItems(),
                    fetchCategories()
                ]);
                setMenuItems(items);
                setCategories(cat);
            } catch (e) {
                console.error("Failed to fetch menu or categories:", e);
            }
        }
        loadData();
    }, []);

    const selectedCategory = categories.find(c => c.name === typeFilter);

    const filteredItems = menuItems.filter(item =>
        (!selectedCategory || item.category_id === selectedCategory.id) &&
        (item.name.toLowerCase().includes(search.toLowerCase()) ||
            item.description.toLowerCase().includes(search.toLowerCase()))
    );

    return (
        <div>
            <FilterBar
                search={search}
                setSearch={setSearch}
                typeFilter={typeFilter}
                setTypeFilter={setTypeFilter}
                categoryNames={categories.map(c => c.name)}
            />

            <div className="flex gap-4 my-4">
                {categories.map(cat => (
                    <div key={cat.id} className="bg-blue-100 dark:bg-blue-800 p-4 rounded-lg">
                        <div className="font-semibold">{cat.name}</div>
                        <div>{menuItems.filter(i => i.category_id === cat.id).length} items</div>
                    </div>
                ))}
            </div>

            <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-4">
                {filteredItems.map(item => (
                    <MenuItemCard
                        key={item.id}
                        item={item}
                        onClick={() => setSelectedItem(item)}
                    />
                ))}
            </div>

            {selectedItem && (
                <DetailsModal item={selectedItem} onClose={() => setSelectedItem(null)} />
            )}
        </div>
    );
};

export default Home;
