using CAPA_APLICATION.DTOs;
using CAPA_APLICATION.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CAPA_APLICATION.Services
{
    public class InscripcionesServices
    {

        private readonly IInscripcionRepository _RepositoryiNSCRIPCION;

        public InscripcionesServices(IInscripcionRepository repository)
        {
            _RepositoryiNSCRIPCION = repository;
        }

        //Listar iNSCRIPCION //



        public async Task<IEnumerable<InscripcionesDTOs>> ListarInscripcion()
        {
            var listar = await _RepositoryiNSCRIPCION.ListarinscripcionesAsync();

            return listar.Select(p => new InscripcionesDTOs
            {
                InscripcionId = p.InscripcionId,
                UsuarioId = p.UsuarioId,
                EventoId = p.EventoId,
                EstadoId = p.EstadoId,




            });
        }

        public async Task<IEnumerable<InscripcionesDTOs>> ListarNombreInscripcion(string Buscar)
        {
            if (string.IsNullOrWhiteSpace(Buscar))
                return Enumerable.Empty<InscripcionesDTOs>();

            var lista = await _RepositoryiNSCRIPCION.ListarinscripcionesPorNombreAsync();

            return lista.Select(p => new InscripcionesDTOs
            {
                InscripcionId = p.InscripcionId,
                UsuarioId = p.UsuarioId,
                EventoId = p.EventoId,
                EstadoId = p.EstadoId,

            });

        }


    }
}
