package com.example.cheko.dal.repository;
import com.example.cheko.dal.model.MenuItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MenuItemRepository extends JpaRepository<MenuItem, Long> {
    List<MenuItem> findByNameContainingIgnoreCase(String name);

    @Query(value = "select m.* from (select m.*, row_number() over (partition by category_id order by calories desc) as seqnum from menu_items m ) m where seqnum = 2;",
            nativeQuery = true)
    List<MenuItem> findSecondMaxCaloriesByCategory();
}

