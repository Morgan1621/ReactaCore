using CAPA_APLICATION.DTOs;
using CAPA_APLICATION.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CAPA_APLICATION.Services
{
    public class AsistenciaServices
    {


        private readonly IAsistenciaRepository _RepositoryAsistencia;

        public AsistenciaServices(IAsistenciaRepository repository)
        {
            _RepositoryAsistencia = repository;
        }

        //Listar eVENTO //



        public async Task<IEnumerable<AsistenciaDTOs>> ListarAsistencia()
        {
            var listar = await _RepositoryAsistencia.ListarAsistenciaAsync();

            return listar.Select(p => new AsistenciaDTOs
            {
                AsistenciaId = p.AsistenciaId,
                AsistenteId = p.AsistenteId,
                Asistio = p.Asistio,
               
            });
        }

        public async Task<IEnumerable<AsistenciaDTOs>> ListarNombreAsistencia(string Buscar)
        {
            if (string.IsNullOrWhiteSpace(Buscar))
                return Enumerable.Empty<AsistenciaDTOs>();

            var lista = await _RepositoryAsistencia.ListarAsistenciaPorNombreAsync();

            return lista.Select(p => new AsistenciaDTOs
            {
                AsistenciaId = p.AsistenciaId,
                AsistenteId = p.AsistenteId,
                Asistio = p.Asistio,
            });

        }
    }
}
