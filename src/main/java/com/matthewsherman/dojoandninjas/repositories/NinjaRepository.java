package com.matthewsherman.dojoandninjas.repositories;

import java.util.List;

import com.matthewsherman.dojoandninjas.models.Ninja;

import org.springframework.data.repository.CrudRepository;

public interface NinjaRepository extends CrudRepository<Ninja, Long>{
    List<Ninja> findAll();
    List<Ninja> findByDojo_Id(Long id);

    
}