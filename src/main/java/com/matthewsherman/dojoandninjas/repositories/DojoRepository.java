package com.matthewsherman.dojoandninjas.repositories;



import java.util.List;

import com.matthewsherman.dojoandninjas.models.Dojo;

import org.springframework.data.repository.CrudRepository;


public interface DojoRepository extends CrudRepository<Dojo, Long>{
    List<Dojo> findAll();

    
}