export async function fetchMenuItems() {
    const res = await fetch('http://localhost:8002/services/menuItems');
    if (!res.ok) throw new Error('Failed to load menu items');
    return res.json();
}

export async function fetchBranches() {
    const res = await fetch('http://localhost:8002/services/branches');
    if (!res.ok) throw new Error('Failed to load branches');
    return res.json();
}

export async function fetchCategories() {
    const res = await fetch('http://localhost:8002/services/categories');
    if (!res.ok) throw new Error('Failed to load categories');
    return res.json();
}