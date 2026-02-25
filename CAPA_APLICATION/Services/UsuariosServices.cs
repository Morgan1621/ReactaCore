using CAPA_APLICATION.DTOs;
using CAPA_APLICATION.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CAPA_APLICATION.Services
{
    public class UsuariosServices
    {
        private readonly IUsuariosRepository _RepositoryuSUARIOS;

        public UsuariosServices(IUsuariosRepository repository)
        {
            _RepositoryuSUARIOS = repository;
        }

        //Listar usuario //



        public async Task<IEnumerable<UsuarioDTOs>> ListarUsuario()
        {
            var listar = await _RepositoryuSUARIOS.ListarUsuarioAsync();

            return listar.Select(p => new UsuarioDTOs
            {
                UsuarioId = p.UsuarioId,
                Nombre = p.Nombre,
                Correo = p.Correo,
                RolId = p.RolId,
                EstadoId = p.EstadoId,


            });
        }

        public async Task<IEnumerable<UsuarioDTOs>> ListarNombreUsuario(string Buscar)
        {
            if (string.IsNullOrWhiteSpace(Buscar))
                return Enumerable.Empty<UsuarioDTOs>();

            var lista = await _RepositoryuSUARIOS.ListarUsuarioPorNombreAsync();

            return lista.Select(p => new UsuarioDTOs
            {
                UsuarioId = p.UsuarioId,
                Nombre = p.Nombre,
                Correo = p.Correo,
                RolId = p.RolId,
                EstadoId = p.EstadoId,


            });

        }


    }
}
