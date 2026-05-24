package be.iccbxl.pid.reservations_springboot.repository;

import be.iccbxl.pid.reservations_springboot.model.Show;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ShowRepository extends CrudRepository<Show, Long> {

    Show findById(long id);

    @Query("SELECT DISTINCT s FROM Show s JOIN s.tags t WHERE t.tag LIKE %:keyword%")
    List<Show> findByKeyword(@Param("keyword") String keyword);

    @Query("SELECT s FROM Show s WHERE s NOT IN (SELECT DISTINCT s2 FROM Show s2 JOIN s2.tags t WHERE t.tag = :tag)")
    List<Show> findShowsWithoutTag(@Param("tag") String tag);
}
