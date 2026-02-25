using CAPA_APLICATION.DTOs;
using CAPA_APLICATION.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CAPA_APLICATION.Services
{
    public class AsistenteServices
    {


        private readonly IAsistenteRepository _RepositoryaSISTENTE;

        public AsistenteServices(IAsistenteRepository repository)
        {
            _RepositoryaSISTENTE = repository;
        }

        //Listar eVENTO //



        public async Task<IEnumerable<AsistenteDTOs>> ListarEvento()
        {
            var listar = await _RepositoryaSISTENTE.ListarAsistenteAsync();

            return listar.Select(p => new AsistenteDTOs
            {
                AsistenteId = p.AsistenteId,
                InscripcionId = p.InscripcionId,
                EstadoId = p.EstadoId,
               

            });
        }

        public async Task<IEnumerable<AsistenteDTOs>> ListarNombreAsistente(string Buscar)
        {
            if (string.IsNullOrWhiteSpace(Buscar))
                return Enumerable.Empty<AsistenteDTOs>();

            var lista = await _RepositoryaSISTENTE.ListarAsistenteAsync();

            return lista.Select(p => new AsistenteDTOs
            {
                AsistenteId = p.AsistenteId,
                InscripcionId = p.InscripcionId,
                EstadoId = p.EstadoId,

            });

        }
    }
}
