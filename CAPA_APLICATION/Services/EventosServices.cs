using CAPA_APLICATION.DTOs;
using CAPA_APLICATION.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CAPA_APLICATION.Services
{
    public class EventosServices
    {
        private readonly IEventosRepository _RepositoryEventos;

        public EventosServices(IEventosRepository repository)
        {
            _RepositoryEventos = repository;
        }

        //Listar eVENTO //



        public async Task<IEnumerable<EventosDTOs>> ListarEvento()
        {
            var listar = await _RepositoryEventos.ListarEventosAsync();

            return listar.Select(p => new EventosDTOs
            {
                EventoId = p.EventoId,
                NombreEvento = p.NombreEvento,
                Fecha = p.Fecha,
                CategoriaId = p.CategoriaId,
                OrganizadorId = p.OrganizadorId,
                EstadoId = p.EstadoId,

             


            });
        }

        public async Task<IEnumerable<EventosDTOs>> ListarNombreEvento(string Buscar)
        {
            if (string.IsNullOrWhiteSpace(Buscar))
                return Enumerable.Empty<EventosDTOs>();

            var lista = await _RepositoryEventos.ListarEventosPorNombreAsync();

            return lista.Select(p => new EventosDTOs
            {
                EventoId = p.EventoId,
                NombreEvento = p.NombreEvento,
                Fecha = p.Fecha,
                CategoriaId = p.CategoriaId,
                OrganizadorId = p.OrganizadorId,
                EstadoId = p.EstadoId,


            });

        }


    }
}
