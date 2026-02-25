using CAPA_APLICATION.DTOs;
using CAPA_APLICATION.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CAPA_APLICATION.Services
{
    public class RolesServices
    {

        private readonly IRolesRepository _RepositoryRoles;

        public RolesServices(IRolesRepository repository)
        {
            _RepositoryRoles = repository;
        }

        //Listar Roles //



        public async Task<IEnumerable<RolesDTOs>> ListarRoles()
        {
            var listar = await _RepositoryRoles.ListarRolesAsync();

            return listar.Select(p => new RolesDTOs
            {
               RolId = p.RolId,
                NombreRol = p.NombreRol,
                EstadoId = p.EstadoId,



            });
        }

        public async Task<IEnumerable<RolesDTOs>> ListarNombreRoles(string Buscar)
        {
            if (string.IsNullOrWhiteSpace(Buscar))
                return Enumerable.Empty<RolesDTOs>();

            var lista = await _RepositoryRoles.ListarRolesAsync();

            return lista.Select(p => new RolesDTOs
            {
                RolId = p.RolId,
                NombreRol = p.NombreRol,
                EstadoId = p.EstadoId,


            });

        }

    }
}
