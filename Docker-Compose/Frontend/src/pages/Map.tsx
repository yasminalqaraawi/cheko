import React, { useEffect, useRef, useState } from 'react';
import mapboxgl from 'mapbox-gl';
import { Branch } from '../types/Branch';
import { fetchBranches } from '../api/services';

mapboxgl.accessToken = 'pk.eyJ1IjoieWFzbWluYWxxYXJhYXdpIiwiYSI6ImNtOThiOGk4bzAxM3gyanM2eHh3aWRvd2YifQ.jw-BTXOWEOUxwkb__vpbVg';

const MapView = () => {
  const mapContainer = useRef<HTMLDivElement>(null);
  const [branches, setBranches] = useState<Branch[]>([]);

  useEffect(() => {
    const loadBranches = async () => {
      try {
        const data = await fetchBranches();
        setBranches(data);
      } catch (err) {
        console.error("Failed to fetch branches:", err);
      }
    };
    loadBranches();
  }, []);

  useEffect(() => {
    if (!mapContainer.current || branches.length === 0) return;

    const map = new mapboxgl.Map({
      container: mapContainer.current,
      style: 'mapbox://styles/mapbox/streets-v11',
      center: [46.6753, 24.7136], // Riyadh
      zoom: 11,
    });

    map.on('load', () => {
      branches.forEach(branch => {
        new mapboxgl.Marker()
            .setLngLat([branch.longitude, branch.latitude])
            .setPopup(
                new mapboxgl.Popup({ offset: 45 }).setHTML(`
                  <div style="text-align: center;">
                  <b>CHEKO ${branch.district}</b>
                  <p>${branch.district || ''}</p>
                  <p>${branch.opening_hours || ''}</p>
               `)
            )
            .addTo(map);
      });
    });

    return () => map.remove();
  }, [branches]);

  return (
      <div ref={mapContainer} className="h-[80vh] w-full rounded shadow" />
  );
};

export default MapView;
