using CAPA_APLICATION.DTOs;
using CAPA_APLICATION.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CAPA_APLICATION.Services
{
    public class EstadoServices
    {

        private readonly IEstadosRepository _Repository;

        public EstadoServices(IEstadosRepository repository)
        {
            _Repository = repository;
        }

        //Listar Estado //



        public async Task<IEnumerable <EstadoDTOs>> ListarEstado()
        {
            var listar = await _Repository.ListarEstadoAsync();

            return listar.Select(p => new EstadoDTOs
            {
                EstadoId = p.EstadoId,
                NombreEstado = p.NombreEstado,


            });
        }

        public async Task<IEnumerable<EstadoDTOs>> ListarNombre(string Buscar)
        {
            if (string.IsNullOrWhiteSpace(Buscar))
                return Enumerable.Empty<EstadoDTOs>();

            var lista = await _Repository.ListarEstadoPorNombreAsync();

            return lista.Select(p => new EstadoDTOs
            {
                EstadoId = p.EstadoId,
                NombreEstado = p.NombreEstado,


            });

        }
    }
}
