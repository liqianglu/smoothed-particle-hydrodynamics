#include "particle-data-structures.h"
#include "simulation-parameters.h"

#include "calculate-field.h"
#include "integrate.h"

#include "test-functions.h"
#include <cstdio>
#include <cassert>

int main() {

    gri_to_pl_map_t grid_to_particle_list_map = gen_grid_to_particle_list_map();

    pi_to_gri_map_t last_particle_to_grid_map = gen_particle_to_grid_map();
    pi_to_gri_map_t curr_particle_to_grid_map = gen_particle_to_grid_map();

    pi_to_pa_map_t particle_idx_to_addr_map = gen_particle_idx_to_addr_map();

#if 0
    printf("initialization\n");
    initialize_dam_break(grid_to_particle_list_map,
                         last_particle_to_grid_map,
                         curr_particle_to_grid_map,
                         particle_idx_to_addr_map);

    assert(host_grid_consistency_check(grid_to_particle_list_map));

    printf("deletion\n");
    delete_particles_test(grid_to_particle_list_map,
                          curr_particle_to_grid_map,
                          particle_idx_to_addr_map);

    assert(host_grid_consistency_check(grid_to_particle_list_map));

    printf("insert\n");
    insert_particles_test(grid_to_particle_list_map,
                          curr_particle_to_grid_map,
                          particle_idx_to_addr_map);

    assert(host_grid_consistency_check(grid_to_particle_list_map));
#endif

    calculate_density_test(grid_to_particle_list_map,
                           curr_particle_to_grid_map,
                           particle_idx_to_addr_map);



}

