using CAPA_APLICATION.DTOs;
using CAPA_APLICATION.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CAPA_APLICATION.Services
{
    public class OrganizadoresServices
    {
        private readonly IOrganizadoresRepository _RepositoryOrganizadores;

        public OrganizadoresServices(IOrganizadoresRepository repository)
        {
            _RepositoryOrganizadores = repository;
        }

        //Listar usuario //



        public async Task<IEnumerable<OrganizadoresDTOs>> ListarUsuario()
        {
            var listar = await _RepositoryOrganizadores.ListarOrganizadoresAsync();

            return listar.Select(p => new OrganizadoresDTOs
            {
                OrganizadorId = p.OrganizadorId,
                UsuarioId = p.UsuarioId,
               


            });
        }

        public async Task<IEnumerable<OrganizadoresDTOs>> ListarNombreOrganizadores(string Buscar)
        {
            if (string.IsNullOrWhiteSpace(Buscar))
                return Enumerable.Empty<OrganizadoresDTOs>();

            var lista = await _RepositoryOrganizadores.ListarOrganizadoresPorNombreAsync();

            return lista.Select(p => new OrganizadoresDTOs
            {
                OrganizadorId = p.OrganizadorId,
                UsuarioId = p.UsuarioId,


            });

        }

    }
}
