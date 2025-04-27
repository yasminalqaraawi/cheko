import React from 'react';
import { BrowserRouter as Router, Routes, Route, NavLink } from 'react-router-dom';
import Home from './pages/Home';
import MapView from './pages/Map';

const App = () => {
  return (
    <Router>
      <div className="min-h-screen bg-white dark:bg-gray-900 text-gray-900 dark:text-white">
        <header className="p-4 flex justify-between items-center border-b border-gray-300 dark:border-gray-700">
          <h1 className="text-xl font-bold">CHEKO</h1>
          <nav className="space-x-4">
            <NavLink to="/" className={({ isActive }) => isActive ? 'font-semibold' : ''}>Home</NavLink>
            <NavLink to="/map" className={({ isActive }) => isActive ? 'font-semibold' : ''}>Map</NavLink>
          </nav>
        </header>
        <main className="p-4">
          <Routes>
            <Route path="/" element={<Home />} />
            <Route path="/map" element={<MapView />} />
          </Routes>
        </main>
      </div>
    </Router>
  );
};

export default App;
