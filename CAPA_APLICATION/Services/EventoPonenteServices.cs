using CAPA_APLICATION.DTOs;
using CAPA_APLICATION.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CAPA_APLICATION.Services
{
    public class EventoPonenteServices
    {

        private readonly IEventoPonenteRepository _RepositoryEventoPonente;

        public EventoPonenteServices(IEventoPonenteRepository repository)
        {
            _RepositoryEventoPonente = repository;
        }

        //Listar EVENTOPOENENTE //



        public async Task<IEnumerable<EventoPonenteDTOs>> ListarEventoPonente()
        {
            var listar = await _RepositoryEventoPonente.ListarEventoPONENTEPorNombreAsync();

            return listar.Select(p => new EventoPonenteDTOs
            {
                EventoId = p.EventoId,
                PonenteId = p.PonenteId,
                

            });
        }

        public async Task<IEnumerable<EventoPonenteDTOs>> ListarNombreEventoPonente(string Buscar)
        {
            if (string.IsNullOrWhiteSpace(Buscar))
                return Enumerable.Empty<EventoPonenteDTOs>();

            var lista = await _RepositoryEventoPonente.ListarEventoPONENTEPorNombreAsync();

            return lista.Select(p => new EventoPonenteDTOs
            {
                EventoId = p.EventoId,
                PonenteId = p.PonenteId,


            });

        }

    }
}
