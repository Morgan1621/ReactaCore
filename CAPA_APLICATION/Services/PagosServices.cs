using CAPA_APLICATION.DTOs;
using CAPA_APLICATION.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CAPA_APLICATION.Services
{
    public class PagosServices
    {


        private readonly IPagoRepository _RepositoryPago;

        public PagosServices(IPagoRepository repository)
        {
            _RepositoryPago = repository;
        }

        //Listar eVENTO //



        public async Task<IEnumerable<PagosDTOs>> ListarEvento()
        {
            var listar = await _RepositoryPago.ListarPagoAsync();

            return listar.Select(p => new PagosDTOs
            {
                PagoId = p.PagoId,
                InscripcionId = p.InscripcionId,
                MetodoPagoId = p.MetodoPagoId,
                Monto = p.Monto,
                EstadoId = p.EstadoId,
                

            });
        }

        public async Task<IEnumerable<PagosDTOs>> ListarNombrepAGO(string Buscar)
        {
            if (string.IsNullOrWhiteSpace(Buscar))
                return Enumerable.Empty<PagosDTOs>();

            var lista = await _RepositoryPago.ListarPagoPorNombreAsync();

            return lista.Select(p => new PagosDTOs
            {
                PagoId = p.PagoId,
                InscripcionId = p.InscripcionId,
                MetodoPagoId = p.MetodoPagoId,
                Monto = p.Monto,
                EstadoId = p.EstadoId,


            });

        }
    }
}
