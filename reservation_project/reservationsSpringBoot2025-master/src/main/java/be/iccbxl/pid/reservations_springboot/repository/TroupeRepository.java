package be.iccbxl.pid.reservations_springboot.repository;

import be.iccbxl.pid.reservations_springboot.model.Troupe;
import org.springframework.data.repository.CrudRepository;

public interface TroupeRepository extends CrudRepository<Troupe, Long> {
    Troupe findById(long id);
}
