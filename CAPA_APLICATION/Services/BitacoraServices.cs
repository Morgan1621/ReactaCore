using CAPA_APLICATION.DTOs;
using CAPA_APLICATION.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CAPA_APLICATION.Services
{
    public class BitacoraServices
    {


        private readonly IBitacoraRepository _RepositoryBitacora;

        public BitacoraServices(IBitacoraRepository repository)
        {
            _RepositoryBitacora = repository;
        }

        //Listar bitacora //



        public async Task<IEnumerable<BitacoraDTOs>> ListarBitacora()
        {
            var listar = await _RepositoryBitacora.ListarBitacoraAsync();

            return listar.Select(p => new BitacoraDTOs
            {
                BitacoraId = p.BitacoraId,
                UsuarioId = p.UsuarioId,
                Accion = p.Accion,
                Fecha = p.Fecha,
                

            });
        }

        public async Task<IEnumerable<BitacoraDTOs>> ListarNombreBitacora(string Buscar)
        {
            if (string.IsNullOrWhiteSpace(Buscar))
                return Enumerable.Empty<BitacoraDTOs>();

            var lista = await _RepositoryBitacora.ListarBitacoraPorNombreAsync();

            return lista.Select(p => new BitacoraDTOs
            {
                BitacoraId = p.BitacoraId,
                UsuarioId = p.UsuarioId,
                Accion = p.Accion,
                Fecha = p.Fecha,

            });

        }
    }
}
