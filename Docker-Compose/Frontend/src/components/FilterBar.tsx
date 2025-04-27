type Props = {
    search: string;
    setSearch: (value: string) => void;
    typeFilter: string;
    setTypeFilter: (value: string) => void;
    categoryNames: string[];
};

const FilterBar = ({ search, setSearch, typeFilter, setTypeFilter, categoryNames }: Props) => {
    return (
        <div className="flex flex-col sm:flex-row justify-between items-center gap-4">
            <input
                type="text"
                placeholder="Search for a dish..."
                value={search}
                onChange={e => setSearch(e.target.value)}
                className="p-2 border rounded w-full sm:w-1/2"
            />
            <select
                value={typeFilter}
                onChange={e => setTypeFilter(e.target.value)}
                className="p-2 border rounded"
            >
                <option value="All">All</option>
                {categoryNames.map(name => (
                    <option key={name} value={name}>{name}</option>
                ))}
            </select>
        </div>
    );
};

export default FilterBar;
