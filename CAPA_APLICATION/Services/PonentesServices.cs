using CAPA_APLICATION.DTOs;
using CAPA_APLICATION.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CAPA_APLICATION.Services
{
    public class PonentesServices
    {


        private readonly IPonentesRepository _RepositoryPonentes;

        public PonentesServices(IPonentesRepository repository)
        {
            _RepositoryPonentes = repository;
        }

        //Listar Poenenr //



        public async Task<IEnumerable<PonentesDTOs>> ListarPonente()
        {
            var listar = await _RepositoryPonentes.ListarPonenteAsync();

            return listar.Select(p => new PonentesDTOs
            {
                PonenteId = p.PonenteId,
                Nombre = p.Nombre,
                EstadoId = p.EstadoId,

                


            });
        }

        public async Task<IEnumerable<PonentesDTOs>> ListarNombrePonente(string Buscar)
        {
            if (string.IsNullOrWhiteSpace(Buscar))
                return Enumerable.Empty<PonentesDTOs>();

            var lista = await _RepositoryPonentes.ListarPonentePorNombreAsync();

            return lista.Select(p => new PonentesDTOs
            {
                PonenteId = p.PonenteId,
                Nombre = p.Nombre,
                EstadoId = p.EstadoId,


            });

        }
    }
}
